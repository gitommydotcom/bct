// Esecuzione della storia Ink: pagine, macchina da scrivere, scelte, chat, timer, salvataggio.
import { Story } from '../vendor/ink.mjs';
import { t } from './i18n.js';
import { CHAT_NOME } from './data.js';
import * as save from './save.js';
import { sfx, ambiente } from './audio.js';
import { avviaMini } from './mini.js';

const $ = (id) => document.getElementById(id);
const VELOCITA = { lenta: 38, normale: 20, veloce: 9, istantanea: 0 };
const ROMPE_PAGINA = ['img', '---', 'chat', '/chat', 'capitolo'];

export function parseTag(tag) {
  const i = tag.indexOf(':');
  return i < 0 ? { k: tag.trim(), v: '' } : { k: tag.slice(0, i).trim(), v: tag.slice(i + 1).trim() };
}

function esc(s) { return s.replace(/[&<>"]/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c])); }
// ‹francese=traduzione›: il francese resta, con la traduzione italiana accanto.
// _corsivo_ per pensieri, scritte e titoli.
const GLOSSA = /‹([^›]+)›/g;
function divide(inner) { const i = inner.lastIndexOf('='); return i < 0 ? [inner, ''] : [inner.slice(0, i), inner.slice(i + 1)]; }
export function formatta(s) {
  return esc(s)
    .replace(GLOSSA, (m, inner) => { const [fr, it] = divide(inner); return `<span class="fr">${fr}</span>${it ? `<span class="gl">${it}</span>` : ''}`; })
    .replace(/_([^_]+)_/g, '<em>$1</em>');
}
// testo semplice per la macchina da scrivere
export function piano(s) {
  return s.replace(GLOSSA, (m, inner) => { const [fr, it] = divide(inner); return it ? `${fr} (${it})` : fr; }).replace(/_([^_]+)_/g, '$1');
}

const storieCache = {};
export async function caricaStoria(id) {
  if (!storieCache[id]) {
    const r = await fetch(`story/${id}.json`);
    if (!r.ok) throw new Error(`storia ${id} non trovata`);
    storieCache[id] = await r.text();
  }
  return storieCache[id];
}

export class Partita {
  constructor({ id, json, renderer, impostazioni, onFine, onCambioPalette }) {
    this.id = id; this.r = renderer; this.imp = impostazioni; this.onFine = onFine;
    this.story = new Story(json);
    this.story.onError = (msg) => console.error('[ink]', msg);
    this.pendente = null;     // riga già letta che apre la pagina successiva
    this.ctx = { img: null, cap: '', ora: '', fx: [], amb: null, chat: null, lavagna: [] };
    this.token = 0; this.skip = null; this.timer = null; this.inScelta = false;
    this.elText = $('text'); this.elChoices = $('choices'); this.elCont = $('continue');
    this.elChat = $('chat'); this.elChatLog = $('chat-log'); this.elChatHead = $('chat-head');
  }

  // ---------- avvio / ripristino ----------
  async avvia() {
    const s = save.personaggio(this.id);
    if (s.stato && s.pagina) {
      try {
        this.story.state.LoadJson(s.stato);
        await this.applicaContesto(s.pagina.ctx, true);
        this.mostraRigheIstantanee(s.pagina.righe);
        this.aggiornaUmore();
        this.mostraScelte();
        return;
      } catch (e) { console.warn('salvataggio non valido, ricomincio', e); }
    }
    this.prossimaPagina();
  }

  // ---------- costruzione pagina ----------
  leggiPagina() {
    const righe = [];
    while (true) {
      let riga;
      if (this.pendente) { riga = this.pendente; this.pendente = null; }
      else if (this.story.canContinue) {
        const testo = this.story.Continue();
        riga = { testo: testo.replace(/\n$/, ''), tags: (this.story.currentTags || []).map(parseTag) };
      } else break;
      const rompe = riga.tags.some((tg) => ROMPE_PAGINA.includes(tg.k) && !(tg.k === '---' && this.inChat(righe)));
      if (rompe && righe.length) { this.pendente = riga; break; }
      righe.push(riga);
    }
    return righe;
  }

  inChat(righe) {
    let c = !!this.ctx.chat;
    righe.forEach((r) => r.tags.forEach((tg) => { if (tg.k === 'chat') c = true; if (tg.k === '/chat') c = false; }));
    return c;
  }

  async prossimaPagina() {
    const tok = ++this.token;
    this.pulisciScelte();
    $('toast').hidden = true;
    const righe = this.leggiPagina();
    if (!righe.length && !this.story.currentChoices.length) return this.fine();
    // i tag "di pagina" della prima riga si applicano subito (immagine, capitolo, chat…)
    const nuovaPagina = !righe.length || !this.ctx.chat || righe[0].tags.some((tg) => tg.k === 'chat' || tg.k === '/chat');
    if (nuovaPagina && !this.ctx.chat) this.elText.innerHTML = '';
    for (const riga of righe) {
      if (tok !== this.token) return;
      await this.applicaTagRiga(riga.tags);
      if (riga.testo.trim()) await this.scriviRiga(riga, tok);
    }
    this.righePagina = righe;
    this.aggiornaUmore();
    if (tok !== this.token) return;
    if (this.pendente || this.story.canContinue) this.mostraContinua();
    else if (this.story.currentChoices.length) { this.salva(); this.mostraScelte(); }
    else { this.finePendente = true; this.mostraContinua(); }
  }

  // ---------- tag ----------
  async applicaTagRiga(tags) {
    for (const { k, v } of tags) {
      switch (k) {
        case 'img': this.ctx.img = v; this.ctx.lavagna = []; this.r.setDyn('lavagna', []); await this.r.setScena(v, this.id); this.r.aggiungiFx(this.ctx.fx); break;
        case 'capitolo': this.ctx.cap = v; $('hud-cap').textContent = t(`capitoli.${v}`) !== `capitoli.${v}` ? t(`capitoli.${v}`) : v; break;
        case 'ora': this.ctx.ora = v; $('hud-ora').textContent = v; $('ph-ora').textContent = v; break;
        case 'fx': v.split(/[ ,]+/).filter(Boolean).forEach((f) => { if (!this.ctx.fx.includes(f)) this.ctx.fx.push(f); }); this.r.aggiungiFx(this.ctx.fx); break;
        case 'fxoff': (v ? v.split(/[ ,]+/) : [...this.ctx.fx]).forEach((f) => { this.ctx.fx = this.ctx.fx.filter((x) => x !== f); this.r.togliFx(f); }); break;
        case 'flash': this.r.flash(); break;
        case 'sfx': v.split(/[ ,]+/).forEach((s) => sfx(s)); break;
        case 'amb': this.ctx.amb = v; ambiente(v); break;
        case 'chat': this.ctx.chat = { titolo: v, log: [] }; this.apriChat(); break;
        case '/chat': this.ctx.chat = null; this.chiudiChat(); break;
        case 'lavagna': this.ctx.lavagna.push(v); this.r.setDyn('lavagna', [...this.ctx.lavagna]); break;
        case 'incrocio': this.incrocio(v); break;
        case 'ricorda': this.toast(v); break;
      }
    }
  }

  async applicaContesto(c, ripristino) {
    this.ctx = { img: null, cap: '', ora: '', fx: [], amb: null, chat: null, lavagna: [], ...c };
    if (c.img) await this.r.setScena(c.img, this.id);
    this.r.aggiungiFx(this.ctx.fx); this.r.setDyn('lavagna', this.ctx.lavagna || []);
    $('hud-cap').textContent = c.cap ? t(`capitoli.${c.cap}`) : ''; $('hud-ora').textContent = c.ora || '';
    if (c.amb) ambiente(c.amb);
    if (c.chat) { this.apriChat(); c.chat.log.forEach((m) => this.bolla(m, true)); } else this.chiudiChat();
  }

  incrocio(id) {
    const altri = save.segnaIncrocio(id, this.id);
    if (altri.length) {
      const b = $('badge'); b.textContent = t('ui.gia_visto', { chi: altri.map((a) => CHAT_NOME[a]).join(', ') }); b.hidden = false;
      clearTimeout(this._badgeT); this._badgeT = setTimeout(() => { b.hidden = true; }, 5000);
    }
  }

  toast(testo) {
    const el = $('toast'); el.textContent = testo; el.hidden = false;
    clearTimeout(this._toastT); this._toastT = setTimeout(() => { el.hidden = true; }, 6000);
  }

  // ---------- scrittura ----------
  velocita() { return VELOCITA[this.imp.velocita] ?? 20; }

  async scriviRiga(riga, tok) {
    if (this.ctx.chat) return this.scriviChat(riga.testo, tok);
    const p = document.createElement('p'); this.elText.appendChild(p);
    const html = formatta(riga.testo), d = this.velocita();
    if (!d) { p.innerHTML = html; return; }
    // macchina da scrivere: si scrive il testo semplice, poi si sostituisce con l'HTML formattato
    const testo = piano(riga.testo);
    const caret = '<span class="caret">&nbsp;</span>';
    const paura = this.story.variablesState['paura'] || 0;
    let fatto = false; this.skip = () => { fatto = true; };
    for (let i = 1; i <= testo.length && !fatto; i++) {
      if (tok !== this.token) return;
      p.innerHTML = esc(testo.slice(0, i)) + caret;
      if (i % 3 === 0) sfx('tasto');
      let attesa = d;
      if (paura >= 7 && Math.random() < 0.06) attesa += 120; // la paura fa inciampare il testo
      if (/[.!?…]/.test(testo[i - 1])) attesa += d * 6;
      await new Promise((r) => setTimeout(r, attesa));
      this.scrollGiu();
    }
    this.skip = null; p.innerHTML = html; this.scrollGiu();
  }

  mostraRigheIstantanee(righe) {
    this.elText.innerHTML = '';
    (righe || []).forEach((r) => {
      if (this.ctx.chat) return; // in chat, il log è già stato ricostruito
      if (!r.testo.trim()) return;
      const p = document.createElement('p'); p.innerHTML = formatta(r.testo); this.elText.appendChild(p);
    });
    this.righePagina = righe;
  }

  scrollGiu() {
    if (this.ctx.chat) { this.elChatLog.scrollTop = this.elChatLog.scrollHeight; return; }
    const pan = $('panel'); pan.scrollTop = pan.scrollHeight;
  }

  // ---------- chat: lo schermo di un telefono sopra la scena ----------
  apriChat() {
    const c = this.ctx.chat;
    this.elChat.hidden = false; this.elChatLog.innerHTML = ''; this.elText.innerHTML = '';
    this.elChatHead.textContent = c.titolo;
    const sigla = c.titolo.replace(/[^\p{L}\s]/gu, '').trim().split(/\s+/).map((w) => w[0]).join('').slice(0, 2).toUpperCase();
    $('ph-av').textContent = sigla || '…';
    $('ph-ora').textContent = this.ctx.ora || '';
    this.aggiornaSottotitolo();
    // scelte, timer e "avanti" entrano nel telefono, sopra la barra di scrittura
    const foot = $('ph-foot'), input = foot.querySelector('.ph-input');
    [$('timer'), this.elChoices, this.elCont].forEach((el) => foot.insertBefore(el, input));
    document.getElementById('scr-game').classList.add('chat-mode');
  }
  chiudiChat() {
    this.elChat.hidden = true; this.elChatLog.innerHTML = '';
    const pan = $('panel');
    [$('timer'), this.elChoices, this.elCont].forEach((el) => pan.appendChild(el));
    document.getElementById('scr-game').classList.remove('chat-mode');
  }

  gruppo() { const c = this.ctx.chat; return !!c && c.log.some((m) => !m.sys && !m.mio && !c.titolo.startsWith(m.chi)); }
  aggiornaSottotitolo() {
    const c = this.ctx.chat; if (!c) return;
    if (this.gruppo()) {
      const nomi = [...new Set(c.log.filter((m) => !m.sys).map((m) => (m.mio ? 'tu' : m.chi)))];
      $('ph-sub').textContent = nomi.join(', ');
    } else $('ph-sub').textContent = 'online';
  }

  parseMsg(testo) {
    const m = testo.match(/^([A-ZÀ-ÖØ-Þ][^:,.!?«»_]{0,22}):\s+(.*)$/);
    if (!m) return { sys: true, testo };
    return { chi: m[1].trim(), testo: m[2], mio: m[1].trim() === CHAT_NOME[this.id], ora: this.ctx.ora || '' };
  }

  bolla(m, istantaneo) {
    const el = document.createElement('div');
    if (m.sys) {
      el.className = 'msg sys' + (m.testo.length > 60 ? ' nota' : '');
      el.innerHTML = formatta(m.testo);
    } else {
      const prec = this.elChatLog.lastElementChild;
      const stesso = prec && prec.dataset.chi === m.chi;
      el.className = 'msg' + (m.mio ? ' me' : '') + (stesso ? ' cont' : '');
      el.dataset.chi = m.chi;
      const nome = !m.mio && !stesso && this.gruppo() ? `<span class="who">${esc(m.chi)}</span>` : '';
      el.innerHTML = `${nome}<span class="body">${formatta(m.testo)}</span><span class="meta">${esc(m.ora || '')}${m.mio ? ' <span class="tick">✓✓</span>' : ''}</span>`;
    }
    if (istantaneo) el.style.animation = 'none';
    this.elChatLog.appendChild(el); this.scrollGiu();
    return el;
  }

  async scriviChat(testo, tok) {
    const m = this.parseMsg(testo);
    this.ctx.chat.log.push(m);
    this.aggiornaSottotitolo();
    const d = this.velocita();
    if (d && !m.mio && !m.sys) {
      const scrive = document.createElement('div');
      scrive.className = 'msg typing'; scrive.setAttribute('aria-label', `${m.chi} sta scrivendo`);
      scrive.innerHTML = '<i></i><i></i><i></i>';
      this.elChatLog.appendChild(scrive); this.scrollGiu();
      $('ph-sub').textContent = `${m.chi} sta scrivendo…`;
      let fatto = false; this.skip = () => { fatto = true; };
      const attesa = Math.min(1600, 300 + m.testo.length * d * 0.9);
      for (let x = 0; x < attesa && !fatto; x += 50) { if (tok !== this.token) return; await new Promise((r) => setTimeout(r, 50)); }
      this.skip = null; scrive.remove(); this.aggiornaSottotitolo();
    }
    if (tok !== this.token) return;
    this.bolla(m); if (!m.mio) sfx('notifica');
  }

  // ---------- avanzamento ----------
  mostraContinua() {
    this.elCont.hidden = false; this.elCont.focus({ preventScroll: true });
    this.scrollGiu();
  }

  avanza() { // invio / tocco
    if (this.skip) { this.skip(); return; }
    if (!this.elCont.hidden) {
      this.elCont.hidden = true; sfx('blip');
      if (this.finePendente) { this.finePendente = false; this.fine(); } else this.prossimaPagina();
    }
  }

  pulisciScelte() { this.elChoices.innerHTML = ''; this.elCont.hidden = true; this.fermaTimer(); $('timer').hidden = true; this.inScelta = false; }

  tagsPagina() { return (this.righePagina || []).flatMap((r) => r.tags); }

  async mostraScelte() {
    const scelte = this.story.currentChoices;
    const tagsP = this.tagsPagina();
    const mini = tagsP.find((tg) => tg.k === 'mini');
    const info = scelte.map((c) => {
      const tags = (c.tags || []).map(parseTag);
      return { c, locked: tags.find((tg) => tg.k === 'locked'), nascosta: tags.some((tg) => ['timeout', 'ok', 'ko'].includes(tg.k)), tags };
    });
    // mini-interazione: decide lei tra le scelte #ok e #ko
    if (mini && info.some((x) => x.tags.some((tg) => tg.k === 'ok'))) {
      const riuscita = await avviaMini(mini.v, { renderer: this.r, senzaTempo: !this.imp.timer });
      const sc = info.find((x) => x.tags.some((tg) => tg.k === (riuscita ? 'ok' : 'ko'))) || info.find((x) => x.tags.some((tg) => tg.k === 'ok'));
      return this.scegli(sc.c.index);
    }
    this.inScelta = true;
    let n = 0; this.mappaTasti = {};
    info.forEach((x) => {
      if (x.nascosta) return;
      n++;
      const li = document.createElement('li'), b = document.createElement('button');
      b.innerHTML = `<span class="n">${n}.</span><span class="t">${formatta(x.c.text)}${x.locked && x.locked.v ? `<span class="why">— ${esc(x.locked.v)}</span>` : ''}</span>`;
      if (x.locked) { b.disabled = true; b.setAttribute('aria-disabled', 'true'); }
      else { b.addEventListener('click', () => this.scegli(x.c.index)); this.mappaTasti[n] = x.c.index; }
      li.appendChild(b); this.elChoices.appendChild(li);
    });
    // sicurezza: se tutte le scelte visibili sono bloccate, sblocca l'ultima (non dovrebbe succedere: lo controlla tools/verify.mjs)
    if (!Object.keys(this.mappaTasti).length) {
      const libera = info.find((x) => !x.locked && !x.nascosta) || info.find((x) => x.nascosta) || info[0];
      if (libera) this.mappaTasti[1] = libera.c.index;
    }
    const primo = this.elChoices.querySelector('button:not([disabled])'); if (primo) primo.focus({ preventScroll: true });
    this.scrollGiu();
    // timer
    const tm = tagsP.find((tg) => tg.k === 'timer'), to = info.find((x) => x.tags.some((tg) => tg.k === 'timeout'));
    if (tm && to && this.imp.timer) {
      const paura = this.story.variablesState['paura'] || 0;
      const sec = parseFloat(tm.v || '8') * (1 - Math.max(0, paura - 5) * 0.06);
      this.avviaTimer(sec, () => this.scegli(to.c.index, true));
    }
  }

  avviaTimer(sec, alloScadere) {
    const bar = $('timer'), fill = $('timer-fill'); bar.hidden = false;
    const t0 = performance.now(); let ultimoSec = -1;
    const passo = (ora) => {
      const k = (ora - t0) / 1000 / sec;
      fill.style.width = `${Math.max(0, 100 - k * 100)}%`;
      const s = Math.floor((ora - t0) / 1000); if (s !== ultimoSec) { ultimoSec = s; sfx('timer'); }
      if (k >= 1) { this.timer = null; bar.hidden = true; alloScadere(); return; }
      this.timer = requestAnimationFrame(passo);
    };
    this.timer = requestAnimationFrame(passo);
  }
  fermaTimer() { if (this.timer) cancelAnimationFrame(this.timer); this.timer = null; }

  scegli(indice, scaduto) {
    if (!this.inScelta && !scaduto && this.elChoices.children.length) return;
    this.fermaTimer(); this.inScelta = false;
    sfx('blip');
    this.story.ChooseChoiceIndex(indice);
    if (!this.ctx.chat) this.elText.innerHTML = '';
    this.prossimaPagina();
  }

  sceltaDaTasto(n) { if (this.inScelta && this.mappaTasti && n in this.mappaTasti) this.scegli(this.mappaTasti[n]); }

  // ---------- stato ----------
  aggiornaUmore() {
    const vs = this.story.variablesState;
    this.r.setUmore(vs['rabbia'] || 0, vs['paura'] || 0);
  }

  salva() {
    const s = save.personaggio(this.id);
    s.stato = this.story.state.ToJson();
    s.pagina = { ctx: JSON.parse(JSON.stringify(this.ctx)), righe: this.righePagina || [] };
    s.aggiornato = Date.now();
    save.salva();
  }

  fine() {
    const vs = this.story.variablesState;
    const esito = vs['esito'] || 'PACE';
    const recap = [1, 2, 3].map((i) => vs[`d${i}_testo`]).filter(Boolean);
    const s = save.personaggio(this.id);
    delete s.stato; delete s.pagina; s.finito = true; s.esito = esito; s.recap = recap; save.salva();
    this.onFine && this.onFine({ esito, recap });
  }

  distruggi() { this.token++; this.fermaTimer(); this.pulisciScelte(); this.chiudiChat(); }
}
