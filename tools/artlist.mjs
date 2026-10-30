// Genera ART_LIST.md: tutte le illustrazioni da disegnare, con descrizione,
// percorso del file, chi le vede e se il file esiste già.
// Uso: npm run artlist
import fs from 'node:fs';
import path from 'node:path';
import { SCENE } from '../js/scenedefs.js';

const ROOT = path.resolve(path.dirname(new URL(import.meta.url).pathname), '..');
const url = (id) => (id.includes('/') ? `art/${id}.png` : `art/ui/${id}.png`);

// chi usa ogni scena (dai tag # img nei file .ink)
const uso = {};
for (const f of fs.readdirSync(path.join(ROOT, 'ink')).filter((x) => x.endsWith('.ink'))) {
  const chi = f.replace('.ink', '');
  for (const m of fs.readFileSync(path.join(ROOT, 'ink', f), 'utf8').matchAll(/#\s*img:\s*([\w/]+)/g)) (uso[m[1]] ||= new Set()).add(chi);
}

const gruppi = {};
for (const [id, def] of Object.entries(SCENE)) { const g = id.includes('/') ? id.split('/')[0] : 'ui'; (gruppi[g] ||= []).push([id, def]); }
const ordine = ['ui', 'shared', 'ines', 'sacha', 'jerome', 'odile', 'mehdi', 'corale'];
const titoli = { ui: 'Interfaccia (titolo, ritratti, finali)', shared: 'Scene condivise — si disegnano UNA volta, il gioco le ricolora per ogni personaggio', ines: 'Inès', sacha: 'Sacha', jerome: 'Jérôme', odile: 'Odile', mehdi: 'Mehdi', corale: 'Epilogo corale' };

let tot = 0, fatte = 0;
let md = `# Lista delle illustrazioni

Generata da \`npm run artlist\` (non modificare a mano: le descrizioni stanno in \`js/scenedefs.js\`).

**Formato:** 320×200 pixel (o più grande, ma con proporzioni 16:10), **in scala di grigi**.
Il gioco converte la luminosità nei 4 colori del personaggio con un dither ordinato:
nero → colore 1, grigio scuro → colore 2, grigio chiaro → colore 3, bianco → colore 4.
Usa \`tools/convertitore.html\` per preparare disegni e foto e vedere subito l'anteprima nelle cinque palette.
Per provare una tavola basta salvarla nel percorso indicato e ricaricare il gioco.

`;
for (const g of ordine.filter((x) => gruppi[x])) {
  md += `\n## ${titoli[g] || g}\n\n| File | Inquadratura | Usata da | Stato |\n|---|---|---|---|\n`;
  for (const [id, def] of gruppi[g]) {
    const esiste = fs.existsSync(path.join(ROOT, url(id)));
    tot++; if (esiste) fatte++;
    const chi = uso[id] ? [...uso[id]].join(', ') : (g === 'ui' ? 'interfaccia' : '—');
    md += `| \`${url(id)}\` | ${(def.desc || '').replace(/\|/g, '/')} | ${chi} | ${esiste ? '✅ disegnata' : '◻ segnaposto'} |\n`;
  }
}
md = md.replace('\n\n## ', `\n**Avanzamento:** ${fatte}/${tot} tavole disegnate.\n\n## `);
fs.writeFileSync(path.join(ROOT, 'ART_LIST.md'), md);
for (const g of ordine) fs.mkdirSync(path.join(ROOT, 'art', g === 'corale' ? 'shared' : g), { recursive: true });
console.log(`ART_LIST.md: ${tot} illustrazioni (${fatte} disegnate)`);
