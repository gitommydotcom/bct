// Personaggi disegnati: ognuno ha sagoma, vestiti, capelli ed espressioni propri.
// Tutto in SCALA DI GRIGI (il renderer poi applica la palette con il dither):
// i chiaroscuri sono sfumature, che il dither trasforma in trame da fumetto pulp.
//
// personaggio(ctx, x, y, h, chi, o)
//   x, y = punto tra i piedi; h = altezza in pixel
//   chi  = ines | sacha | jerome | odile | mehdi | nassim | pompiere | poliziotto | ragazzo | ragazza | adulto | anziana | infermiera
//   o.dir      1 guarda a destra, -1 a sinistra
//   o.posa     giu | alto | avanti | mani | telefono | tiene (braccio piegato) | corsa
//   o.espr     neutro | urlo | paura | rabbia | triste | sorriso | stanco | occhi_chiusi
//   o.a_terra  disteso a terra
//   o.buio     0..1 scurisce tutto (controluce, notte)
//   o.luce     -1 luce da sinistra, 1 da destra (default -1)
//   o.casco, o.visiera ('su'|'giu'), o.maschera, o.cappuccio, o.scudo, o.cartello, o.gesso
//   o.seed     varia le comparse

const clamp = (v) => Math.max(0, Math.min(255, v));

export function personaggio(ctx, x, y, h, chi = 'adulto', o = {}) {
  const spec = (SPEC[chi] || SPEC.adulto)(o);
  const dir = o.dir || 1;
  const buio = o.buio || 0;
  const luce = (o.luce ?? -1) * dir; // in coordinate locali (dopo il ribaltamento)
  const V = (v) => clamp(v * (1 - buio));
  // spessore del contorno: costante in pixel (circa 0.9 px), quindi in unità dipende dall'altezza
  const k = { ctx, V, luce, o, spec, dir, ink: gs(clamp(10 * (1 - buio))), inkW: Math.max(0.45, 90 / h) };
  ctx.save();
  if (o.a_terra) { // disteso: il corpo è centrato su x, la testa dal lato di dir, il viso verso l'alto
    ctx.translate(x + dir * h * 0.5, y - h * 0.1); ctx.rotate(-Math.PI / 2 * dir); ctx.scale(dir * h / 100, h / 100);
  } else { ctx.translate(x, y); ctx.scale(dir * h / 100, h / 100); }
  ctx.lineJoin = 'round'; ctx.lineCap = 'round';
  const posa = o.a_terra ? (o.posa || 'alto') : (o.posa || spec.posa || 'giu');
  const br = BRACCIA[posa] || BRACCIA.giu;
  const passo = posa === 'corsa' || o.passo;

  if (spec.dietro) spec.dietro(k);
  if (o.seduto && o.sedia) sedia(k);
  if (o.seduto) { gambeSedute(k); ctx.translate(0, 24); } else gambe(k, passo);
  braccio(k, br.dietro, true);
  if (spec.mantello) spec.mantello(k);
  torso(k);
  if (spec.torsoExtra) spec.torsoExtra(k);
  testa(k);
  braccio(k, br.davanti, false);
  if (spec.davanti) spec.davanti(k, br);
  if (o.scudo) scudo(k);
  if (o.cartello) cartello(k, o.cartello, br);
  ctx.restore();
}

// ---------- utilità di disegno (coordinate locali: piedi y=0, testa y≈-100) ----------
function lin(k, x0, y0, x1, y1, v0, v1) {
  const gr = k.ctx.createLinearGradient(x0, y0, x1, y1);
  gr.addColorStop(0, gs(k.V(v0))); gr.addColorStop(1, gs(k.V(v1))); return gr;
}
const gs = (v) => `rgb(${v | 0},${v | 0},${v | 0})`;
// sfumatura laterale: lato in luce più chiaro, lato in ombra più scuro
function lato(k, xa, xb, v, forza = 34) {
  const l = k.luce < 0;
  return lin(k, xa, 0, xb, 0, l ? v + forza * 0.7 : v - forza, l ? v - forza : v + forza * 0.7);
}
function path(ctx, pts) { ctx.beginPath(); ctx.moveTo(pts[0], pts[1]); for (let i = 2; i < pts.length; i += 2) ctx.lineTo(pts[i], pts[i + 1]); ctx.closePath(); }
function fillPts(k, pts, fill, ink) { path(k.ctx, pts); k.ctx.fillStyle = fill; k.ctx.fill(); if (ink) inchiostro(k); }
// contorno a inchiostro, come nei fumetti: stacca le figure dallo sfondo
function inchiostro(k, w = 1) { if (k.o.contorno === false) return; k.ctx.lineWidth = k.inkW * w; k.ctx.strokeStyle = k.ink; k.ctx.stroke(); }
function ell(k, x, y, rx, ry, fill, rot = 0, ink) { const c = k.ctx; c.beginPath(); c.ellipse(x, y, rx, ry, rot, 0, Math.PI * 2); c.fillStyle = fill; c.fill(); if (ink) inchiostro(k); }
function arto(k, x1, y1, x2, y2, w, stroke) { seg(k, x1, y1, x2, y2, w + k.inkW * 2, k.ink); seg(k, x1, y1, x2, y2, w, stroke); }
function seg(k, x1, y1, x2, y2, w, stroke) { const c = k.ctx; c.beginPath(); c.moveTo(x1, y1); c.lineTo(x2, y2); c.lineWidth = w; c.strokeStyle = stroke; c.stroke(); }
function curva(k, pts, w, stroke) { const c = k.ctx; c.beginPath(); c.moveTo(pts[0], pts[1]); for (let i = 2; i < pts.length; i += 4) c.quadraticCurveTo(pts[i], pts[i + 1], pts[i + 2], pts[i + 3]); c.lineWidth = w; c.strokeStyle = stroke; c.stroke(); }
const v = (k, n) => gs(k.V(n));

// ---------- pose delle braccia: [spalla, gomito, mano] ----------
// "davanti" è il braccio dal lato verso cui guarda, "dietro" l'altro.
const BRACCIA = {
  giu:      { davanti: [10, -80, 12.5, -63, 12, -48], dietro: [-10, -80, -12.5, -63, -11.5, -48] },
  alto:     { davanti: [10, -80, 15, -93, 14, -110], dietro: [-10, -80, -12.5, -63, -11.5, -48] },
  avanti:   { davanti: [10, -80, 19, -73, 29, -73], dietro: [-10, -80, -12.5, -63, -11, -49] },
  mani:     { davanti: [10, -80, 16, -90, 13, -105], dietro: [-10, -80, -16, -90, -13, -105] },
  telefono: { davanti: [10, -80, 13, -64, 5, -72], dietro: [-10, -80, -12.5, -63, -11.5, -48] },
  tiene:    { davanti: [10, -80, 14, -64, 8, -58], dietro: [-10, -80, -12.5, -63, -11.5, -48] },
  corsa:    { davanti: [10, -80, 17, -70, 22, -80], dietro: [-10, -80, -16, -68, -20, -58] },
  orecchio: { davanti: [10, -80, 14, -76, 5.5, -90], dietro: [-10, -80, -12.5, -63, -11.5, -48] },
  braccia_conserte: { davanti: [10, -80, 11, -64, -4, -64], dietro: [-10, -80, -11, -64, 4, -66] },
  pugno:    { davanti: [10, -80, 18, -82, 27, -86], dietro: [-10, -80, -12, -66, -6, -70] },
};

function gambe(k, passo) {
  const s = k.spec, c = k.ctx;
  const piedi = passo ? [[-9, -4], [9, 4]] : [[-4.2, -3.6], [4.2, 3.6]]; // [x piede, x anca]
  piedi.forEach(([fx, hx], i) => {
    const gw = s.gambaLarga ? 7.5 : 6.4;
    const fill = lato(k, hx - 4, hx + 4, i === 0 ? s.gambe - 10 : s.gambe, 26);
    const ky = -25, kx = (fx + hx) / 2 + (passo ? (i ? 2 : -2) : 0);
    // coscia e polpaccio come quadrilateri morbidi
    path(c, [hx - gw / 2, -50, hx + gw / 2, -50, kx + gw * 0.42, ky, fx + 2.2, -2.5, fx - 2.2, -2.5, kx - gw * 0.42, ky]); c.fillStyle = fill; c.fill(); inchiostro(k);
    if (s.ginocchiere) ell(k, kx + 0.8, ky, 3.6, 4.4, lato(k, kx - 3, kx + 3, 70, 40));
    if (s.bandaGamba) fillPts(k, [kx - 3.4, -16, kx + 3.4, -16, kx + 3.1, -13.5, kx - 3.1, -13.5], v(k, s.bandaGamba));
    if (s.strisciaGamba) seg(k, hx + gw * 0.38, -49, fx + 1.9, -4, 0.9, v(k, s.strisciaGamba));
    // scarpa
    ell(k, fx + 1.8, -1.6, s.scarpaL || 4.4, 1.9, lin(k, 0, -3.5, 0, 0, s.scarpe + 30, s.scarpe - 20), 0, true);
    if (s.suola) fillPts(k, [fx - 2.6, -0.7, fx + 6.2, -0.7, fx + 6, 0.2, fx - 2.4, 0.2], v(k, s.suola));
  });
  if (s.gonna) fillPts(k, s.gonna, lato(k, -12, 12, s.gonnaV ?? s.torso));
}

function sedia(k) { // sedia semplice, vista di tre quarti
  const t = lato(k, -10, 18, 90, 30);
  fillPts(k, [-9, -60, -6.5, -60, -6.5, -24, -9, -24], t, true);
  fillPts(k, [-9, -27, 17, -27, 17, -23.5, -9, -23.5], t, true);
  [[-8, -23.5], [15.5, -23.5]].forEach(([x, y]) => fillPts(k, [x, y, x + 1.6, y, x + 1.6, 0, x, 0], v(k, 50), true));
}
// seduto: cosce in avanti, polpacci giù. Il busto viene poi abbassato di 24 unità.
function gambeSedute(k) {
  const s = k.spec, c = k.ctx;
  [[-3.6, 0], [3.6, 1]].forEach(([hx, i]) => {
    const fill = lato(k, hx - 4, hx + 18, i ? s.gambe : s.gambe - 12, 22), kx = hx + 15, gw = s.gambaLarga ? 7.2 : 6.2;
    path(c, [hx - 2, -26 - gw / 2, kx + 1, -26 - gw / 2, kx + gw * 0.42, -25, kx + 2.2, -2.5, kx - 2.2, -2.5, kx - gw * 0.42, -26 + gw / 2, hx - 2, -26 + gw / 2]);
    c.fillStyle = fill; c.fill(); inchiostro(k);
    ell(k, kx + 1.8, -1.6, s.scarpaL || 4.4, 1.9, lin(k, 0, -3.5, 0, 0, s.scarpe + 30, s.scarpe - 20), 0, true);
  });
}

function torso(k) {
  const s = k.spec;
  const sp = s.spalle ?? 10.5, vi = s.vita ?? 8.4, an = s.anca ?? 8.8, orlo = k.o.seduto ? Math.max(s.orlo ?? -46, -50) : (s.orlo ?? -46);
  const pts = s.torsoPts || [-sp, -81.5, sp, -81.5, sp + 0.6, -76, vi + (s.largo || 0), -58, an + (s.largo || 0), orlo, -an - (s.largo || 0), orlo, -vi - (s.largo || 0), -58, -sp - 0.6, -76];
  fillPts(k, pts, lato(k, -sp, sp, s.torso, s.contrasto ?? 34), true);
  // bordo di luce sul lato illuminato: stacca la sagoma dallo sfondo
  const lx = k.luce < 0 ? -sp - 0.2 : sp + 0.2;
  seg(k, lx, -80, lx * 0.86, orlo + 2, 0.9, v(k, s.torso + 70));
  if (s.cintura) fillPts(k, [-an, -51, an, -51, an, -48.5, -an, -48.5], v(k, s.cintura));
}

function braccio(k, b, dietro) {
  const s = k.spec;
  if (!b) return;
  const [sx, sy, ex, ey, hx, hy] = b;
  const tono = dietro ? s.manica - 14 : s.manica;
  const w = s.braccioLargo ? 6.4 : 5.2;
  const fill = lato(k, Math.min(sx, hx) - 3, Math.max(sx, hx) + 3, tono, 24);
  const sx2 = sx * 0.96, sy2 = sy + 2.6; // il braccio parte un po' sotto la linea delle spalle
  arto(k, sx2, sy2, ex, ey, w, fill);
  arto(k, ex, ey, hx, hy, w * 0.88, fill);
  seg(k, sx2, sy2, ex, ey, w, fill);
  if (!dietro && !s.spallina) ell(k, sx - 0.6, sy + 2.2, 3.4, 3, lato(k, sx - 4, sx + 3, s.torso, 24)); // spalla: copre la giuntura
  if (s.spallina && !dietro) ell(k, sx + 0.6, sy + 1.5, 5.4, 4.6, lato(k, sx - 5, sx + 5, s.spallina, 40));
  if (s.spallina && dietro) ell(k, sx - 0.4, sy + 1.5, 5, 4.4, lato(k, sx - 5, sx + 5, s.spallina - 14, 40));
  if (s.bandaBraccio) {
    const t = 0.55, bx = ex + (hx - ex) * t, by = ey + (hy - ey) * t;
    seg(k, bx - (hx - ex) * 0.06, by - (hy - ey) * 0.06, bx + (hx - ex) * 0.06, by + (hy - ey) * 0.06, w * 0.92, v(k, s.bandaBraccio));
  }
  if (s.fascia && !dietro) { // bracciale sul braccio superiore
    const bx = sx + (ex - sx) * 0.5, by = sy + (ey - sy) * 0.5;
    seg(k, bx - (ex - sx) * 0.1, by - (ey - sy) * 0.1, bx + (ex - sx) * 0.1, by + (ey - sy) * 0.1, w * 1.05, v(k, s.fascia));
  }
  // mano
  const mano = s.guanti ?? s.pelle;
  ell(k, hx, hy, 2.5, 2.7, lato(k, hx - 2.5, hx + 2.5, dietro ? mano - 12 : mano, 30), 0, true);
  if (s.nastro && !dietro) seg(k, hx - 1.8, hy - 0.4, hx + 1.8, hy - 0.4, 1.4, v(k, 235));
  if (k.o.gesso && !dietro) seg(k, ex + (hx - ex) * 0.55, ey + (hy - ey) * 0.55, hx, hy, w * 1.15, v(k, 238));
}

// ---------- testa e volto ----------
function testa(k) {
  const s = k.spec, o = k.o;
  const cx = 0, cy = s.testaY ?? -91.5, rx = s.testaRx ?? 5.7, ry = s.testaRy ?? 7.1;
  // collo
  fillPts(k, [-2.4, cy + 4, 2.4, cy + 4, 2.8, -81, -2.8, -81], lato(k, -3, 3, s.pelle - 22, 20), true);
  if (s.colletto) s.colletto(k, cy);
  if (s.dietroTesta) s.dietroTesta(k, cx, cy, rx, ry);
  // orecchio (dal lato opposto allo sguardo)
  ell(k, -rx + 0.4, cy + 0.6, 1.3, 2.1, v(k, s.pelle - 18), 0, true);
  // cranio e viso: luce dal lato giusto + guancia in ombra
  ell(k, cx, cy, rx, ry, lato(k, cx - rx, cx + rx, s.pelle, 40), 0, true);
  { // ombra netta sul lato lontano dalla luce (chiaroscuro da fumetto)
    const c = k.ctx; c.save(); c.beginPath(); c.ellipse(cx, cy, rx - 0.15, ry - 0.15, 0, 0, Math.PI * 2); c.clip();
    const lx = k.luce < 0 ? 1 : -1; // l'ombra sta dal lato opposto alla luce
    c.beginPath(); c.moveTo(cx + lx * 1.6, cy - ry); c.quadraticCurveTo(cx + lx * 3.4, cy, cx + lx * 1.4, cy + ry); c.lineTo(cx + lx * (rx + 1), cy + ry); c.lineTo(cx + lx * (rx + 1), cy - ry); c.closePath();
    c.fillStyle = gs(k.V(s.pelle - 42)); c.globalAlpha = 0.55; c.fill(); c.globalAlpha = 1;
    c.fillStyle = gs(k.V(s.pelle - 50)); c.fillRect(cx - rx, cy + ry - 1.4, rx * 2, 2); // sotto il mento
    c.restore();
  }
  // mascella un po' più squadrata per gli adulti
  if (s.mascella) { fillPts(k, [-rx + 0.6, cy + 1.5, rx - 0.2, cy + 1.5, rx - 1.3, cy + ry - 1, 1.2, cy + ry + 0.2, -rx + 1.6, cy + ry - 1.5], lato(k, -rx, rx, s.pelle - 6, 40)); k.ctx.beginPath(); k.ctx.moveTo(rx - 0.2, cy + 1.5); k.ctx.lineTo(rx - 1.3, cy + ry - 1); k.ctx.lineTo(1.2, cy + ry + 0.2); k.ctx.lineTo(-rx + 1.6, cy + ry - 1.5); inchiostro(k); }
  if (s.barba) {
    k.ctx.globalAlpha = s.barba;
    fillPts(k, [-rx + 1, cy + 1.5, rx - 0.2, cy + 1.2, rx - 1.2, cy + ry - 0.6, 1, cy + ry + 0.5, -rx + 1.6, cy + ry - 1.2], v(k, 40));
    k.ctx.globalAlpha = 1;
  }
  const coperto = (o.maschera && s.puoMaschera) || (o.visiera === 'giu' && s.visiera);
  if (!coperto) volto(k, cx, cy, rx, ry);
  if (s.capelli) s.capelli(k, cx, cy, rx, ry);
  if (s.copricapo) s.copricapo(k, cx, cy, rx, ry);
}

function volto(k, cx, cy, rx, ry) {
  const s = k.spec, espr = k.o.espr || s.espr || 'neutro';
  const f = 1.6; // il viso è girato di tre quarti verso la direzione dello sguardo
  const ex1 = cx + f - 2.2, ex2 = cx + f + 2.3, ey = cy - 0.6;
  const scuro = v(k, s.occhi ?? 18), chiaro = v(k, 245);
  // sopracciglia
  const bro = { neutro: [0, 0], urlo: [1.1, -0.4], rabbia: [1.4, 0.3], paura: [-1, -0.9], triste: [-1.1, -0.2], sorriso: [-0.2, -0.3], stanco: [-0.4, 0.5], occhi_chiusi: [0, 0.3] }[espr] || [0, 0];
  const by = ey - 1.9 + bro[1];
  seg(k, ex1 - 1.3, by - bro[0] * -0.6 - 0.2, ex1 + 1.1, by + bro[0] * 0.6, s.sopracciglia ?? 0.9, v(k, s.capelliV ?? 30));
  seg(k, ex2 - 1.0, by + bro[0] * 0.6, ex2 + 1.3, by - bro[0] * -0.6 - 0.2, s.sopracciglia ?? 0.9, v(k, s.capelliV ?? 30));
  // occhi
  if (espr === 'occhi_chiusi') {
    seg(k, ex1 - 0.9, ey + 0.2, ex1 + 0.9, ey + 0.4, 0.6, scuro); seg(k, ex2 - 0.9, ey + 0.4, ex2 + 0.9, ey + 0.2, 0.6, scuro);
  } else {
    const grande = espr === 'paura' || espr === 'urlo';
    const wx = grande ? 1.3 : 1.15, wy = grande ? 1.05 : 0.8;
    [ex1, ex2].forEach((ex, i) => {
      ell(k, ex, ey, wx, wy, chiaro);                                     // bianco dell'occhio
      ell(k, ex + 0.25 + i * 0.05, ey + 0.05, 0.62, Math.min(0.8, wy), scuro); // iride/pupilla, guarda verso dir
      ell(k, ex + 0.5, ey - 0.3, 0.2, 0.2, chiaro);                        // luce
      if (espr === 'stanco' || espr === 'triste') fillPts(k, [ex - wx - 0.1, ey - wy - 0.1, ex + wx + 0.1, ey - wy - 0.1, ex + wx + 0.1, ey - 0.05, ex - wx - 0.1, ey + 0.05], v(k, s.pelle - 25)); // palpebra pesante
      seg(k, ex - wx, ey - (espr === 'stanco' ? 0 : wy * 0.75), ex + wx, ey - (espr === 'stanco' ? 0 : wy * 0.75), 0.42, v(k, 20)); // linea della palpebra
      if (espr === 'stanco') curva(k, [ex - 1, ey + 1.2, ex, ey + 1.7, ex + 1.1, ey + 1.2], 0.35, v(k, s.pelle - 55)); // occhiaie
    });
  }
  if (s.occhiali) s.occhiali(k, ex1, ex2, ey);
  // naso: ombra dal lato in ombra
  const nx = cx + f + 2.6;
  fillPts(k, [cx + f + 0.6, ey + 0.6, nx + 0.9, ey + 3.4, cx + f + 0.4, ey + 3.8], v(k, s.pelle - 38));
  // bocca
  const my = cy + 4.4, mx = cx + f + 0.3;
  if (espr === 'urlo') { ell(k, mx, my + 0.3, 1.7, 1.6, v(k, 15)); seg(k, mx - 1.2, my - 0.8, mx + 1.2, my - 0.8, 0.5, chiaro); }
  else if (espr === 'paura') ell(k, mx, my, 1, 0.9, v(k, 25));
  else if (espr === 'sorriso') curva(k, [mx - 1.9, my - 0.4, mx, my + 1.3, mx + 1.9, my - 0.4], 0.6, v(k, 30));
  else if (espr === 'triste' || espr === 'rabbia') curva(k, [mx - 1.7, my + 0.6, mx, my - 0.5, mx + 1.7, my + 0.6], 0.6, v(k, 30));
  else seg(k, mx - 1.5, my, mx + 1.5, my, 0.55, v(k, s.pelle - 70));
  if (s.baffi) fillPts(k, [mx - 2.3, my - 0.4, mx + 2.3, my - 0.4, mx + 1.8, my - 1.6, mx - 1.8, my - 1.6], v(k, s.capelliV ?? 40));
  if (s.cicatrice) seg(k, ex2 + 0.4, by - 1, ex2 + 0.9, by + 1.2, 0.35, v(k, s.pelle + 40));
}

// ---------- accessori comuni ----------
function scudo(k) {
  const c = k.ctx;
  const x0 = 6, y0 = -86, w = 15, hh = 58;
  fillPts(k, [x0, y0, x0 + w, y0 - 1, x0 + w + 1, y0 + hh, x0 + 1, y0 + hh + 1], lin(k, x0, y0, x0 + w, y0 + hh, 175, 120));
  c.strokeStyle = v(k, 30); c.lineWidth = 1.1; path(c, [x0, y0, x0 + w, y0 - 1, x0 + w + 1, y0 + hh, x0 + 1, y0 + hh + 1]); c.stroke();
  fillPts(k, [x0 + 2, y0 + 16, x0 + w - 1, y0 + 15.5, x0 + w - 1, y0 + 20, x0 + 2, y0 + 20.5], v(k, 40));
  seg(k, x0 + 3, y0 + 3, x0 + 5, y0 + 13, 0.8, v(k, 230));
}
function cartello(k, testo, br) {
  const c = k.ctx, b = br.davanti || br.dietro;
  const hx = b[4], hy = b[5];
  seg(k, hx, hy + 1, hx, hy - 22, 1.1, v(k, 90));
  const w = 26, hh = 15, x0 = hx - w / 2, y0 = hy - 36;
  fillPts(k, [x0, y0, x0 + w, y0 + 0.6, x0 + w - 0.4, y0 + hh, x0 + 0.3, y0 + hh - 0.5], lin(k, x0, y0, x0 + w, y0 + hh, 238, 205));
  if (typeof testo === 'string') {
    c.save(); c.scale(k.dir, 1); // il testo non va ribaltato
    const cxp = k.dir * (x0 + w / 2);
    c.fillStyle = v(k, 25); c.textAlign = 'center'; c.textBaseline = 'middle';
    const righe = testo.split('|'); const sz = Math.min(5.5, 30 / Math.max(...righe.map((r) => r.length)));
    c.font = `${sz}px VT323, monospace`;
    righe.forEach((r, i) => c.fillText(r, cxp, y0 + hh / 2 + (i - (righe.length - 1) / 2) * sz * 0.95));
    c.restore();
  }
}

// ---------- capelli e copricapi ----------
function ricci(k, punti, r, tono) {
  punti.forEach(([x, y], i) => ell(k, x, y, r * (0.85 + (i % 3) * 0.12) + k.inkW, r * (0.85 + (i % 2) * 0.15) + k.inkW, k.ink));
  punti.forEach(([x, y], i) => { ell(k, x, y, r * (0.85 + (i % 3) * 0.12), r * (0.85 + (i % 2) * 0.15), lato(k, x - r, x + r, tono, 26)); ell(k, x - r * 0.3, y - r * 0.35, r * 0.28, r * 0.2, v(k, tono + 60)); });
}

// ---------- schede dei personaggi ----------
const SPEC = {
  // INÈS: 17 anni, ricci raccolti in uno chignon alto e voluminoso, felpa oversize chiara, orecchini a cerchio, jeans scuri, scarpe bianche.
  ines: (o) => ({
    pelle: 150, capelliV: 22, torso: 205, manica: 200, gambe: 55, scarpe: 230, suola: 250, largo: 1.6, spalle: 10, vita: 8.6, anca: 9.6, orlo: -45,
    testaRx: 5.5, testaRy: 6.9, sopracciglia: 1.0,
    torsoExtra(k) { // tasca a marsupio, cordini, spallacci dello zaino
      fillPts(k, [-6, -57, 6.5, -57, 7.5, -50, -7, -50], v(k, 180));
      seg(k, 0.6, -80, 0.2, -71, 0.6, v(k, 150)); seg(k, 3, -80, 3.4, -72, 0.6, v(k, 150));
      seg(k, -8.5, -81, -7.5, -60, 1.6, v(k, 60));
    },
    colletto(k, cy) { ell(k, 0, -81.5, 7.5, 2.6, lato(k, -7, 7, 190, 30)); }, // cappuccio abbassato
    capelli(k, cx, cy, rx, ry) {
      // attaccatura dei capelli e chignon di ricci in cima alla testa
      fillPts(k, [-rx - 0.4, cy + 1, -rx + 0.2, cy - ry + 1, cx + rx * 0.2, cy - ry - 0.8, rx + 0.3, cy - 3, rx - 0.6, cy - ry * 0.55, cx + 1.2, cy - ry * 0.55, -rx + 1.6, cy - 1], v(k, 24), true);
      ricci(k, [[-2.5, cy - ry - 3.2], [1.2, cy - ry - 4.4], [-0.5, cy - ry - 6.8], [3.2, cy - ry - 2.4], [-4.4, cy - ry - 1.2], [2.8, cy - ry - 6], [-3.4, cy - ry - 5.6]], 2.6, 30);
      ell(k, -rx + 0.5, cy + 2.2, 1, 2.2, v(k, 24)); // ciocca sulla tempia
      k.ctx.lineWidth = 0.45; k.ctx.strokeStyle = v(k, 230); k.ctx.beginPath(); k.ctx.arc(-rx + 0.6, cy + 3.6, 1.1, 0, Math.PI * 2); k.ctx.stroke(); // orecchino
      // elastico
      seg(k, -3.5, cy - ry - 0.6, 2.6, cy - ry - 1.4, 0.9, v(k, 200));
    },
  }),

  // SACHA: 23 anni, fisico da pugile, tutto nero, cappuccio su, passamontagna arrotolato al collo (o indossato), occhialini da piscina, nastro sulle nocche.
  sacha: (o) => ({
    pelle: 185, capelliV: 40, torso: 32, manica: 30, gambe: 26, scarpe: 30, suola: 70, spalle: 12, vita: 9.2, anca: 9, braccioLargo: true, nastro: true,
    mascella: true, cicatrice: true, puoMaschera: true, contrasto: 24,
    torsoExtra(k) { seg(k, -1, -78, -0.5, -50, 0.5, v(k, 60)); fillPts(k, [-6.5, -57, 6.5, -57, 7, -51, -7, -51], v(k, 24)); },
    colletto(k, cy) { if (!o.maschera) ell(k, 0, -82, 4.2, 2.4, lato(k, -4, 4, 45, 20)); }, // passamontagna arrotolato
    copricapo(k, cx, cy, rx, ry) {
      if (o.maschera) { // passamontagna: solo la fessura degli occhi
        ell(k, cx, cy + 0.5, rx + 0.4, ry + 0.6, lato(k, -rx, rx, 30, 22), 0, true);
        fillPts(k, [cx - 1.5, cy - 2.4, cx + 5.6, cy - 2.4, cx + 5.4, cy + 0.6, cx - 1.3, cy + 0.6], v(k, 175));
        ell(k, cx + 0.3, cy - 0.9, 0.7, 0.85, v(k, 15)); ell(k, cx + 3.9, cy - 0.9, 0.7, 0.85, v(k, 15));
        seg(k, cx + 1.8, cy - 3.6, cx + 2.8, cy - 3.3, 0.8, v(k, 15)); // sopracciglio aggrottato visibile
      }
      if (o.cappuccio !== false) { // cappuccio: guscio largo intorno alla testa, ombra profonda attorno al viso
        const c = k.ctx; c.beginPath();
        c.moveTo(-rx - 3.4, cy + 8.5); c.bezierCurveTo(-rx - 4.6, cy - ry - 3.6, rx + 3.6, cy - ry - 4.4, rx + 2.6, cy - 0.5);
        c.lineTo(rx + 1.2, cy - 1.8); c.bezierCurveTo(rx + 0.6, cy - ry - 0.2, -rx + 0.2, cy - ry - 0.6, -rx + 0.4, cy + 4.5);
        c.lineTo(-rx - 0.4, cy + 9); c.closePath(); c.fillStyle = lato(k, -rx - 4, rx + 3, 46, 28); c.fill(); inchiostro(k);
        curva(k, [rx + 1.1, cy - 1.8, rx + 0.4, cy - ry - 0.4, cx - 1, cy - ry - 0.3], 1.1, v(k, 12)); // ombra interna
        seg(k, rx + 2.5, cy - 0.5, rx + 1.4, cy + 7, 0.7, v(k, 100)); // bordo in luce
        seg(k, rx + 0.6, cy + 6, rx + 0.4, cy + 10, 0.5, v(k, 150)); // cordino
      }
      if (o.occhialini) { seg(k, -rx - 1, cy - ry + 0.4, rx + 1.2, cy - ry - 0.6, 0.7, v(k, 60)); ell(k, cx + 3.4, cy - ry - 0.4, 1.6, 1.1, v(k, 200)); }
    },
  }),

  // JÉRÔME: 34 anni, caporal-chef SDIS 77. Casco F1 cromato con visiera dorata alzata (e un graffio bianco), giacca blu con bande riflettenti, baffi e barba corta, bracciale arancione.
  jerome: (o) => ({
    pelle: 175, capelliV: 45, torso: 52, manica: 50, gambe: 45, scarpe: 28, suola: 20, spalle: 12, vita: 10, anca: 9.6, largo: 0.6, braccioLargo: true,
    mascella: true, baffi: true, barba: 0.18, espr: 'stanco', bandaBraccio: 245, bandaGamba: 240, cintura: 30, fascia: o.sciopero ? 175 : null, guanti: o.guanti ? 50 : null,
    torsoExtra(k) {
      fillPts(k, [-10.6, -66, 10.6, -66, 10.2, -63, -10.2, -63], v(k, 245)); // banda riflettente sul petto
      fillPts(k, [-9.4, -54, 9.4, -54, 9.4, -51.5, -9.4, -51.5], v(k, 240));
      seg(k, 0.4, -81, 0.6, -48, 0.6, v(k, 30)); // zip
      fillPts(k, [3, -76, 7.4, -76, 7.4, -72.5, 3, -72.5], v(k, 85)); // taschino
      if (o.scritta !== false) { k.ctx.save(); k.ctx.scale(k.dir, 1); k.ctx.fillStyle = v(k, 230); k.ctx.font = '2.6px VT323, monospace'; k.ctx.textAlign = 'center'; k.ctx.fillText('POMPIERS', 0, -58.5); k.ctx.restore(); }
    },
    colletto(k, cy) { fillPts(k, [-4.4, -84.5, 4.4, -84.5, 5.2, -80.5, -5.2, -80.5], v(k, 40)); },
    capelli(k, cx, cy, rx, ry) { if (o.casco === false) fillPts(k, [-rx - 0.2, cy - 0.5, -rx + 0.6, cy - ry + 0.6, rx * 0.6, cy - ry - 0.2, rx + 0.2, cy - 3.2, rx - 1.4, cy - ry + 1.6, -rx + 1.8, cy - 1.8], v(k, 45)); },
    copricapo(k, cx, cy, rx, ry) {
      if (o.casco === false) return;
      // casco F1: cupola con cresta che poggia sulla fronte, visiera dorata sollevata, paranuca dietro
      const c = k.ctx, top = cy - 3.2;
      fillPts(k, [-rx - 1.2, top - 1, -rx - 1, cy + 6.6, -rx + 1.6, cy + 6, -rx + 1.2, top], v(k, 55), true); // paranuca
      c.beginPath(); c.moveTo(-rx - 1.3, top + 0.4); c.bezierCurveTo(-rx - 1.8, top - ry - 2.8, rx + 2, top - ry - 2.8, rx + 1.5, top + 0.2); c.closePath();
      c.fillStyle = lin(k, -rx, top - ry, rx, top, 242, 120); c.fill(); inchiostro(k);
      seg(k, cx - 0.8, top - ry - 0.6, cx - 0.4, top - 0.6, 1, v(k, 205)); // cresta
      seg(k, cx - 2.6, top - ry + 0.4, cx - 2.2, top - 1.4, 0.7, v(k, 252)); // riflesso
      arto(k, -rx - 1.5, top + 0.3, rx + 1.7, top + 0.1, 0.9, v(k, 85)); // bordo
      if (o.visiera !== 'giu') { c.beginPath(); c.moveTo(-rx - 0.6, top - ry + 2.2); c.quadraticCurveTo(cx, top - ry - 0.6, rx + 1.2, top - ry + 2.4); c.lineTo(rx + 1.4, top - ry + 4.4); c.quadraticCurveTo(cx, top - ry + 1.6, -rx - 0.4, top - ry + 4.2); c.closePath(); c.fillStyle = lin(k, 0, top - ry, 0, top - ry + 4, 210, 130); c.fill(); inchiostro(k); }
      else fillPts(k, [-rx + 0.6, top - 0.4, rx + 2.2, top - 0.6, rx + 2.4, cy + 4, cx + 0.6, cy + 5, -rx + 0.8, cy + 3.6], lin(k, 0, top, 0, cy + 4, 205, 130), true);
      if (o.graffio !== false) { seg(k, cx + 1.4, top - ry + 0.6, cx + 3.4, top - 1.6, 0.65, v(k, 255)); seg(k, cx + 1.8, top - ry + 0.8, cx + 3.8, top - 1.8, 0.25, v(k, 30)); }
    },
  }),

  // ODILE: 52 anni, caschetto grigio, occhiali tondi, la lunga sciarpa verde regalata dalla classe del 2019, cappotto, borsa a tracolla piena di volantini.
  odile: (o) => ({
    pelle: 178, capelliV: 120, occhi: 30, mascella: false, torso: 92, manica: 88, gambe: 40, scarpe: 35, spalle: 9.2, vita: 8, anca: 9.4, orlo: -24, testaRx: 5.4, testaRy: 6.9, espr: o.espr,
    torsoPts: null,
    mantello(k) {}, // il cappotto è il torso lungo
    torsoExtra(k) {
      seg(k, 1.5, -80, 2.2, -26, 0.6, v(k, 60)); // abbottonatura
      [-74, -64, -54, -44].forEach((y) => ell(k, 2.8, y, 0.55, 0.55, v(k, 40)));
      seg(k, -8, -81, 9, -50, 1.4, v(k, 45)); // tracolla
      fillPts(k, [7, -52, 13.4, -52.6, 13.6, -43, 7.4, -42.4], lato(k, 7, 13.6, 70, 30)); // borsa
      // sciarpa: giro al collo e lembo lungo che pende
      fillPts(k, [-1.4, -82, 3.8, -82, 4.6, -56, 1.6, -55.6], lato(k, -1, 5, 150, 26));
      seg(k, 1.8, -59, 4.4, -59, 0.4, v(k, 210)); seg(k, 1.7, -57, 4.5, -57, 0.4, v(k, 210));
    },
    colletto(k, cy) { ell(k, 0.4, -82.6, 6.2, 2.6, lato(k, -6, 6, 155, 30)); },
    dietroTesta(k, cx, cy, rx, ry) { // caschetto: massa dietro la testa
      const c = k.ctx; c.beginPath(); c.moveTo(-rx - 1.2, cy + 5); c.quadraticCurveTo(-rx - 2.4, cy - ry - 1.6, cx + 0.8, cy - ry - 1.3); c.quadraticCurveTo(rx + 2.2, cy - ry - 0.6, rx + 1.4, cy + 1); c.lineTo(rx + 0.8, cy + 5); c.closePath();
      c.fillStyle = lin(k, -rx, cy - ry, rx, cy + 5, 215, 130); c.fill(); inchiostro(k);
    },
    capelli(k, cx, cy, rx, ry) {
      // frangia di lato e ciocca che copre la tempia
      const c = k.ctx; c.beginPath(); c.moveTo(-rx - 0.8, cy + 4.6); c.lineTo(-rx - 0.6, cy - 1); c.quadraticCurveTo(-rx, cy - ry - 0.8, cx + 1, cy - ry - 0.7);
      c.quadraticCurveTo(rx + 1.4, cy - ry, rx + 0.8, cy - 1.4); c.quadraticCurveTo(rx - 1.6, cy - ry + 2, cx - 1, cy - ry + 2.6); c.quadraticCurveTo(-rx + 1.6, cy - 2, -rx + 1.3, cy + 4.6); c.closePath();
      c.fillStyle = lin(k, -rx, cy - ry, rx, cy, 222, 150); c.fill(); inchiostro(k);
      curva(k, [-rx + 1, cy - ry + 1.2, cx, cy - ry - 0.2, rx - 0.4, cy - ry + 1.6], 0.45, v(k, 245));
      seg(k, -rx + 1, cy - ry + 1, cx + 1.6, cy - ry + 0.4, 0.5, v(k, 235));
    },
    occhiali(k, ex1, ex2, ey) {
      const c = k.ctx; c.lineWidth = 0.42; c.strokeStyle = v(k, 25);
      c.beginPath(); c.arc(ex1, ey, 1.55, 0, Math.PI * 2); c.stroke();
      c.beginPath(); c.arc(ex2, ey, 1.55, 0, Math.PI * 2); c.stroke();
      seg(k, ex1 + 1.55, ey - 0.2, ex2 - 1.55, ey - 0.2, 0.4, v(k, 25));
      seg(k, ex1 - 1.55, ey - 0.2, -4.6, ey - 0.8, 0.4, v(k, 25));
      seg(k, ex1 - 0.7, ey - 0.9, ex1 - 0.1, ey - 1.2, 0.35, v(k, 250));
    },
  }),

  // MEHDI: 26 anni, gardien de la paix (CSI 93). Casco antisommossa con visiera, spalline imbottite, protezioni, guanti, manganello. Barba corta.
  mehdi: (o) => o.borghese ? ({ ...SPEC.adulto({ ...o, seed: 0 }), pelle: 150, capelliV: 25, torso: 70, manica: 66, barba: 0.35, mascella: true, espr: o.espr,
    colletto(k, cy) { ell(k, 0, -81.5, 6.4, 2.4, lato(k, -6, 6, 60, 30)); },
    capelli(k, cx, cy, rx, ry) { fillPts(k, [-rx - 0.2, cy, -rx + 0.4, cy - ry + 0.8, rx * 0.4, cy - ry - 0.4, rx + 0.2, cy - 3.4, rx - 1, cy - ry + 1.4, -rx + 1.6, cy - 2.2], v(k, 25), true); } }) : ({
    pelle: 150, capelliV: 25, torso: 45, manica: 42, gambe: 38, scarpe: 22, suola: 15, spalle: 12.2, vita: 10, anca: 9.6, largo: 1, braccioLargo: true, gambaLarga: true,
    ginocchiere: true, spallina: 62, guanti: 30, cintura: 25, mascella: true, barba: 0.35, visiera: true, espr: o.espr,
    torsoExtra(k) {
      // gilet di protezione a placche
      fillPts(k, [-8.6, -79, 8.6, -79, 8.8, -60, -8.8, -60], lato(k, -9, 9, 60, 36));
      seg(k, -8.6, -70, 8.6, -70, 0.5, v(k, 30)); seg(k, 0, -79, 0, -60, 0.5, v(k, 30));
      fillPts(k, [-5, -77, -1, -77, -1, -74.6, -5, -74.6], v(k, 200)); // scritta POLICE (rettangolo)
      if (o.manganello !== false) seg(k, -8, -50, -12.5, -33, 1.4, v(k, 20));
      fillPts(k, [3, -52, 7, -52, 7, -47, 3, -47], v(k, 35)); // fondina/radio
    },
    colletto(k, cy) { fillPts(k, [-4, -85, 4, -85, 4.8, -80.5, -4.8, -80.5], v(k, 35)); },
    capelli(k, cx, cy, rx, ry) { if (o.casco === false) fillPts(k, [-rx - 0.2, cy, -rx + 0.4, cy - ry + 0.8, rx * 0.4, cy - ry - 0.4, rx + 0.2, cy - 3.4, rx - 1, cy - ry + 1.4, -rx + 1.6, cy - 2.2], v(k, 25)); },
    copricapo(k, cx, cy, rx, ry) {
      if (o.casco === false) return;
      const c = k.ctx;
      // cupola del casco: copre il cranio fino alle sopracciglia, scende dietro fino alla nuca
      const top = cy - 3;
      c.beginPath(); c.moveTo(-rx - 2.6, cy + 6); c.lineTo(-rx - 2.4, top);
      c.ellipse(cx, top, rx + 2.3, ry + 1.4, 0, Math.PI, Math.PI * 2);
      c.lineTo(rx + 2.4, top + 0.6); c.lineTo(cx - 0.6, top + 0.2); c.lineTo(-rx + 1.2, cy + 1); c.lineTo(-rx + 0.8, cy + 6.4); c.closePath();
      c.fillStyle = lin(k, -rx, top - ry, rx + 2, cy + 4, 90, 25); c.fill(); inchiostro(k);
      seg(k, -rx - 0.6, top - ry + 0.6, cx + 1.6, top - ry - 1, 0.9, v(k, 160)); // riflesso
      if (o.visiera === 'giu') { // visiera abbassata: il volto si intravede appena dietro il policarbonato
        fillPts(k, [-rx + 0.4, top, rx + 2.6, top, rx + 2.9, cy + 6.6, cx + 0.5, cy + 7.8, -rx + 0.6, cy + 6.4], lin(k, 0, top, rx, cy + 7, 185, 100), true);
        ell(k, cx + 0.6, cy - 0.6, 0.55, 0.6, v(k, 30)); ell(k, cx + 3.9, cy - 0.6, 0.55, 0.6, v(k, 30));
        seg(k, -rx + 1.2, top + 1, rx + 1.8, top + 1, 0.5, v(k, 245));
        seg(k, rx - 0.4, cy - 1.4, rx + 1.6, cy + 4, 0.5, v(k, 235));
      } else { // visiera alzata sopra la fronte
        c.beginPath(); c.moveTo(-rx - 1.4, top - 0.4); c.quadraticCurveTo(cx, top - ry - 2.4, rx + 2.6, top - 0.6); c.lineTo(rx + 2.6, top + 1); c.quadraticCurveTo(cx, top - ry + 0.2, -rx - 1.2, top + 1.2); c.closePath(); c.fillStyle = lin(k, 0, top - ry, 0, top + 1, 215, 120); c.fill(); inchiostro(k);
      }
      seg(k, rx + 1.6, cy + 2, cx + 1.4, cy + ry + 0.6, 0.6, v(k, 40)); // sottogola
    },
  }),

  // NASSIM: 15 anni, magro, felpa grigia (cappuccio su o giù), pantaloni della tuta con la striscia, ricci corti, sneakers enormi.
  nassim: (o) => ({
    pelle: 150, capelliV: 22, torso: 150, manica: 145, gambe: 35, scarpe: 225, suola: 250, scarpaL: 4.8, spalle: 9.4, vita: 8, anca: 8, orlo: -46, largo: 0.8,
    strisciaGamba: 210, testaRx: 5.6, testaRy: 7, espr: o.espr,
    torsoExtra(k) { fillPts(k, [-5.6, -57, 5.8, -57, 6.4, -51, -6, -51], v(k, 130)); seg(k, 0.6, -80, 0.4, -72, 0.5, v(k, 220)); },
    colletto(k, cy) { if (!o.cappuccio) ell(k, 0, -81.5, 6.6, 2.4, lato(k, -6, 6, 140, 30)); },
    capelli(k, cx, cy, rx, ry) {
      if (o.cappuccio) return;
      ricci(k, [[-4, cy - ry + 1.4], [-1.2, cy - ry + 0.2], [1.8, cy - ry + 0.4], [4, cy - ry + 2.2], [-5, cy - 2], [-2.6, cy - ry - 0.8], [0.8, cy - ry - 1]], 1.7, 24);
    },
    copricapo(k, cx, cy, rx, ry) {
      if (!o.cappuccio) return;
      const c = k.ctx; c.beginPath();
      c.moveTo(-rx - 2, cy + 6.5); c.quadraticCurveTo(-rx - 3, cy - ry - 2.4, cx + 1, cy - ry - 2);
      c.quadraticCurveTo(rx + 2.4, cy - ry - 1.4, rx + 1.4, cy - 1.5); c.lineTo(rx + 0.2, cy - 2.6);
      c.quadraticCurveTo(rx, cy - ry + 0.8, cx, cy - ry + 0.6); c.quadraticCurveTo(-rx + 0.6, cy - ry + 1.2, -rx + 0.8, cy + 5);
      c.lineTo(-rx - 0.6, cy + 8); c.closePath(); c.fillStyle = lato(k, -rx - 3, rx + 2, 150, 30); c.fill(); inchiostro(k);
      if (o.maschera) { fillPts(k, [-rx + 0.6, cy + 0.8, rx + 0.6, cy + 0.6, rx - 0.4, cy + ry, -rx + 1.2, cy + ry - 0.6], v(k, 25)); }
    },
  }),

  // comparse
  pompiere: (o) => ({ ...SPEC.jerome({ ...o, graffio: false }), baffi: (o.seed || 0) % 2 === 0, barba: 0, espr: o.espr || 'neutro', pelle: 160 + ((o.seed || 0) % 3) * 20 }),
  poliziotto: (o) => ({ ...SPEC.mehdi({ ...o, visiera: o.visiera ?? 'giu' }), barba: 0, pelle: 140 + ((o.seed || 0) % 3) * 25 }),
  ragazzo: (o) => {
    const s = o.seed || 0, cappuccio = s % 3 === 0;
    return { ...SPEC.nassim({ ...o, cappuccio }), torso: [60, 110, 170, 40][s % 4], manica: [60, 110, 170, 40][s % 4] - 4, pelle: [150, 190, 120, 170][s % 4], strisciaGamba: s % 2 ? 200 : null };
  },
  ragazza: (o) => {
    const s = o.seed || 0;
    return { ...SPEC.ines(o), torso: [205, 90, 140, 60][s % 4], manica: [200, 86, 136, 56][s % 4], pelle: [150, 195, 125, 175][s % 4], torsoExtra: null };
  },
  adulto: (o) => {
    const s = o.seed || 0;
    return { pelle: [170, 140, 195][s % 3], capelliV: [30, 160, 60][s % 3], torso: [70, 120, 50, 160][s % 4], manica: [66, 116, 46, 156][s % 4], gambe: 45, scarpe: 30, spalle: 11, mascella: true, espr: o.espr,
      capelli(k, cx, cy, rx, ry) { fillPts(k, [-rx - 0.3, cy - 0.5, -rx + 0.5, cy - ry + 0.5, rx * 0.5, cy - ry - 0.3, rx + 0.2, cy - 3, rx - 1.2, cy - ry + 1.6, -rx + 1.7, cy - 1.8], v(k, this.capelliV)); } };
  },
  bambina: (o) => ({ ...SPEC.nassim({ ...o, cappuccio: false }), torso: 215, manica: 210, gambe: 120, scarpe: 200, strisciaGamba: null, testaRx: 7.2, testaRy: 8.6, testaY: -88, pelle: 185, espr: o.espr || 'sorriso',
    capelli(k, cx, cy, rx, ry) { fillPts(k, [-rx - 0.4, cy + 1, -rx + 0.2, cy - ry + 0.8, cx + 1, cy - ry - 0.8, rx + 0.4, cy - 2.6, rx - 1, cy - ry + 2, -rx + 1.8, cy - 0.6], v(k, 60), true);
      ell(k, -rx - 1.6, cy - 1, 2, 3, lato(k, -rx - 3, -rx, 60, 20), 0.4, true); ell(k, rx + 1.4, cy - 2, 1.8, 2.8, lato(k, rx, rx + 3, 60, 20), -0.4, true); } }),
  adulta: (o) => ({ ...SPEC.adulto(o), pelle: [190, 150, 170][(o.seed || 0) % 3], spalle: 9.6, vita: 8, anca: 9.4, torso: [150, 90, 200][(o.seed || 0) % 3], manica: [146, 86, 196][(o.seed || 0) % 3], mascella: false,
    capelli(k, cx, cy, rx, ry) { const c = k.ctx; c.beginPath(); c.moveTo(-rx - 1, cy + 7); c.quadraticCurveTo(-rx - 2.6, cy - ry - 2, cx + 1, cy - ry - 1); c.quadraticCurveTo(rx + 2, cy - ry, rx + 0.6, cy - 2); c.quadraticCurveTo(cx, cy - ry + 2, -rx + 1.2, cy - 1); c.lineTo(-rx + 0.8, cy + 7); c.closePath(); c.fillStyle = lato(k, -rx, rx, [70, 30, 150][(o.seed || 0) % 3], 26); c.fill(); inchiostro(k); } }),
  anziano: (o) => ({ ...SPEC.adulto(o), pelle: 185, torso: 110, manica: 106, capelliV: 225, espr: o.espr || 'triste', spalle: 10, mascella: true,
    torsoExtra(k) { seg(k, 0.5, -80, 0.5, -48, 0.6, v(k, 70)); [-74, -66, -58].forEach((y) => ell(k, 1.6, y, 0.5, 0.5, v(k, 60))); },
    capelli(k, cx, cy, rx, ry) { fillPts(k, [-rx - 0.4, cy + 2.4, -rx, cy - 3, -rx + 1.8, cy - 1.8, -rx + 1.4, cy + 2.4], v(k, 225), true); seg(k, -rx + 1, cy - ry + 1.6, rx - 1, cy - ry + 1, 0.6, v(k, 200)); } }),
  carrel: (o) => ({ ...SPEC.mehdi({ ...o, casco: false }), barba: 0, pelle: 185, espr: o.espr || 'neutro', mascella: true,
    capelli(k, cx, cy, rx, ry) { seg(k, -rx + 0.8, cy - ry + 1.6, rx - 1.6, cy - ry + 0.8, 0.5, v(k, 245)); } }), // testa rasata, lucida
  fabre: (o) => ({ ...SPEC.mehdi({ ...o, casco: false }), barba: 0.12, pelle: 200, espr: o.espr || 'sorriso',
    capelli(k, cx, cy, rx, ry) { fillPts(k, [-rx - 0.4, cy - 0.4, -rx + 0.2, cy - ry + 0.2, rx * 0.8, cy - ry - 1.2, rx + 1, cy - ry + 0.6, rx - 0.6, cy - ry + 1.6, -rx + 1.6, cy - 1.8], v(k, 150), true); } }),
  anziana: (o) => ({ ...SPEC.odile(o), torso: 175, manica: 170, capelliV: 220, occhiali: null, torsoExtra(k) { seg(k, 0, -80, 0, -26, 0.6, v(k, 120)); }, colletto: null, espr: o.espr || 'triste' }),
  infermiera: (o) => ({ ...SPEC.adulto(o), pelle: 120, torso: 205, manica: 200, gambe: 200, capelliV: 20, espr: o.espr,
    capelli(k, cx, cy, rx, ry) { fillPts(k, [-rx - 0.6, cy + 3, -rx + 0.2, cy - ry + 0.2, rx * 0.6, cy - ry - 0.8, rx + 0.6, cy - 2.4, rx - 1, cy - ry + 1.4, -rx + 1.5, cy - 1], v(k, 22)); ell(k, -rx + 0.4, cy - ry + 0.6, 2.6, 2.4, v(k, 22)); } }),
};
