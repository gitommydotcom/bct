// Libreria di "strati" procedurali per i segnaposto.
// Ogni strato disegna in SCALA DI GRIGI su un canvas 320×200: il renderer poi
// converte la luminosità nella palette del personaggio con il dither.
// Uno strato è { draw(ctx, p, t, rng, dyn), anim } — anim=true se cambia nel tempo.

export const W = 320, H = 200;
const g = (v) => `rgb(${v | 0},${v | 0},${v | 0})`;

export function rng(seed) {
  let a = seed >>> 0;
  return () => { a |= 0; a = (a + 0x6D2B79F5) | 0; let t = Math.imul(a ^ (a >>> 15), 1 | a); t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t; return ((t ^ (t >>> 14)) >>> 0) / 4294967296; };
}
export function hash(str) { let h = 2166136261; for (const c of str) { h ^= c.charCodeAt(0); h = Math.imul(h, 16777619); } return h >>> 0; }

// rumore "value noise" semplice, periodico
const NS = 64; const NOISE = (() => { const r = rng(7); const a = new Float32Array(NS * NS); for (let i = 0; i < a.length; i++) a[i] = r(); return a; })();
export function noise(x, y) {
  const xi = Math.floor(x), yi = Math.floor(y), xf = x - xi, yf = y - yi;
  const i = (a, b) => NOISE[((b & (NS - 1)) * NS) + (a & (NS - 1))];
  const u = xf * xf * (3 - 2 * xf), v = yf * yf * (3 - 2 * yf);
  return (i(xi, yi) * (1 - u) + i(xi + 1, yi) * u) * (1 - v) + (i(xi, yi + 1) * (1 - u) + i(xi + 1, yi + 1) * u) * v;
}
export const fbm = (x, y) => noise(x, y) * 0.6 + noise(x * 2.1, y * 2.1) * 0.3 + noise(x * 4.3, y * 4.3) * 0.1;

// ---------- primitive ----------
function rect(ctx, x, y, w, h, v) { ctx.fillStyle = g(v); ctx.fillRect(Math.round(x), Math.round(y), Math.round(w), Math.round(h)); }
function circle(ctx, x, y, r, v) { ctx.fillStyle = g(v); ctx.beginPath(); ctx.arc(x, y, r, 0, Math.PI * 2); ctx.fill(); }
function poly(ctx, pts, v) { ctx.fillStyle = g(v); ctx.beginPath(); ctx.moveTo(pts[0], pts[1]); for (let i = 2; i < pts.length; i += 2) ctx.lineTo(pts[i], pts[i + 1]); ctx.closePath(); ctx.fill(); }
function line(ctx, x1, y1, x2, y2, v, w = 1) { ctx.strokeStyle = g(v); ctx.lineWidth = w; ctx.beginPath(); ctx.moveTo(x1, y1); ctx.lineTo(x2, y2); ctx.stroke(); }
function text(ctx, s, x, y, v, size = 8, font = 'PressStart', align = 'left') {
  ctx.fillStyle = g(v); ctx.font = `${size}px ${font}, monospace`; ctx.textAlign = align; ctx.textBaseline = 'top'; ctx.fillText(s, x, y);
}

// Persona stilizzata. y = piedi, h = altezza in pixel.
export function persona(ctx, x, y, h, v, o = {}) {
  const tipo = o.tipo || 'adulto', dir = o.dir || 1;
  const r = h * 0.085, hy = y - h + r, sw = h * 0.13, hip = y - h * 0.46;
  if (tipo === 'a_terra') { // sdraiato
    const L = h, yy = y - r;
    circle(ctx, x + dir * L * 0.42, yy, r, v);
    poly(ctx, [x + dir * L * 0.32, yy - r * 0.9, x - dir * L * 0.1, yy - r * 0.8, x - dir * L * 0.1, yy + r, x + dir * L * 0.32, yy + r], v);
    poly(ctx, [x - dir * L * 0.1, yy - r * 0.6, x - dir * L * 0.5, yy - r * 0.2, x - dir * L * 0.5, yy + r, x - dir * L * 0.1, yy + r], v);
    line(ctx, x + dir * L * 0.2, yy, x + dir * L * 0.25, yy - r * 2.2, v, Math.max(1, r * 0.5)); // braccio alzato
    return;
  }
  // gambe
  const lw = Math.max(1, h * 0.06);
  rect(ctx, x - sw * 0.55, hip, lw * 1.2, y - hip, v); rect(ctx, x + sw * 0.55 - lw * 1.2, hip, lw * 1.2, y - hip, v);
  // busto
  const top = hy + r * 1.2;
  if (tipo === 'prof') poly(ctx, [x - sw, top, x + sw, top, x + sw * 1.15, hip + h * 0.12, x - sw * 1.15, hip + h * 0.12], v); // cappotto
  else poly(ctx, [x - sw, top, x + sw, top, x + sw * 0.8, hip, x - sw * 0.8, hip], v);
  // braccia
  if (o.braccio === 'alto') line(ctx, x + dir * sw * 0.8, top + 2, x + dir * sw * 1.6, top - h * 0.28, v, lw * 1.3);
  else if (o.braccio === 'avanti') line(ctx, x + dir * sw * 0.8, top + 2, x + dir * sw * 2.6, top + h * 0.12, v, lw * 1.3);
  else { line(ctx, x - sw * 0.9, top + 2, x - sw * 1.1, hip + 2, v, lw * 1.2); line(ctx, x + sw * 0.9, top + 2, x + sw * 1.1, hip + 2, v, lw * 1.2); }
  // testa
  circle(ctx, x, hy, r, v);
  const chiaro = o.dettaglio ?? Math.min(255, v + 120);
  switch (tipo) {
    case 'ragazza': circle(ctx, x - dir * r * 1.1, hy - r * 0.3, r * 0.6, v); break; // coda
    case 'cappuccio': poly(ctx, [x - r * 1.3, hy + r, x - r * 1.1, hy - r * 1.2, x + r * 1.1, hy - r * 1.2, x + r * 1.3, hy + r], v); break;
    case 'maschera':
      poly(ctx, [x - r * 1.3, hy + r * 1.2, x - r * 1.1, hy - r * 1.3, x + r * 1.1, hy - r * 1.3, x + r * 1.3, hy + r * 1.2], v);
      rect(ctx, x - r * 0.7, hy - r * 0.3, r * 1.4, Math.max(1, r * 0.35), chiaro); break;
    case 'casco':
      circle(ctx, x, hy - r * 0.15, r * 1.35, v);
      rect(ctx, x - r * 1.2, hy - r * 0.2, r * 2.4, Math.max(1, r * 0.7), chiaro);
      if (o.scudo !== false) { rect(ctx, x + dir * sw * 0.3 - (dir < 0 ? sw * 1.6 : 0), top, sw * 1.6, h * 0.55, Math.min(255, v + 60)); }
      break;
    case 'pompiere':
      poly(ctx, [x - r * 1.4, hy + r * 0.3, x - r * 1.2, hy - r * 1.2, x, hy - r * 1.6, x + r * 1.2, hy - r * 1.2, x + r * 1.4, hy + r * 0.3], v);
      rect(ctx, x - r * 1.1, hy - r * 0.1, r * 2.2, Math.max(1, r * 0.5), chiaro);
      rect(ctx, x - sw * 0.9, hip - h * 0.08, sw * 1.8, Math.max(1, h * 0.03), chiaro); break; // banda riflettente
    case 'prof':
      rect(ctx, x - sw * 0.7, top, sw * 1.4, Math.max(2, h * 0.05), chiaro); // sciarpa
      rect(ctx, x - r * 0.8, hy - r * 0.2, r * 1.6, Math.max(1, r * 0.25), chiaro); break; // occhiali
    case 'anziana': circle(ctx, x, hy - r * 0.8, r * 0.7, v); break;
  }
  if (o.cartello) {
    const cw = h * 0.5, ch = h * 0.3, cx = x + dir * sw * 0.4 - cw / 2, cy = y - h * 1.25;
    line(ctx, x + dir * sw * 0.4, cy + ch, x + dir * sw * 0.4, top + 4, v, lw);
    rect(ctx, cx, cy, cw, ch, o.cartelloLum ?? 220);
    if (typeof o.cartello === 'string') {
      const size = Math.max(6, Math.min(12, cw / (o.cartello.length * 0.62)));
      ctx.save(); ctx.beginPath(); ctx.rect(cx, cy, cw, ch); ctx.clip();
      text(ctx, o.cartello, cx + cw / 2, cy + ch / 2 - size / 2, 20, size, 'VT323', 'center'); ctx.restore();
    }
  }
}

const CARTELLI = ['BISMILLAH', '6-7', 'AURA -1000', 'UN PLAFOND', '35/CLASSE', 'NI OUBLI', 'PROFS AVEC NOUS', 'TÉNÈBRES', '93 DEBOUT', 'ON EST LÀ'];

// ---------- strati ----------
export const STRATI = {
  cielo: { draw(ctx, p) { const gr = ctx.createLinearGradient(0, 0, 0, p.y ?? H); gr.addColorStop(0, g(p.a ?? 10)); gr.addColorStop(1, g(p.b ?? 60)); ctx.fillStyle = gr; ctx.fillRect(0, 0, W, p.y ?? H); } },
  pieno: { draw(ctx, p) { rect(ctx, p.x ?? 0, p.y ?? 0, p.w ?? W, p.h ?? H, p.lum ?? 0); } },
  stelle: { draw(ctx, p, t, r) { for (let i = 0; i < (p.n ?? 40); i++) rect(ctx, r() * W, r() * (p.h ?? 80), 1, 1, p.lum ?? 200); } },
  cite: { draw(ctx, p, t, r) { // torri e barre di banlieue
    let x = p.x0 ?? -10; const y = p.y ?? 150;
    ctx.save(); ctx.beginPath(); ctx.rect(Math.max(0, p.x0 ?? 0), 0, (p.x1 ?? W) - Math.max(0, p.x0 ?? 0), H); ctx.clip();
    while (x < (p.x1 ?? W)) {
      const w = 30 + r() * 45, h = (p.hmin ?? 50) + r() * (p.hvar ?? 70);
      rect(ctx, x, y - h, w, h, p.lum ?? 25);
      for (let wy = y - h + 5; wy < y - 6; wy += 7) for (let wx = x + 4; wx < x + w - 5; wx += 6) if (r() < (p.finestre ?? 0.25)) rect(ctx, wx, wy, 3, 3, p.flum ?? 150);
      x += w + r() * 8;
    }
    ctx.restore(); } },
  haussmann: { draw(ctx, p, t, r) { // fila di palazzi parigini
    const y = p.y ?? 160, top = p.top ?? 60; const x0 = p.x0 ?? 0, x1 = p.x1 ?? W; const v = p.lum ?? 40;
    rect(ctx, x0, top, x1 - x0, y - top, v);
    poly(ctx, [x0, top, x0 + 6, top - 14, x1 - 6, top - 14, x1, top], Math.max(0, v - 15)); // mansarda
    const piani = p.piani ?? 6, ph = (y - top) / piani;
    for (let i = 0; i < piani; i++) {
      const fy = top + i * ph + ph * 0.25;
      for (let fx = x0 + 6; fx < x1 - 8; fx += 14) rect(ctx, fx, fy, 6, ph * 0.55, r() < (p.accese ?? 0.15) ? (p.flum ?? 170) : Math.max(0, v - 25));
      if (i === 1 || i === 4) rect(ctx, x0, fy + ph * 0.55, x1 - x0, 1, Math.min(255, v + 25)); // balconi
    } } },
  facciata: { draw(ctx, p) { // angolo del palazzo di Nation con la finestra di Mme Ferrero
    const x = p.x ?? 200, w = p.w ?? 120, v = p.lum ?? 50;
    rect(ctx, x, 0, w, 170, v);
    for (let row = 0; row < 5; row++) for (let col = 0; col < 3; col++) {
      const fx = x + 12 + col * 36, fy = 10 + row * 30;
      const accesa = row === (p.riga ?? 3) && col === (p.col ?? 0);
      rect(ctx, fx, fy, 16, 20, accesa ? 200 : Math.max(0, v - 30));
      rect(ctx, fx - 3, fy + 20, 22, 2, v + 30);
      if (accesa && p.persona !== false) persona(ctx, fx + 8, fy + 22, 22, 20, { tipo: 'anziana' });
    }
    rect(ctx, x, 140, w, 30, Math.max(0, v - 20)); // piano terra (farmacia)
    if (p.croce !== false) { rect(ctx, x + w - 30, 146, 14, 4, 230); rect(ctx, x + w - 25, 141, 4, 14, 230); }
  } },
  suolo: { draw(ctx, p) { const y = p.y ?? 160; const gr = ctx.createLinearGradient(0, y, 0, H); gr.addColorStop(0, g(p.a ?? 30)); gr.addColorStop(1, g(p.b ?? 70)); ctx.fillStyle = gr; ctx.fillRect(0, y, W, H - y);
    if (p.linee) for (let i = -6; i <= 6; i++) line(ctx, W / 2 + i * 8, y, W / 2 + i * 70, H, p.lineeLum ?? 50); } },
  grata: { draw(ctx, p) { // cancello del liceo
    const x0 = p.x0 ?? 30, x1 = p.x1 ?? 290, y = p.y ?? 165, h = p.h ?? 70, v = p.lum ?? 15;
    rect(ctx, x0 - 10, y - h - 55, x1 - x0 + 20, 55, p.muro ?? 70); // edificio dietro
    for (let fx = x0; fx < x1; fx += 22) rect(ctx, fx, y - h - 48, 12, 14, p.finestre ?? 45);
    rect(ctx, x0, y - h, x1 - x0, 3, v); rect(ctx, x0, y - 4, x1 - x0, 3, v);
    for (let bx = x0; bx <= x1; bx += 6) rect(ctx, bx, y - h - 4, 2, h + 4, v);
    for (let bx = x0; bx <= x1; bx += 6) poly(ctx, [bx - 1, y - h - 4, bx + 3, y - h - 4, bx + 1, y - h - 9], v);
    if (p.insegna !== false) {
      const s = p.insegna || 'LYCÉE ERNESTINE-DUMONT', sz = 6, tw = s.length * sz + 10;
      rect(ctx, (x0 + x1) / 2 - tw / 2, y - h - 30, tw, 12, 200); text(ctx, s, (x0 + x1) / 2, y - h - 27, 25, sz, 'PressStart', 'center');
    }
  } },
  cassonetto: { draw(ctx, p) { const s = p.s ?? 1, x = p.x ?? 160, y = p.y ?? 170, v = p.lum ?? 45;
    if (p.rovesciato) { poly(ctx, [x - 18 * s, y, x - 14 * s, y - 16 * s, x + 18 * s, y - 20 * s, x + 20 * s, y - 2 * s], v); return; }
    poly(ctx, [x - 15 * s, y - 2 * s, x - 17 * s, y - 26 * s, x + 17 * s, y - 26 * s, x + 15 * s, y - 2 * s], v);
    rect(ctx, x - 19 * s, y - 30 * s, 38 * s, 5 * s, Math.max(0, v - 15));
    circle(ctx, x - 11 * s, y, 3 * s, 10); circle(ctx, x + 11 * s, y, 3 * s, 10); } },
  fuoco: { anim: true, draw(ctx, p, t) { // fiamme animate
    const x = p.x ?? 160, y = p.y ?? 170, w = p.w ?? 40, h = p.h ?? 40;
    for (let i = 0; i < w; i++) {
      const u = i / w, base = Math.sin(u * Math.PI);
      const fh = h * base * (0.45 + 0.75 * fbm(i * 0.18 + 3, t * 3.2));
      for (let k = 0; k < fh; k += 1) {
        const q = k / Math.max(1, fh);
        const v = 255 - q * 160 - fbm(i * 0.3, (k - t * 40) * 0.12) * 60;
        if (v > 60) rect(ctx, x - w / 2 + i, y - k, 1, 1, v);
      }
    } } },
  bagliore: { anim: true, draw(ctx, p, t) { const x = p.x ?? 160, y = p.y ?? 160, r = (p.r ?? 80) * (0.92 + 0.08 * noise(t * 4, 1));
    const gr = ctx.createRadialGradient(x, y, 2, x, y, r); gr.addColorStop(0, `rgba(255,255,255,${p.a ?? 0.45})`); gr.addColorStop(1, 'rgba(255,255,255,0)');
    ctx.fillStyle = gr; ctx.fillRect(0, 0, W, H); } },
  luce: { draw(ctx, p) { const x = p.x ?? 160, y = p.y ?? 100, r = p.r ?? 60; const gr = ctx.createRadialGradient(x, y, 1, x, y, r);
    gr.addColorStop(0, `rgba(255,255,255,${p.a ?? 0.5})`); gr.addColorStop(1, 'rgba(255,255,255,0)'); ctx.fillStyle = gr; ctx.fillRect(0, 0, W, H); } },
  colonna: { anim: true, draw(ctx, p, t) { // colonna di fumo che sale
    const x = p.x ?? 160, y = p.y ?? 150, v = p.lum ?? 120;
    for (let i = 0; i < 16; i++) { const k = ((t * 0.25 + i / 16) % 1); const yy = y - k * (p.h ?? 140); const rr = 6 + k * (p.r ?? 30);
      circle(ctx, x + Math.sin(i * 1.7 + t) * 6 + k * (p.vento ?? 30), yy, rr, v - k * 40); } } },
  lampione: { draw(ctx, p) { const x = p.x ?? 40, y = p.y ?? 170, h = p.h ?? 90; rect(ctx, x, y - h, 2, h, p.lum ?? 20); rect(ctx, x - 6, y - h, 12, 3, p.lum ?? 20);
    if (p.acceso !== false) STRATI.luce.draw(ctx, { x, y: y - h + 3, r: p.r ?? 45, a: 0.35 }); } },
  folla: { draw(ctx, p, t, r) {
    const n = p.n ?? 24, y = p.y ?? 175, s = p.s ?? 1, v = p.lum ?? 10;
    for (let i = 0; i < n; i++) {
      const x = (p.x0 ?? -10) + (i + r() * 0.8) * (((p.x1 ?? W + 10) - (p.x0 ?? -10)) / n);
      const h = (45 + r() * 18) * s;
      const tipi = p.tipi || ['adulto', 'ragazza', 'cappuccio', 'adulto'];
      persona(ctx, x, y + r() * 6 * s, h, v + r() * (p.var ?? 12), { tipo: tipi[Math.floor(r() * tipi.length)], dir: r() < 0.5 ? -1 : 1,
        cartello: r() < (p.cartelli ?? 0.15) ? CARTELLI[Math.floor(r() * CARTELLI.length)] : null, braccio: r() < (p.braccia ?? 0.1) ? 'alto' : null });
    } } },
  cordone: { draw(ctx, p, t, r) { // linea di polizia
    const n = p.n ?? 9, y = p.y ?? 170, s = p.s ?? 1, x0 = p.x0 ?? 0, x1 = p.x1 ?? W;
    for (let i = 0; i < n; i++) persona(ctx, x0 + (i + 0.5) * (x1 - x0) / n, y + r() * 2, 60 * s, p.lum ?? 15, { tipo: 'casco', dir: p.dir ?? -1, dettaglio: p.visiera ?? 150 }); } },
  figura: { draw(ctx, p) { persona(ctx, p.x ?? 160, p.y ?? 180, p.h ?? 80, p.lum ?? 10, p); } },
  camion: { draw(ctx, p) { // camion dei pompieri di profilo
    const x = p.x ?? 60, y = p.y ?? 172, s = p.s ?? 1, v = p.lum ?? 60;
    rect(ctx, x, y - 50 * s, 120 * s, 42 * s, v); // cassone
    poly(ctx, [x + 120 * s, y - 8 * s, x + 120 * s, y - 50 * s, x + 150 * s, y - 50 * s, x + 162 * s, y - 28 * s, x + 162 * s, y - 8 * s], v + 10); // cabina
    rect(ctx, x + 128 * s, y - 45 * s, 24 * s, 15 * s, p.vetro ?? 120);
    if (p.crepa) { const cx = x + 141 * s, cy = y - 38 * s; for (let a = 0; a < 7; a++) line(ctx, cx, cy, cx + Math.cos(a * 0.9) * 12 * s, cy + Math.sin(a * 0.9) * 7 * s, 240); }
    rect(ctx, x + 4 * s, y - 58 * s, 112 * s, 4 * s, v - 20); for (let i = 0; i < 14; i++) rect(ctx, x + 6 * s + i * 8 * s, y - 60 * s, 2 * s, 8 * s, v - 20); // scala
    rect(ctx, x + 132 * s, y - 54 * s, 16 * s, 4 * s, p.lampeggiante ?? 200);
    rect(ctx, x, y - 26 * s, 120 * s, 3 * s, 220); // banda
    for (const wx of [24, 96, 140]) circle(ctx, x + wx * s, y - 6 * s, 8 * s, 10);
  } },
  furgone: { draw(ctx, p) { const x = p.x ?? 200, y = p.y ?? 172, s = p.s ?? 1, v = p.lum ?? 40;
    rect(ctx, x, y - 44 * s, 90 * s, 36 * s, v); poly(ctx, [x + 90 * s, y - 8 * s, x + 90 * s, y - 40 * s, x + 108 * s, y - 30 * s, x + 110 * s, y - 8 * s], v + 8);
    rect(ctx, x + 92 * s, y - 34 * s, 12 * s, 10 * s, 110); for (let i = 0; i < 4; i++) rect(ctx, x + 93 * s, y - 33 * s + i * 3 * s, 10 * s, 1, 30);
    rect(ctx, x + 10 * s, y - 48 * s, 20 * s, 4 * s, p.lampeggiante ?? 230); text(ctx, 'POLICE', x + 45 * s, y - 30 * s, 220, 8 * s, 'PressStart', 'center');
    for (const wx of [18, 84]) circle(ctx, x + wx * s, y - 6 * s, 7 * s, 8); } },
  stanza: { draw(ctx, p) { rect(ctx, 0, 0, W, p.y ?? 140, p.lum ?? 60); rect(ctx, 0, p.y ?? 140, W, H, p.pav ?? 35); rect(ctx, 0, (p.y ?? 140) - 2, W, 2, (p.lum ?? 60) - 25); } },
  finestra: { draw(ctx, p) { const x = p.x ?? 200, y = p.y ?? 30, w = p.w ?? 70, h = p.h ?? 80;
    rect(ctx, x - 3, y - 3, w + 6, h + 6, p.telaio ?? 20); rect(ctx, x, y, w, h, p.lum ?? 120);
    if (p.croce !== false) { rect(ctx, x + w / 2 - 1, y, 3, h, p.telaio ?? 20); rect(ctx, x, y + h / 2 - 1, w, 3, p.telaio ?? 20); } } },
  lavagna: { draw(ctx, p, t, r, dyn) { const x = p.x ?? 40, y = p.y ?? 30, w = p.w ?? 240, h = p.h ?? 80;
    rect(ctx, x - 4, y - 4, w + 8, h + 8, 70); rect(ctx, x, y, w, h, 25);
    const righe = (dyn && dyn.lavagna && dyn.lavagna.length ? dyn.lavagna : (p.testo || [])).slice(-5);
    righe.forEach((s, i) => text(ctx, s, x + 8, y + 6 + i * 14, 200, 14, 'VT323')); } },
  banchi: { draw(ctx, p) { const y = p.y ?? 150; for (let row = 0; row < 3; row++) { const yy = y + row * 16, s = 0.7 + row * 0.25;
    for (let i = 0; i < 5; i++) { const x = 30 + i * 62 + (row % 2) * 10; rect(ctx, x, yy, 40 * s, 5, p.lum ?? 90); rect(ctx, x + 3, yy + 5, 2, 10 * s, 50); rect(ctx, x + 40 * s - 5, yy + 5, 2, 10 * s, 50); } } } },
  tavolo: { draw(ctx, p) { const x = p.x ?? 60, y = p.y ?? 150, w = p.w ?? 140; rect(ctx, x, y, w, 6, p.lum ?? 90); rect(ctx, x + 6, y + 6, 4, 40, 50); rect(ctx, x + w - 10, y + 6, 4, 40, 50);
    if (p.tazza) { rect(ctx, x + w * 0.6, y - 9, 8, 9, 200); rect(ctx, x + w * 0.6 + 8, y - 7, 3, 4, 200); } } },
  frigo: { draw(ctx, p) { const x = p.x ?? 250, y = p.y ?? 40; rect(ctx, x, y, 44, 100, p.lum ?? 150); rect(ctx, x, y + 38, 44, 2, 80); rect(ctx, x + 36, y + 10, 3, 16, 80); } },
  letto: { draw(ctx, p) { const x = p.x ?? 70, y = p.y ?? 150; rect(ctx, x, y - 14, 170, 14, p.lum ?? 200); rect(ctx, x, y - 30, 6, 46, 90); rect(ctx, x + 164, y - 22, 6, 38, 90); rect(ctx, x + 8, y - 20, 34, 8, 230);
    if (p.persona) { circle(ctx, x + 22, y - 22, 7, 60); rect(ctx, x + 32, y - 22, 110, 8, 170); } } },
  corridoio: { draw(ctx, p) { const v = p.lum ?? 90, cx = W / 2, cy = 90;
    rect(ctx, 0, 0, W, H, v); poly(ctx, [0, H, W, H, cx + 30, cy + 30, cx - 30, cy + 30], v - 30); poly(ctx, [0, 0, W, 0, cx + 30, cy - 30, cx - 30, cy - 30], v + 30);
    rect(ctx, cx - 30, cy - 30, 60, 60, v - 50);
    for (let i = 0; i < 4; i++) { const k = 1 - i * 0.22; rect(ctx, cx - 140 * k - 2, cy - 40 * k, 14 * k, 90 * k, v - 40); rect(ctx, cx + 140 * k - 12 * k, cy - 40 * k, 14 * k, 90 * k, v - 40); rect(ctx, cx - 20 * k, cy - 80 * k, 40 * k, 4, 250); } } },
  metro: { anim: true, draw(ctx, p, t) { rect(ctx, 0, 0, W, H, p.lum ?? 80);
    rect(ctx, 0, 30, W, 60, 15); for (let i = 0; i < 6; i++) { const x = ((i * 70 - t * 160) % 420 + 420) % 420 - 60; rect(ctx, x, 55, 30, 3, 180); }
    for (let x = 0; x < W; x += 80) rect(ctx, x, 30, 6, 60, p.lum ?? 80);
    rect(ctx, 0, 110, W, 30, 50); for (let x = 20; x < W; x += 60) rect(ctx, x, 0, 3, H, 170); rect(ctx, 0, 140, W, 60, 40); } },
  telefono: { draw(ctx, p) { const x = p.x ?? 160, y = p.y ?? 110, s = p.s ?? 1;
    STRATI.luce.draw(ctx, { x, y, r: 70 * s, a: 0.35 });
    rect(ctx, x - 22 * s, y - 40 * s, 44 * s, 80 * s, 15); rect(ctx, x - 19 * s, y - 35 * s, 38 * s, 68 * s, p.schermo ?? 210);
    for (let i = 0; i < 5; i++) rect(ctx, x - 15 * s + (i % 2) * 8 * s, y - 30 * s + i * 12 * s, 22 * s, 7 * s, i % 2 ? 120 : 160);
    poly(ctx, [x - 30 * s, y + 50 * s, x - 22 * s, y + 10 * s, x - 10 * s, y + 20 * s, x + 30 * s, y + 46 * s, x + 30 * s, y + 70 * s], p.mano ?? 25); } },
  armadietti: { draw(ctx, p) { const x0 = p.x ?? 20; for (let i = 0; i < (p.n ?? 6); i++) { const x = x0 + i * 28; rect(ctx, x, 40, 26, 110, p.lum ?? 80); rect(ctx, x + 4, 50, 18, 2, 40); rect(ctx, x + 4, 56, 18, 2, 40); rect(ctx, x + 20, 90, 3, 8, 160); } } },
  striscione: { draw(ctx, p) { const x = p.x ?? 40, y = p.y ?? 100, w = p.w ?? 200, h = p.h ?? 22;
    rect(ctx, x, y, w, h, p.lum ?? 220); rect(ctx, x - 2, y - 4, 2, h + 40, 20); rect(ctx, x + w, y - 4, 2, h + 40, 20);
    text(ctx, p.testo || '', x + w / 2, y + h / 2 - 5, p.inchiostro ?? 20, p.size ?? 10, 'PressStart', 'center'); } },
  scritta: { draw(ctx, p) { text(ctx, p.testo || '', p.x ?? 160, p.y ?? 90, p.lum ?? 230, p.size ?? 10, p.font ?? 'PressStart', p.align ?? 'center'); } },
  granata: { anim: true, draw(ctx, p, t) { const x = p.x ?? 160, y = p.y ?? 175; rect(ctx, x - 4, y - 5, 9, 5, 200);
    for (let i = 0; i < 6; i++) { const k = (t * 0.8 + i / 6) % 1; circle(ctx, x + Math.sin(i + t * 2) * 4 + k * 8, y - 6 - k * 30, 2 + k * 9, 190 - k * 90); } } },
  mano: { draw(ctx, p) { const x = p.x ?? 120, y = p.y ?? 200, s = p.s ?? 1, v = p.lum ?? 15, d = p.dir ?? 1;
    poly(ctx, [x - 14 * s, y, x - 8 * s, y - 60 * s, x + 8 * s, y - 64 * s, x + 14 * s, y], v);
    for (let i = 0; i < 4; i++) rect(ctx, x - 8 * s + i * 4.5 * s, y - 84 * s + Math.abs(1.5 - i) * 4 * s, 3.5 * s, 24 * s, v);
    rect(ctx, x + d * 10 * s, y - 70 * s, 4 * s, 14 * s, v); } },
  visiera: { draw(ctx, p) { // il mondo visto da sotto il casco
    ctx.fillStyle = g(p.lum ?? 5); ctx.beginPath(); ctx.rect(0, 0, W, H); ctx.ellipse(W / 2, H / 2 + 10, W * 0.56, H * 0.52, 0, 0, Math.PI * 2, true); ctx.fill('evenodd');
    ctx.globalAlpha = 0.5; for (let i = 0; i < 7; i++) line(ctx, 40 + i * 37, 30 + (i % 3) * 20, 90 + i * 31, 60 + (i % 2) * 40, 200); ctx.globalAlpha = 1; } },
  vignetta: { draw(ctx, p) { const gr = ctx.createRadialGradient(W / 2, H / 2, 40, W / 2, H / 2, 200); gr.addColorStop(0, 'rgba(0,0,0,0)'); gr.addColorStop(1, `rgba(0,0,0,${p.a ?? 0.7})`); ctx.fillStyle = gr; ctx.fillRect(0, 0, W, H); } },
  sbarre: { draw(ctx, p) { for (let x = p.x0 ?? 0; x <= (p.x1 ?? W); x += p.passo ?? 22) rect(ctx, x, p.y ?? 0, p.spessore ?? 4, p.h ?? H, p.lum ?? 10); } },
  colonna_nation: { draw(ctx, p) { const x = p.x ?? 160, v = p.lum ?? 30; // la colonna con le statue in cima
    rect(ctx, x - 6, 40, 12, 130, v); rect(ctx, x - 14, 160, 28, 12, v); rect(ctx, x - 9, 34, 18, 7, v);
    persona(ctx, x, 34, 22, v); persona(ctx, x + 7, 34, 18, v, { braccio: 'alto' }); } },
  sedie: { draw(ctx, p) { for (let i = 0; i < (p.n ?? 4); i++) { const x = (p.x ?? 30) + i * 26; rect(ctx, x, p.y ?? 150, 22, 5, p.lum ?? 140); rect(ctx, x, (p.y ?? 150) - 20, 22, 4, p.lum ?? 140); rect(ctx, x + 2, (p.y ?? 150) + 5, 2, 14, 40); rect(ctx, x + 18, (p.y ?? 150) + 5, 2, 14, 40); } } },
  giornale: { draw(ctx, p) { const x = p.x ?? 90, y = p.y ?? 30, w = p.w ?? 140, h = p.h ?? 150;
    rect(ctx, x, y, w, h, 220); text(ctx, p.testata || 'LE QUOTIDIEN', x + w / 2, y + 6, 20, 8, 'PressStart', 'center'); rect(ctx, x + 6, y + 18, w - 12, 1, 40);
    rect(ctx, x + 8, y + 24, w - 16, h * 0.5, 90); for (let i = 0; i < 6; i++) rect(ctx, x + 12 + i * 20, y + 24 + h * 0.5 - 20 - (i % 3) * 8, 6, 20 + (i % 3) * 8, 30);
    rect(ctx, x + 20, y + 24 + h * 0.5 - 14, 30, 10, 200);
    text(ctx, p.titolo || '', x + w / 2, y + 30 + h * 0.5, 15, 14, 'VT323', 'center');
    for (let i = 0; i < 5; i++) rect(ctx, x + 8, y + h * 0.5 + 50 + i * 7, w - 16 - (i % 2) * 30, 2, 120); } },
  ritratto: { draw(ctx, p) { // primo piano per la selezione
    const v = p.lum ?? 15, cx = p.x ?? 160, tipo = p.tipo;
    const gr = ctx.createRadialGradient(cx, 80, 10, cx, 100, 170); gr.addColorStop(0, g(p.sfondo ?? 200)); gr.addColorStop(1, g(60)); ctx.fillStyle = gr; ctx.fillRect(0, 0, W, H);
    poly(ctx, [cx - 85, H, cx - 70, 150, cx - 30, 132, cx + 30, 132, cx + 70, 150, cx + 85, H], v); // spalle
    rect(ctx, cx - 16, 112, 32, 26, v); // collo
    circle(ctx, cx, 85, 36, v); // testa
    const ch = 230;
    if (tipo === 'ines') { circle(ctx, cx + 36, 70, 18, v); circle(ctx, cx + 48, 92, 12, v); poly(ctx, [cx - 30, 132, cx, 160, cx + 30, 132, cx + 34, 140, cx, 170, cx - 34, 140], 90); }
    if (tipo === 'sacha') { poly(ctx, [cx - 48, 135, cx - 44, 60, cx, 38, cx + 44, 60, cx + 48, 135], v); rect(ctx, cx - 26, 76, 52, 10, ch); rect(ctx, cx - 14, 79, 8, 4, v); rect(ctx, cx + 6, 79, 8, 4, v); }
    if (tipo === 'jerome') { poly(ctx, [cx - 46, 96, cx - 40, 56, cx, 40, cx + 40, 56, cx + 46, 96], v + 25); rect(ctx, cx - 38, 84, 76, 8, ch); rect(ctx, cx - 70, 172, 140, 6, ch); }
    if (tipo === 'odile') { rect(ctx, cx - 26, 82, 22, 9, ch); rect(ctx, cx + 4, 82, 22, 9, ch); rect(ctx, cx - 4, 85, 8, 2, ch); poly(ctx, [cx - 40, 136, cx + 40, 136, cx + 30, 160, cx - 30, 160], 120); circle(ctx, cx, 60, 30, v); }
    if (tipo === 'mehdi') { circle(ctx, cx, 80, 45, v + 20); rect(ctx, cx - 44, 64, 88, 22, 150); rect(ctx, cx - 44, 64, 88, 3, ch); rect(ctx, cx - 60, 150, 26, 50, v + 40); }
  } },
};

// Disegna gli strati [da, a) di una scena (definizione in scenedefs.js).
export function disegnaScena(ctx, def, t, dyn, da = 0, a = Infinity) {
  const seed = hash(def.id || 'x');
  (def.strati || []).forEach((s, i) => {
    if (i < da || i >= a) return;
    const [nome, p = {}] = Array.isArray(s) ? s : [s];
    const L = STRATI[nome]; if (!L) return;
    L.draw(ctx, p, t, rng(seed + i * 9973), dyn);
  });
}

// Indice del primo strato animato (o -1): tutto ciò che sta prima si può mettere in cache.
export function primoAnimato(def) {
  return (def.strati || []).findIndex((s) => { const [n, p = {}] = Array.isArray(s) ? s : [s]; return STRATI[n] && (STRATI[n].anim || p.anim); });
}
