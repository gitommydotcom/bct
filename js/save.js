// Salvataggio in localStorage, sempre protetto da try/catch:
// in navigazione privata o con storage bloccato il gioco funziona lo stesso (senza memoria).

const CHIAVE = 'cestlestenebres.v1';

const vuoto = () => ({
  avvisoVisto: false,
  impostazioni: { velocita: 'normale', crt: true, timer: true, flash: false, audio: true },
  personaggi: {},   // id -> { stato, pagina, finito, esito, recap, aggiornato }
  incroci: {},      // id incrocio -> { personaggio: true }
});

let dati = vuoto();

export function carica() {
  try {
    const s = localStorage.getItem(CHIAVE);
    if (s) {
      const d = JSON.parse(s);
      dati = { ...vuoto(), ...d, impostazioni: { ...vuoto().impostazioni, ...(d.impostazioni || {}) } };
    }
  } catch (e) { /* storage non disponibile */ }
  return dati;
}

export function salva() {
  try { localStorage.setItem(CHIAVE, JSON.stringify(dati)); } catch (e) { /* pieno o bloccato */ }
}

export const get = () => dati;

export function personaggio(id) {
  return dati.personaggi[id] || (dati.personaggi[id] = {});
}

export function resetPersonaggio(id) {
  const p = dati.personaggi[id];
  // il finale ottenuto resta (serve per l'epilogo corale), la partita in corso no
  dati.personaggi[id] = p && p.finito ? { finito: true, esito: p.esito, recap: p.recap } : {};
  salva();
}

export function resetTutto() {
  const imp = dati.impostazioni;
  dati = vuoto();
  dati.impostazioni = imp;
  dati.avvisoVisto = true;
  salva();
}

export function segnaIncrocio(id, chi) {
  const x = dati.incroci[id] || (dati.incroci[id] = {});
  const altri = Object.keys(x).filter((k) => k !== chi);
  x[chi] = true;
  salva();
  return altri;
}
