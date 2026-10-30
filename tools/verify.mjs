// Verifica automatica delle storie: percorre migliaia di partite casuali e segnala
// vicoli ciechi, scelte tutte bloccate, timer senza timeout, nodi mai visitati,
// scelte mai prese, variabili mai lette, finali irraggiungibili, immagini senza definizione,
// pagine troppo lunghe, incroci non coerenti con la bibbia.
// Uso: npm run verify            (tutti)      node tools/verify.mjs ines 5000
import { Story } from 'inkjs';
import fs from 'node:fs';
import path from 'node:path';
import { SCENE } from '../js/scenedefs.js';
import { INCROCI, PERSONAGGI } from '../js/data.js';

const ROOT = path.resolve(path.dirname(new URL(import.meta.url).pathname), '..');
const [, , solo, nArg] = process.argv;
const N = +nArg || 4000;
const ROMPE = ['img', '---', 'chat', '/chat', 'capitolo'];
const parse = (tag) => { const i = tag.indexOf(':'); return i < 0 ? { k: tag.trim(), v: '' } : { k: tag.slice(0, i).trim(), v: tag.slice(i + 1).trim() }; };
const ids = JSON.parse(fs.readFileSync(path.join(ROOT, 'story/index.json'), 'utf8')).filter((x) => !solo || x === solo);

let problemiTot = 0;

function contenitori(c, pref = '', out = new Set()) {
  if (!c || !c.namedContent) return out;
  for (const [nome, sub] of c.namedContent) {
    if (nome.startsWith('$') || nome === 'global decl') continue;
    const p = pref ? `${pref}.${nome}` : nome;
    // solo knot e stitch (non le gather/choice interne con nomi automatici)
    if (!/^(c-|g-|s-|b)\d*$/.test(nome) && !/^\d+$/.test(nome)) { out.add(p); if (!pref) contenitori(sub, p, out); }
  }
  return out;
}

for (const id of ids) {
  const json = fs.readFileSync(path.join(ROOT, `story/${id}.json`), 'utf8');
  const problemi = new Set(), avvisi = new Set();
  const finali = {}, visitati = new Set(), sceltePrese = new Map(), immagini = new Set(), incroci = new Set();
  let pagineMin = 1e9, pagineMax = 0, scelteMin = 1e9, scelteMax = 0, pagineTot = 0;

  for (let run = 0; run < N; run++) {
    const s = new Story(json);
    s.onError = (m, t) => problemi.add(`errore ink: ${m}`);
    let pagina = [], pagine = 0, scelte = 0, guard = 0;
    while (guard++ < 5000) {
      while (s.canContinue) {
        const testo = s.Continue().trim();
        const tags = (s.currentTags || []).map(parse);
        const p = s.state.currentPathString; if (p) visitati.add(p.split('.').slice(0, 2).filter((x) => !/^\d+$/.test(x)).join('.'));
        if (tags.some((t) => ROMPE.includes(t.k)) && pagina.length) { chiudiPagina(); }
        tags.forEach((t) => {
          if (t.k === 'img') { immagini.add(t.v); if (!SCENE[t.v]) problemi.add(`immagine senza definizione in scenedefs.js: ${t.v}`); }
          if (t.k === 'incrocio') incroci.add(t.v);
        });
        pagina.push({ testo, tags });
      }
      const ch = s.currentChoices;
      const tagsPag = pagina.flatMap((r) => r.tags);
      chiudiPagina();
      if (!ch.length) break;
      scelte++;
      const info = ch.map((c) => { const tg = (c.tags || []).map(parse); return { c, tg, locked: tg.some((t) => t.k === 'locked'), timeout: tg.some((t) => t.k === 'timeout'), mini: tg.some((t) => t.k === 'ok' || t.k === 'ko') }; });
      const timer = tagsPag.find((t) => t.k === 'timer'), mini = tagsPag.find((t) => t.k === 'mini');
      if (timer && !info.some((x) => x.timeout)) problemi.add(`timer senza scelta # timeout (dopo: "${tagsPag.length ? '' : ''}${(pagina[0] || {}).testo || ''}")`);
      if (info.some((x) => x.timeout) && !timer) avvisi.add(`scelta # timeout senza # timer: "${info.find((x) => x.timeout).c.text}"`);
      let candidati;
      if (mini && info.some((x) => x.mini)) candidati = info.filter((x) => x.mini);
      else {
        candidati = info.filter((x) => !x.locked && !x.timeout && !x.mini);
        if (!candidati.length) problemi.add(`tutte le scelte bloccate: ${info.map((x) => x.c.text).join(' | ')}`);
        if (timer && Math.random() < 0.2) candidati = info.filter((x) => x.timeout).concat(candidati.length ? [] : []);
        if (!candidati.length) candidati = info.filter((x) => x.timeout);
        if (!candidati.length) candidati = info;
      }
      const sc = candidati[Math.floor(Math.random() * candidati.length)];
      const chiave = `${sc.c.sourcePath} :: ${sc.c.text}`; sceltePrese.set(chiave, (sceltePrese.get(chiave) || 0) + 1);
      info.forEach((x) => { const k = `${x.c.sourcePath} :: ${x.c.text}`; if (!sceltePrese.has(k)) sceltePrese.set(k, x.locked ? -1 : 0); else if (x.locked && sceltePrese.get(k) === 0) sceltePrese.set(k, -1); });
      s.ChooseChoiceIndex(sc.c.index);
    }
    function chiudiPagina() {
      if (!pagina.length) return;
      const righe = pagina.filter((r) => r.testo).length, car = pagina.reduce((a, r) => a + r.testo.length, 0);
      const inChat = pagina.some((r) => r.tags.some((t) => t.k === 'chat'));
      if (!inChat && (righe > 6 || car > 620)) avvisi.add(`pagina lunga (${righe} righe, ${car} car.): "${pagina[0].testo.slice(0, 60)}…"`);
      pagine++; pagina = [];
    }
    if (guard >= 5000) problemi.add('ciclo infinito?');
    const vs = s.state.variablesState;
    const esito = vs.$('esito');
    if (id !== 'corale') {
      if (esito !== 'PACE' && esito !== 'VIOLENZA') problemi.add(`partita finita senza esito (vicolo cieco?) in ${s.state.previousPathString}`);
      [1, 2, 3].forEach((i) => { if (!vs.$(`d${i}_testo`)) problemi.add(`scelta decisiva d${i} mai registrata in una partita (esito ${esito})`); });
    }
    finali[esito] = (finali[esito] || 0) + 1;
    pagineMin = Math.min(pagineMin, pagine); pagineMax = Math.max(pagineMax, pagine); pagineTot += pagine;
    scelteMin = Math.min(scelteMin, scelte); scelteMax = Math.max(scelteMax, scelte);
  }

  // nodi mai visitati
  const s0 = new Story(json);
  const tutti = contenitori(s0.mainContentContainer);
  const mai = [...tutti].filter((n) => !visitati.has(n) && !['su', 'giu', 'decisiva', 'violente', 'calcola_esito'].includes(n));
  mai.forEach((n) => avvisi.add(`nodo mai visitato: ${n}`));
  // scelte mai prese (escluse quelle bloccate per costruzione)
  for (const [k, v] of sceltePrese) if (v === 0) avvisi.add(`scelta mai presa: ${k}`);

  // variabili dichiarate e mai lette
  const fonti = ['comune.ink', `${id}.ink`].map((f) => path.join(ROOT, 'ink', f)).filter(fs.existsSync).map((f) => fs.readFileSync(f, 'utf8'));
  const testo = fonti.join('\n');
  const vars = [...testo.matchAll(/^VAR\s+(\w+)/gm)].map((m) => m[1]);
  const lettureMotore = ['rabbia', 'paura', 'esito', 'd1_testo', 'd2_testo', 'd3_testo', 'personaggio'];
  for (const v of vars) {
    const righe = testo.split('\n').filter((r) => !r.trim().startsWith('//') && !r.startsWith('VAR'));
    const letta = righe.some((r) => new RegExp(`\\b${v}\\b`).test(r) && !new RegExp(`~\\s*${v}\\s*=`).test(r) && !new RegExp(`(su|giu)\\(${v},`).test(r));
    if (!letta && !lettureMotore.includes(v)) avvisi.add(`variabile mai letta: ${v}`);
  }

  // incroci
  if (PERSONAGGI.includes(id)) {
    const altri = new Set();
    for (const x of incroci) {
      const def = INCROCI[x];
      if (!def) { problemi.add(`incrocio sconosciuto: ${x}`); continue; }
      if (!def.chi.includes(id)) avvisi.add(`incrocio ${x}: ${id} non è tra i personaggi previsti in data.js`);
      def.chi.filter((p) => p !== id).forEach((p) => altri.add(p));
    }
    const previsti = Object.keys(INCROCI).filter((x) => INCROCI[x].chi.includes(id) && !incroci.has(x));
    previsti.forEach((x) => avvisi.add(`incrocio previsto per ${id} ma mai incontrato: ${x}`));
    if (altri.size < 3) problemi.add(`${id} incrocia solo ${altri.size} altri personaggi (minimo 3)`);
  }
  ['PACE', 'VIOLENZA'].forEach((e) => { if (id !== 'corale' && !finali[e]) problemi.add(`finale ${e} mai raggiunto`); });

  const minuti = (n) => Math.round(n * 22 / 60); // ~22 secondi a pagina
  console.log(`\n══ ${id} ══  (${N} partite)`);
  console.log(`  finali: ${Object.entries(finali).map(([k, v]) => `${k} ${(100 * v / N).toFixed(1)}%`).join(' · ')}`);
  console.log(`  pagine per partita: ${pagineMin}–${pagineMax} (media ${(pagineTot / N).toFixed(0)}, ~${minuti(pagineTot / N)} min)  ·  scelte: ${scelteMin}–${scelteMax}`);
  console.log(`  immagini usate: ${immagini.size}  ·  incroci: ${[...incroci].sort().join(' ')}`);
  problemi.forEach((p) => console.log(`  ✖ ${p}`));
  avvisi.forEach((p) => console.log(`  ⚠ ${p}`));
  if (!problemi.size) console.log('  ✔ nessun problema bloccante');
  problemiTot += problemi.size;
}
process.exit(problemiTot ? 1 : 0);
