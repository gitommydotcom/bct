// Renderer: disegna la scena in scala di grigi, applica gli effetti e la
// converte nella palette di 4 colori del personaggio con dither ordinato (Bayer 8×8).
import { W, H, disegnaScena, primoAnimato, fbm, noise } from './scenes.js';
import { PALETTES } from './data.js';
import { SCENE } from './scenedefs.js';

const BAYER8 = (() => {
  const m = [[0, 32, 8, 40, 2, 34, 10, 42], [48, 16, 56, 24, 50, 18, 58, 26], [12, 44, 4, 36, 14, 46, 6, 38], [60, 28, 52, 20, 62, 30, 54, 22],
    [3, 35, 11, 43, 1, 33, 9, 41], [51, 19, 59, 27, 49, 17, 57, 25], [15, 47, 7, 39, 13, 45, 5, 37], [63, 31, 55, 23, 61, 29, 53, 21]];
  const a = new Float32Array(64); for (let y = 0; y < 8; y++) for (let x = 0; x < 8; x++) a[y * 8 + x] = (m[y][x] + 0.5) / 64; return a;
})();

const hex = (h) => [parseInt(h.slice(1, 3), 16), parseInt(h.slice(3, 5), 16), parseInt(h.slice(5, 7), 16)];
const immagini = new Map(); // url -> Promise<Image|null>

function caricaImmagine(url) {
  if (!immagini.has(url)) immagini.set(url, new Promise((res) => { const i = new Image(); i.onload = () => res(i); i.onerror = () => res(null); i.src = url; }));
  return immagini.get(url);
}

// "shared/c5_granata" -> art/shared/c5_granata.png ; "titolo" -> art/ui/titolo.png.
// Se il file non esiste si usa il segnaposto procedurale.
export function urlImmagine(id) { return id.includes('/') ? `art/${id}.png` : `art/ui/${id}.png`; }
export function trovaImmagine(id) { return caricaImmagine(urlImmagine(id)); }

export class Renderer {
  constructor(canvas) {
    this.out = canvas; this.octx = canvas.getContext('2d');
    this.src = document.createElement('canvas'); this.src.width = W; this.src.height = H;
    this.ctx = this.src.getContext('2d', { willReadFrequently: true });
    this.cache = document.createElement('canvas'); this.cache.width = W; this.cache.height = H;
    this.cctx = this.cache.getContext('2d');
    this.dati = this.octx.createImageData(W, H);
    this.lum = new Float32Array(W * H);
    this.def = null; this.img = null; this.fx = new Set(); this.dyn = {};
    this.umore = { rabbia: 0, paura: 0 };
    this.flashRidotti = false; this.flashT = -1; this.t = 0; this.sporco = true;
    this.setPalette('titolo');
    this._loop = this._loop.bind(this); this.attivo = false; this.ultimo = 0; this.sporcoCache = true;
  }

  setPalette(chiave) {
    const p = PALETTES[chiave] || PALETTES.titolo;
    this.pal = p.colori.map(hex); this.caldo = p.caldo; this.sporco = true;
  }

  async setScena(id, chi) {
    this.idScena = id;
    const def = SCENE[id] || { id, strati: [['cielo', { a: 10, b: 50 }], ['scritta', { testo: id, size: 8, y: 96 }]], mancante: true };
    const img = await trovaImmagine(id);
    if (this.idScena !== id) return; // nel frattempo è cambiata
    this.def = { id, ...def }; this.img = img; this.k = img ? -1 : primoAnimato(this.def);
    this.fx = new Set([...(def.fx || [])]); this.sporcoCache = true; this.sporco = true;
  }

  aggiungiFx(lista) { lista.forEach((f) => this.fx.add(f)); this.sporco = true; }
  togliFx(f) { this.fx.delete(f); this.sporco = true; }
  flash() { this.flashT = this.t; this.sporco = true; }
  setUmore(rabbia, paura) { this.umore = { rabbia, paura }; this.sporco = true; }
  setDyn(k, v) { this.dyn[k] = v; this.sporcoCache = true; this.sporco = true; }

  start() { if (!this.attivo) { this.attivo = true; requestAnimationFrame(this._loop); } }
  stop() { this.attivo = false; }

  animato() {
    return (this.k >= 0) || this.fx.size > 0 || this.umore.rabbia >= 6 || this.umore.paura >= 7 || this.flashT >= 0;
  }

  _loop(ts) {
    if (!this.attivo) return;
    this.t = ts / 1000;
    if (ts - this.ultimo > 80 && (this.sporco || this.animato())) { this.ultimo = ts; this.frame(); this.sporco = false; }
    requestAnimationFrame(this._loop);
  }

  // Disegna un frame completo.
  frame() {
    const ctx = this.ctx, t = this.t;
    ctx.save();
    const paura = this.umore.paura;
    if (paura >= 7 && Math.random() < (paura - 6) * 0.12) ctx.translate(Math.round(Math.random() * 2 - 1), Math.round(Math.random() * 2 - 1));
    if (this.img) {
      ctx.fillStyle = '#000'; ctx.fillRect(0, 0, W, H);
      const s = Math.max(W / this.img.width, H / this.img.height), w = this.img.width * s, h = this.img.height * s;
      ctx.drawImage(this.img, (W - w) / 2, (H - h) / 2, w, h);
    } else if (this.def) {
      if (this.sporcoCache) {
        this.cctx.fillStyle = '#000'; this.cctx.fillRect(0, 0, W, H);
        disegnaScena(this.cctx, this.def, 0, this.dyn, 0, this.k >= 0 ? this.k : Infinity);
        this.sporcoCache = false;
      }
      ctx.drawImage(this.cache, 0, 0);
      if (this.k >= 0) disegnaScena(ctx, this.def, t, this.dyn, this.k);
    }
    ctx.restore();
    this.quantizza(ctx.getImageData(0, 0, W, H).data);
  }

  quantizza(px) {
    const L = this.lum, fx = this.fx, t = this.t;
    for (let i = 0, j = 0; i < L.length; i++, j += 4) L[i] = (px[j] * 0.299 + px[j + 1] * 0.587 + px[j + 2] * 0.114) / 255;
    const def = this.def || {};
    const contrasto = def.contrasto ?? 1, luce = def.luce ?? 0, gamma = def.gamma ?? (this.img ? 1 : 1.45);

    // effetti sulla luminosità
    const notte = fx.has('notte'), fumo = fx.has('fumo'), gas = fx.has('gas'), lamp = fx.has('lampeggianti');
    let pulsL = 0, pulsR = 0;
    if (lamp) {
      if (this.flashRidotti) { pulsL = pulsR = 0.06 * (0.5 + 0.5 * Math.sin(t * 2)); }
      else { const f = (t * 2.2) % 2; pulsL = f < 0.5 ? 0.3 : 0; pulsR = f >= 1 && f < 1.5 ? 0.3 : 0; } // circa 2 Hz, sotto la soglia dei 3 lampi/s
    }
    let flash = 0;
    if (this.flashT >= 0) { const d = t - this.flashT; if (d > 0.6) this.flashT = -1; else flash = (this.flashRidotti ? 0.15 : 0.9) * (1 - d / 0.6); }
    for (let y = 0; y < H; y++) for (let x = 0; x < W; x++) {
      const i = y * W + x; let v = (L[i] - 0.5) * contrasto + 0.5 + luce;
      if (notte) v *= 0.62;
      if (fumo) { const n = fbm(x * 0.03 + t * 0.15, y * 0.05 - t * 0.25); const m = Math.max(0, n - 0.42) * 1.1 * (1 - y / H * 0.5); v = v * (1 - m) + 0.55 * m; }
      if (gas) { const n = fbm(x * 0.025 - t * 0.1, y * 0.04 + t * 0.05); const m = Math.max(0, Math.min(1, (y / H - 0.4) * 1.3)) * (0.15 + n * 0.5); v = v * (1 - m) + 0.7 * m; }
      if (lamp) v += (x < W / 2 ? pulsL : pulsR) * (1 - Math.abs(x - W / 2) / W);
      if (gamma !== 1) v = v > 0 ? Math.pow(v, gamma) : 0;
      if (flash) v = v + (1 - v) * flash;
      L[i] = v;
    }

    // dither + rabbia (rumore che "sporca" verso il colore caldo)
    const rab = this.umore.rabbia, sporca = rab >= 5 ? (rab - 4) * 0.035 : 0, tq = Math.floor(t * 3);
    const out = this.dati.data, pal = this.pal, caldo = this.caldo;
    for (let y = 0; y < H; y++) for (let x = 0; x < W; x++) {
      const i = y * W + x;
      let v = Math.max(0, Math.min(0.9999, L[i])) * 3;
      const base = Math.floor(v), frac = v - base;
      let liv = base + (frac > BAYER8[(y & 7) * 8 + (x & 7)] ? 1 : 0);
      if (sporca && Math.abs(liv - caldo) === 1 && noise(x * 0.9 + tq * 13.1, y * 0.9) < sporca) liv = caldo;
      const c = pal[Math.min(3, liv)], j = i * 4;
      out[j] = c[0]; out[j + 1] = c[1]; out[j + 2] = c[2]; out[j + 3] = 255;
    }
    this.octx.putImageData(this.dati, 0, 0);
  }
}

// Render una tantum (ritratti, titolo): scena -> canvas con una palette.
// Prima il segnaposto, poi (se esiste) la tavola in art/.
export function renderStatico(canvas, idScena, palette, t = 0) {
  disegnaStatico(canvas, idScena, palette, t, null);
  trovaImmagine(idScena).then((img) => { if (img) disegnaStatico(canvas, idScena, palette, t, img); });
}

function disegnaStatico(canvas, idScena, palette, t, img) {
  const r = new Renderer(canvas); r.setPalette(palette);
  const def = SCENE[idScena]; r.def = { id: idScena, ...def }; r.k = -1; r.fx = new Set(def.fx || []); r.t = t; r.img = img;
  const ctx = r.ctx; ctx.fillStyle = '#000'; ctx.fillRect(0, 0, W, H);
  if (img) { const s = Math.max(W / img.width, H / img.height), w = img.width * s, h = img.height * s; ctx.drawImage(img, (W - w) / 2, (H - h) / 2, w, h); }
  else disegnaScena(ctx, r.def, t, {});
  if (canvas.width !== W || canvas.height !== H) {
    // canvas di dimensioni diverse: quantizza in 320×200 e ritaglia al centro
    const tmp = document.createElement('canvas'); tmp.width = W; tmp.height = H; const tr = new Renderer(tmp); tr.setPalette(palette); tr.fx = r.fx; tr.def = r.def; tr.img = img;
    tr.quantizza(ctx.getImageData(0, 0, W, H).data);
    const c = canvas.getContext('2d'); c.imageSmoothingEnabled = false;
    const s = Math.max(canvas.width / W, canvas.height / H), w = W * s, h = H * s;
    c.drawImage(tmp, (canvas.width - w) / 2, (canvas.height - h) / 2, w, h);
    return;
  }
  r.quantizza(ctx.getImageData(0, 0, W, H).data);
}
