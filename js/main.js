// Avvio, schermate e navigazione.
import { t, raw, applicaTesti } from './i18n.js';
import { PALETTES, PERSONAGGI, INCROCI, CAPITOLI, CHAT_NOME } from './data.js';
import * as save from './save.js';
import { Renderer, renderStatico } from './render.js';
import { Partita, caricaStoria } from './engine.js';
import { sblocca, setAttivo, ambiente, sfx } from './audio.js';

const $ = (id) => document.getElementById(id);
const dati = save.carica();
const imp = dati.impostazioni;
let schermata = null, partita = null, disponibili = [], ritornoMappa = 'title', ritornoOpzioni = 'title';

const renderer = new Renderer($('view'));
const rTitolo = new Renderer($('title-canvas'));

function coloriUI(chiave) {
  const c = (PALETTES[chiave] || PALETTES.titolo).colori;
  c.forEach((v, i) => document.documentElement.style.setProperty(`--c${i}`, v));
  document.querySelector('meta[name=theme-color]').setAttribute('content', c[0]);
}

function vai(nome) {
  document.querySelectorAll('.screen').forEach((s) => { s.hidden = true; });
  const id = { title: 'scr-titolo', select: 'scr-select', game: 'scr-game', end: 'scr-end', map: 'scr-map', options: 'scr-options', credits: 'scr-credits', avviso: 'scr-avviso' }[nome];
  $(id).hidden = false; schermata = nome;
  if (nome !== 'game') { renderer.stop(); }
  if (nome === 'title') { coloriUI('titolo'); rTitolo.start(); ambiente('notte'); } else rTitolo.stop();
  if (nome === 'select') { coloriUI('titolo'); costruisciCarte(); }
  if (nome === 'map') costruisciMappa();
  if (nome === 'options') caricaOpzioni();
  if (nome === 'credits') $('credits').innerHTML = raw('crediti').map((p) => `<p>${p}</p>`).join('');
  if (nome === 'title') aggiornaCorale();
  window.scrollTo(0, 0);
}

// ---------- impostazioni ----------
function applicaImpostazioni() {
  document.body.classList.toggle('crt', !!imp.crt);
  renderer.flashRidotti = rTitolo.flashRidotti = !!imp.flash;
  setAttivo(!!imp.audio);
  $('g-mute').textContent = imp.audio ? '♪' : '×';
}
function caricaOpzioni() {
  $('opt-speed').value = imp.velocita; $('opt-crt').checked = imp.crt; $('opt-timer').checked = imp.timer; $('opt-flash').checked = imp.flash; $('opt-audio').checked = imp.audio;
}
$('opt-speed').onchange = (e) => { imp.velocita = e.target.value; save.salva(); };
['crt', 'timer', 'flash', 'audio'].forEach((k) => { $(`opt-${k}`).onchange = (e) => { imp[k] = e.target.checked; save.salva(); applicaImpostazioni(); }; });
$('opt-reset').onclick = () => { if (confirm(t('opz.conferma_reset'))) { save.resetTutto(); caricaOpzioni(); } };
$('opt-back').onclick = () => (ritornoOpzioni === 'game' ? riprendiGioco() : vai('title'));
$('map-back').onclick = () => (ritornoMappa === 'game' ? riprendiGioco() : vai(ritornoMappa));

// ---------- selezione ----------
function costruisciCarte() {
  const box = $('cards'); box.innerHTML = '';
  PERSONAGGI.forEach((id) => {
    const scheda = raw(`personaggi.${id}`), s = save.personaggio(id), ok = disponibili.includes(id);
    const c = document.createElement('div'); c.className = 'card' + (ok ? '' : ' off'); c.tabIndex = ok ? 0 : -1;
    PALETTES[id].colori.forEach((v, i) => c.style.setProperty(`--p${i}`, v));
    const cv = document.createElement('canvas'); cv.width = 160; cv.height = 200; cv.className = 'pixel';
    renderStatico(cv, `ritratto_${id}`, id);
    let stato = !ok ? t('select.prossimamente') : s.stato ? t('select.in_corso') : s.finito ? t('select.finale', { esito: t(`end.${s.esito}`) }) : t('select.non_iniziato');
    c.appendChild(cv);
    c.insertAdjacentHTML('beforeend', `<div class="nome">${scheda.nome}</div><div class="ruolo">${scheda.ruolo} · ${scheda.eta}</div><div class="frase">${scheda.frase}</div><div class="stato">${stato}</div>`);
    if (ok) {
      const azioni = document.createElement('div'); azioni.className = 'row';
      const b1 = document.createElement('button'); b1.className = 'btn small'; b1.textContent = s.stato ? t('select.continua') : t('select.nuovo');
      b1.onclick = (e) => { e.stopPropagation(); iniziaGioco(id); };
      azioni.appendChild(b1);
      if (s.stato) { const b2 = document.createElement('button'); b2.className = 'btn small'; b2.textContent = '↺'; b2.title = t('select.ricomincia');
        b2.onclick = (e) => { e.stopPropagation(); if (confirm(t('gm.conferma_ricomincia'))) { save.resetPersonaggio(id); iniziaGioco(id); } }; azioni.appendChild(b2); }
      c.appendChild(azioni);
      c.onclick = () => iniziaGioco(id);
      c.onkeydown = (e) => { if (e.key === 'Enter') iniziaGioco(id); };
    }
    box.appendChild(c);
  });
}

// ---------- gioco ----------
async function iniziaGioco(id) {
  sblocca();
  if (partita) partita.distruggi();
  coloriUI(id); renderer.setPalette(id);
  $('text').innerHTML = `<p>${t('ui.caricamento')}</p>`;
  vai('game'); renderer.start();
  try {
    const json = await caricaStoria(id);
    partita = new Partita({ id, json, renderer, impostazioni: imp, onFine: (r) => mostraFine(id, r) });
    await partita.avvia();
  } catch (e) { console.error(e); $('text').innerHTML = `<p>Errore nel caricamento della storia: ${e.message}</p>`; }
}

function riprendiGioco() { coloriUI(partita.id); vai('game'); renderer.start(); }

function mostraFine(id, { esito, recap }) {
  vai('end'); coloriUI(id);
  $('end-title').textContent = t(`end.${esito}`);
  const cv = $('end-canvas'); renderStatico(cv, `finale_${esito}`, id);
  $('end-recap').innerHTML = recap.map((r) => `<li>${r}</li>`).join('');
  sfx(esito === 'PACE' ? 'notifica' : 'granata');
  ambiente('notte');
  partita = null;
}

// input: tocco/clic sul testo o sull'immagine, Invio/Spazio per avanzare, 1-9 per scegliere
$('scr-game').addEventListener('click', (e) => {
  if (!partita || e.target.closest('button, .mini, .topbar')) return;
  partita.avanza();
});
$('continue').addEventListener('click', (e) => { e.stopPropagation(); partita && partita.avanza(); });
window.addEventListener('keydown', (e) => {
  if (schermata !== 'game' || !partita || !$('game-menu').hidden || !$('mini').hidden) return;
  if (/^[1-9]$/.test(e.key)) { partita.sceltaDaTasto(+e.key); e.preventDefault(); }
  else if (e.key === 'Enter' || e.key === ' ') {
    if (e.target.closest && e.target.closest('.choices')) return; // Invio su una scelta: la sceglie il bottone
    partita.avanza(); e.preventDefault();
  } else if (e.key === 'Escape') apriMenu();
});

function apriMenu() { $('game-menu').hidden = false; $('gm-resume').focus(); }
$('g-menu').onclick = apriMenu;
$('g-map').onclick = () => { ritornoMappa = 'game'; vai('map'); };
$('g-mute').onclick = () => { imp.audio = !imp.audio; save.salva(); applicaImpostazioni(); };
$('gm-resume').onclick = () => { $('game-menu').hidden = true; };
$('gm-options').onclick = () => { $('game-menu').hidden = true; ritornoOpzioni = 'game'; vai('options'); };
$('gm-restart').onclick = () => { if (!partita) return; if (confirm(t('gm.conferma_ricomincia'))) { const id = partita.id; $('game-menu').hidden = true; save.resetPersonaggio(id); iniziaGioco(id); } };
$('gm-quit').onclick = () => { $('game-menu').hidden = true; if (partita) { partita.distruggi(); partita = null; } vai('title'); };

// ---------- mappa ----------
function costruisciMappa() {
  const m = $('map'); m.innerHTML = '';
  const head = document.createElement('div'); head.className = 'riga head';
  head.innerHTML = '<span></span>' + PERSONAGGI.map((p) => `<span title="${CHAT_NOME[p]}">${CHAT_NOME[p].slice(0, 3).toUpperCase()}</span>`).join('');
  m.appendChild(head);
  CAPITOLI.forEach((cap, ci) => {
    const ids = Object.keys(INCROCI).filter((x) => INCROCI[x].cap === ci);
    if (!ids.length) return;
    m.insertAdjacentHTML('beforeend', `<div class="cap">${t(`capitoli.${cap}`)}</div>`);
    ids.forEach((x) => {
      const visti = dati.incroci[x] || {}, noto = Object.keys(visti).length > 0;
      const riga = document.createElement('div'); riga.className = 'riga';
      riga.innerHTML = `<span class="nome${noto ? '' : ' ignoto'}">${noto ? t(`incroci.${x}`) : t('map.ignoto')}</span>` +
        PERSONAGGI.map((p) => (INCROCI[x].chi.includes(p) ? `<span class="dot ${visti[p] ? 'seen' : 'unseen'}">${visti[p] ? '◆' : '◇'}</span>` : '<span class="dot"></span>')).join('');
      m.appendChild(riga);
    });
  });
}

// ---------- epilogo corale ----------
function aggiornaCorale() {
  const tutti = PERSONAGGI.every((p) => save.personaggio(p).finito);
  const b = $('btn-corale'); b.disabled = !tutti || !disponibili.includes('corale'); b.title = tutti ? '' : t('ui.corale_bloccato');
}
$('btn-corale').onclick = () => iniziaCorale();
async function iniziaCorale() {
  sblocca(); coloriUI('titolo'); renderer.setPalette('titolo'); vai('game'); renderer.start();
  const json = await caricaStoria('corale');
  partita = new Partita({ id: 'corale', json, renderer, impostazioni: imp, onFine: () => vai('title') });
  PERSONAGGI.forEach((p) => { partita.story.variablesState[`esito_${p}`] = save.personaggio(p).esito || 'PACE'; });
  save.resetPersonaggio('corale');
  await partita.avvia();
}

// ---------- titolo e avvio ----------
document.querySelectorAll('[data-go]').forEach((b) => b.addEventListener('click', () => { sblocca(); if (b.dataset.go === 'map') ritornoMappa = schermata === 'end' ? 'select' : 'title'; if (b.dataset.go === 'options') ritornoOpzioni = 'title'; vai(b.dataset.go); }));
$('avviso-ok').onclick = () => { imp.flash = $('avviso-flash').checked; dati.avvisoVisto = true; save.salva(); applicaImpostazioni(); sblocca(); vai('title'); };

async function avvio() {
  applicaTesti(); applicaImpostazioni();
  try { await Promise.all([document.fonts.load('10px PressStart'), document.fonts.load('16px VT323')]); } catch (e) { }
  try { disponibili = await (await fetch('story/index.json')).json(); } catch (e) { disponibili = []; }
  rTitolo.setPalette('titolo'); await rTitolo.setScena('titolo', 'titolo');
  if (!dati.avvisoVisto) vai('avviso'); else vai('title');
  // ?gioca=ines per aprire subito un personaggio (utile in sviluppo)
  const q = new URLSearchParams(location.search).get('gioca'); if (q && disponibili.includes(q)) iniziaGioco(q);
}
avvio();
