// Compila ink/*.ink -> story/*.json (+ story/index.json con l'elenco dei percorsi pronti).
// Uso: npm run build
import { Compiler, CompilerOptions } from 'inkjs/full';
import fs from 'node:fs';
import path from 'node:path';

const ROOT = path.resolve(path.dirname(new URL(import.meta.url).pathname), '..');
const INK = path.join(ROOT, 'ink'), OUT = path.join(ROOT, 'story');
const ESCLUSI = new Set(['comune.ink']);
fs.mkdirSync(OUT, { recursive: true });

const fileHandler = {
  ResolveInkFilename: (f) => path.resolve(INK, f),
  LoadInkFileContents: (f) => fs.readFileSync(f, 'utf8'),
};

let errori = 0;
const pronti = [];
for (const f of fs.readdirSync(INK).filter((x) => x.endsWith('.ink') && !ESCLUSI.has(x)).sort()) {
  const id = f.replace(/\.ink$/, '');
  const msgs = [];
  const opts = new CompilerOptions(path.join(INK, f), [], false, (msg, tipo) => msgs.push({ msg, tipo }), fileHandler);
  const c = new Compiler(fs.readFileSync(path.join(INK, f), 'utf8'), opts);
  let story = null;
  try { story = c.Compile(); } catch (e) { msgs.push({ msg: String(e), tipo: 2 }); }
  const errs = [...(c.errors || [])], warns = [...(c.warnings || [])];
  for (const m of msgs) { const l = m.tipo === 2 ? errs : warns; if (!l.includes(m.msg)) l.push(m.msg); }
  warns.forEach((w) => console.warn(`  ⚠ ${f}: ${w}`));
  if (errs.length || !story) { errs.forEach((e) => console.error(`  ✖ ${f}: ${e}`)); errori++; continue; }
  fs.writeFileSync(path.join(OUT, `${id}.json`), story.ToJson());
  pronti.push(id);
  console.log(`  ✔ ${f} -> story/${id}.json`);
}
fs.writeFileSync(path.join(OUT, 'index.json'), JSON.stringify(pronti));
if (errori) { console.error(`\n${errori} file con errori`); process.exit(1); }
