// Dati di gioco: personaggi, palette, incroci, capitoli.
// I testi visibili stanno in lang/it.js (traducibili); qui solo struttura.

// Ogni palette va dal più scuro al più chiaro. `caldo` è l'indice verso cui
// la rabbia "sporca" il dither.
export const PALETTES = {
  titolo: { colori: ['#000000', '#5a1010', '#c8462a', '#f0e8d8'], caldo: 2 },
  ines:   { colori: ['#0b0b12', '#3fa7d6', '#f2c14e', '#f6f3ea'], caldo: 2 },
  sacha:  { colori: ['#0a0a0a', '#6e1a1a', '#8a8a8a', '#e6e6e6'], caldo: 1 },
  jerome: { colori: ['#140806', '#b3261e', '#f08a24', '#fff3e0'], caldo: 2 },
  odile:  { colori: ['#16161e', '#2f4f8f', '#5f9e6e', '#efe6d0'], caldo: 2 },
  mehdi:  { colori: ['#05070d', '#18306a', '#3a86ff', '#eef4ff'], caldo: 2 },
};

export const PERSONAGGI = ['ines', 'sacha', 'jerome', 'odile', 'mehdi'];

// Le schede (nome, età, ruolo, frase) sono in lang/it.js -> personaggi.<id>
export const CHAT_NOME = { ines: 'Inès', sacha: 'Sacha', jerome: 'Jérôme', odile: 'Odile', mehdi: 'Mehdi' };

export const CAPITOLI = ['alba', 'mattina', 'mezzogiorno', 'pomeriggio', 'scontro', 'sera', 'notte'];

// Incroci: id -> capitolo (indice) e personaggi coinvolti. Titoli in lang/it.js -> incroci.<id>
export const INCROCI = {
  X01: { cap: 0, chi: ['ines', 'sacha'] },
  X02: { cap: 0, chi: ['ines', 'sacha', 'jerome', 'mehdi'] },
  X03: { cap: 0, chi: ['ines', 'sacha', 'jerome'] },
  X04: { cap: 0, chi: ['ines', 'odile', 'mehdi'] },
  X05: { cap: 1, chi: ['ines', 'sacha', 'jerome', 'mehdi'] },
  X06: { cap: 2, chi: ['ines', 'sacha', 'odile'] },
  X07: { cap: 3, chi: ['ines', 'sacha', 'jerome', 'odile', 'mehdi'] },
  X08: { cap: 3, chi: ['ines', 'sacha', 'jerome', 'odile', 'mehdi'] },
  X09: { cap: 4, chi: ['ines', 'sacha', 'jerome', 'odile', 'mehdi'] },
  X10: { cap: 4, chi: ['ines', 'sacha', 'jerome', 'odile', 'mehdi'] },
  X11: { cap: 4, chi: ['ines', 'sacha', 'jerome', 'odile', 'mehdi'] },
  X12: { cap: 5, chi: ['ines', 'sacha', 'odile', 'mehdi'] },
  X13: { cap: 5, chi: ['ines', 'jerome'] },
};
