// Audio chiptune minimale, tutto sintetizzato con WebAudio (nessun file).
// Ambienti in loop (folla, sirene, crepitio, metro, notte) + effetti brevi.

let ac = null, master = null, amb = null, ambNome = null, attivo = true;

function init() {
  if (ac) return true;
  try {
    ac = new (window.AudioContext || window.webkitAudioContext)();
    master = ac.createGain(); master.gain.value = attivo ? 0.5 : 0; master.connect(ac.destination);
    return true;
  } catch (e) { return false; }
}

export function sblocca() { if (init() && ac.state === 'suspended') ac.resume(); }
export function setAttivo(v) { attivo = v; if (master) master.gain.setTargetAtTime(v ? 0.5 : 0, ac.currentTime, 0.05); }

function rumore(sec = 2) {
  const b = ac.createBuffer(1, ac.sampleRate * sec, ac.sampleRate), d = b.getChannelData(0);
  for (let i = 0; i < d.length; i++) d[i] = Math.random() * 2 - 1;
  return b;
}

function sorgenteRumore(loop = true) { const s = ac.createBufferSource(); s.buffer = rumore(2); s.loop = loop; return s; }

// ---------- ambienti ----------
const AMBIENTI = {
  folla() { // brusio filtrato che respira
    const n = sorgenteRumore(), f = ac.createBiquadFilter(), g = ac.createGain(), lfo = ac.createOscillator(), lg = ac.createGain();
    f.type = 'bandpass'; f.frequency.value = 500; f.Q.value = 0.7; g.gain.value = 0.10;
    lfo.frequency.value = 0.2; lg.gain.value = 0.05; lfo.connect(lg).connect(g.gain);
    n.connect(f).connect(g); n.start(); lfo.start();
    return { out: g, stop() { n.stop(); lfo.stop(); } };
  },
  sirene() { // due toni francesi (la-re), lontani
    const o = ac.createOscillator(), g = ac.createGain(), f = ac.createBiquadFilter();
    o.type = 'square'; f.type = 'lowpass'; f.frequency.value = 900; g.gain.value = 0.025;
    const t0 = ac.currentTime; for (let i = 0; i < 400; i++) o.frequency.setValueAtTime(i % 2 ? 587 : 440, t0 + i * 0.6);
    o.connect(f).connect(g); o.start();
    const base = AMBIENTI.folla(), mix = ac.createGain(); g.connect(mix); base.out.connect(mix);
    return { out: mix, stop() { o.stop(); base.stop(); } };
  },
  fuoco() { // crepitio
    const n = sorgenteRumore(), f = ac.createBiquadFilter(), g = ac.createGain(); f.type = 'highpass'; f.frequency.value = 2000; g.gain.value = 0;
    n.connect(f).connect(g); n.start();
    let vivo = true; const tick = () => { if (!vivo) return; const t = ac.currentTime; g.gain.setValueAtTime(Math.random() * 0.25, t); g.gain.exponentialRampToValueAtTime(0.001, t + 0.03 + Math.random() * 0.05); setTimeout(tick, 40 + Math.random() * 160); }; tick();
    const low = sorgenteRumore(), lf = ac.createBiquadFilter(), lg = ac.createGain(); lf.type = 'lowpass'; lf.frequency.value = 200; lg.gain.value = 0.12; low.connect(lf).connect(lg); low.start();
    const mix = ac.createGain(); g.connect(mix); lg.connect(mix);
    return { out: mix, stop() { vivo = false; n.stop(); low.stop(); } };
  },
  metro() {
    const n = sorgenteRumore(), f = ac.createBiquadFilter(), g = ac.createGain(), o = ac.createOscillator(), og = ac.createGain();
    f.type = 'lowpass'; f.frequency.value = 300; g.gain.value = 0.2; o.type = 'triangle'; o.frequency.value = 55; og.gain.value = 0.03;
    n.connect(f).connect(g); o.connect(og); n.start(); o.start(); const mix = ac.createGain(); g.connect(mix); og.connect(mix);
    return { out: mix, stop() { n.stop(); o.stop(); } };
  },
  notte() { // drone basso e quasi silenzio
    const o = ac.createOscillator(), o2 = ac.createOscillator(), g = ac.createGain(); o.type = 'sine'; o.frequency.value = 55; o2.type = 'sine'; o2.frequency.value = 82.4; g.gain.value = 0.04;
    o.connect(g); o2.connect(g); o.start(); o2.start(); return { out: g, stop() { o.stop(); o2.stop(); } };
  },
  interno() { const o = ac.createOscillator(), g = ac.createGain(); o.type = 'sine'; o.frequency.value = 100; g.gain.value = 0.012; o.connect(g); o.start(); return { out: g, stop() { o.stop(); } }; },
};

export function ambiente(nome) {
  if (!init() || nome === ambNome) return;
  const vecchio = amb; ambNome = nome;
  if (vecchio) { vecchio.g.gain.setTargetAtTime(0, ac.currentTime, 0.4); setTimeout(() => { try { vecchio.a.stop(); } catch (e) { } }, 1500); }
  amb = null;
  if (!nome || nome === 'silenzio' || !AMBIENTI[nome]) return;
  const a = AMBIENTI[nome](), g = ac.createGain(); g.gain.value = 0; a.out.connect(g).connect(master); g.gain.setTargetAtTime(1, ac.currentTime, 0.6);
  amb = { a, g };
}

// ---------- effetti ----------
function env(node, t, a, d, v) { node.gain.setValueAtTime(0, t); node.gain.linearRampToValueAtTime(v, t + a); node.gain.exponentialRampToValueAtTime(0.0001, t + a + d); }

const SFX = {
  blip() { const o = ac.createOscillator(), g = ac.createGain(), t = ac.currentTime; o.type = 'square'; o.frequency.value = 880; env(g, t, 0.005, 0.05, 0.05); o.connect(g).connect(master); o.start(t); o.stop(t + 0.1); },
  tasto() { const o = ac.createOscillator(), g = ac.createGain(), t = ac.currentTime; o.type = 'square'; o.frequency.value = 1400 + Math.random() * 300; env(g, t, 0.001, 0.015, 0.012); o.connect(g).connect(master); o.start(t); o.stop(t + 0.03); },
  notifica() { const t = ac.currentTime; [988, 1318].forEach((f, i) => { const o = ac.createOscillator(), g = ac.createGain(); o.type = 'square'; o.frequency.value = f; env(g, t + i * 0.08, 0.005, 0.08, 0.06); o.connect(g).connect(master); o.start(t + i * 0.08); o.stop(t + i * 0.08 + 0.2); }); },
  sirena() { const o = ac.createOscillator(), g = ac.createGain(), t = ac.currentTime; o.type = 'square'; for (let i = 0; i < 6; i++) o.frequency.setValueAtTime(i % 2 ? 587 : 440, t + i * 0.45); env(g, t, 0.05, 2.6, 0.06); o.connect(g).connect(master); o.start(t); o.stop(t + 2.8); },
  vetro() { const n = ac.createBufferSource(), f = ac.createBiquadFilter(), g = ac.createGain(), t = ac.currentTime; n.buffer = rumore(1); f.type = 'highpass'; f.frequency.value = 3000; env(g, t, 0.002, 0.4, 0.5); n.connect(f).connect(g).connect(master); n.start(t); n.stop(t + 0.5); },
  colpo() { const n = ac.createBufferSource(), f = ac.createBiquadFilter(), g = ac.createGain(), t = ac.currentTime; n.buffer = rumore(1); f.type = 'lowpass'; f.frequency.value = 800; env(g, t, 0.002, 0.2, 0.6); n.connect(f).connect(g).connect(master); n.start(t); n.stop(t + 0.3); },
  granata() { const n = ac.createBufferSource(), f = ac.createBiquadFilter(), g = ac.createGain(), o = ac.createOscillator(), og = ac.createGain(), t = ac.currentTime;
    n.buffer = rumore(2); f.type = 'lowpass'; f.frequency.setValueAtTime(3000, t); f.frequency.exponentialRampToValueAtTime(80, t + 1.2); env(g, t, 0.003, 1.4, 0.9);
    o.frequency.setValueAtTime(90, t); o.frequency.exponentialRampToValueAtTime(30, t + 0.8); env(og, t, 0.003, 0.9, 0.6);
    n.connect(f).connect(g).connect(master); o.connect(og).connect(master); n.start(t); n.stop(t + 1.6); o.start(t); o.stop(t + 1); },
  lacrimogeno() { const t = ac.currentTime; const o = ac.createOscillator(), g = ac.createGain(); o.frequency.value = 160; env(g, t, 0.002, 0.15, 0.4); o.connect(g).connect(master); o.start(t); o.stop(t + 0.2);
    const n = ac.createBufferSource(), f = ac.createBiquadFilter(), g2 = ac.createGain(); n.buffer = rumore(2); f.type = 'bandpass'; f.frequency.value = 1200; env(g2, t + 0.1, 0.2, 1.5, 0.15); n.connect(f).connect(g2).connect(master); n.start(t); n.stop(t + 2); },
  getto() { const n = ac.createBufferSource(), f = ac.createBiquadFilter(), g = ac.createGain(), t = ac.currentTime; n.buffer = rumore(2); f.type = 'bandpass'; f.frequency.value = 1800; env(g, t, 0.05, 1.6, 0.25); n.connect(f).connect(g).connect(master); n.start(t); n.stop(t + 1.8); },
  cuore() { const t = ac.currentTime; [0, 0.18].forEach((d) => { const o = ac.createOscillator(), g = ac.createGain(); o.frequency.value = 50; env(g, t + d, 0.01, 0.15, 0.5); o.connect(g).connect(master); o.start(t + d); o.stop(t + d + 0.25); }); },
  timer() { const o = ac.createOscillator(), g = ac.createGain(), t = ac.currentTime; o.type = 'square'; o.frequency.value = 220; env(g, t, 0.002, 0.04, 0.04); o.connect(g).connect(master); o.start(t); o.stop(t + 0.06); },
};

export function sfx(nome) { if (!init() || !SFX[nome]) return; try { SFX[nome](); } catch (e) { } }
