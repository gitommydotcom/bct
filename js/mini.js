// Mini-interazioni "tieni premuto". Nessuna è legata a un gesto violento.
// Ognuna restituisce una Promise<boolean> (riuscita o no): la storia va avanti in entrambi i casi.
import { t } from './i18n.js';
import { sfx } from './audio.js';

const $ = (id) => document.getElementById(id);

export function avviaMini(tipo, { renderer, senzaTempo = false } = {}) {
  const box = $('mini'), fill = $('mini-fill'), btn = $('mini-btn'), label = $('mini-label');
  box.hidden = false; label.textContent = t(`mini.${tipo}`); btn.textContent = t('ui.tieni');
  let premuto = false;
  const giu = (e) => { e.preventDefault(); premuto = true; btn.classList.add('held'); };
  const su = (e) => { if (e) e.preventDefault(); premuto = false; btn.classList.remove('held'); };
  const kd = (e) => { if (e.code === 'Space' || e.key === 'Enter') { if (!e.repeat) giu(e); } };
  const ku = (e) => { if (e.code === 'Space' || e.key === 'Enter') su(e); };
  btn.addEventListener('pointerdown', giu); btn.addEventListener('pointerup', su); btn.addEventListener('pointercancel', su); btn.addEventListener('pointerleave', su);
  window.addEventListener('keydown', kd, true); window.addEventListener('keyup', ku, true);
  btn.focus({ preventScroll: true });

  return new Promise((risolvi) => {
    let v = 0, tempo = 0, ultimo = performance.now(), prossimoSasso = 1.4, punti = 0, campioni = 0;
    const limite = { getto: senzaTempo ? 60 : 14, respiro: 13, maschera: senzaTempo ? 60 : 16 }[tipo] || 12;
    const fine = (ok) => {
      btn.removeEventListener('pointerdown', giu); btn.removeEventListener('pointerup', su); btn.removeEventListener('pointercancel', su); btn.removeEventListener('pointerleave', su);
      window.removeEventListener('keydown', kd, true); window.removeEventListener('keyup', ku, true);
      setTimeout(() => { box.hidden = true; fill.style.width = '0'; risolvi(ok); }, 500);
    };
    const passo = (ora) => {
      const dt = Math.min(0.1, (ora - ultimo) / 1000); ultimo = ora; tempo += dt;
      if (tipo === 'getto') {
        if (premuto) { v += dt * 0.11; if (Math.random() < dt * 3) sfx('getto'); }
        else v -= dt * 0.03;
        if (tempo > prossimoSasso) { prossimoSasso = tempo + 0.9 + Math.random() * 1.2; sfx('colpo'); renderer && renderer.flash(); if (premuto) v -= 0.05; }
        v = Math.max(0, v);
        if (v >= 1) return fine(true);
      } else if (tipo === 'respiro') {
        const fase = (tempo % 4) / 4, cresce = fase < 0.5;
        v = cresce ? fase * 2 : 2 - fase * 2;
        label.textContent = cresce ? 'INSPIRA — tieni premuto' : 'ESPIRA — lascia';
        campioni++; if (premuto === cresce) punti++;
        if (Math.floor(tempo) !== Math.floor(tempo - dt) && Math.floor(tempo) % 2 === 0) sfx('cuore');
        if (tempo >= 12) return fine(punti / campioni >= 0.6);
      } else if (tipo === 'maschera') {
        v += premuto ? dt * 0.25 : -dt * 0.6; v = Math.max(0, v);
        if (Math.random() < dt * 0.4) { label.textContent = ['Qualcuno urla il tuo nome.', 'Un flash. Ti stanno filmando.', 'Piano.'][Math.floor(Math.random() * 3)]; }
        if (v >= 1) return fine(true);
      }
      fill.style.width = `${Math.min(100, v * 100)}%`;
      if (tempo >= limite) return fine(false);
      requestAnimationFrame(passo);
    };
    requestAnimationFrame(passo);
  });
}
