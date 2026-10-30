// Testi dell'interfaccia in italiano. Per tradurre: copia questo file
// (es. lang/fr.js), traduci i valori e cambia l'import in js/i18n.js.
// La storia vera e propria è nei file ink/*.ink.

export default {
  avviso: {
    titolo: 'Prima di cominciare',
    testo: 'Questo gioco racconta una giornata di proteste e scontri. Contiene violenza della polizia e dei manifestanti, ragazzi minorenni feriti, gas lacrimogeni, linguaggio forte. Luoghi e persone sono inventati; i fatti che lo ispirano no.',
    lampeggi: 'Alcune scene contengono luci lampeggianti. Se sei sensibile, attiva l\'opzione qui sotto (puoi cambiarla in ogni momento).',
    ok: 'Ho capito, entra',
  },
  menu: {
    gioca: '▶ Gioca',
    mappa: '◆ Mappa della giornata',
    corale: '✦ Lunedì 2 novembre',
    opzioni: '⚙ Opzioni',
    crediti: '☰ Crediti',
  },
  ui: {
    indietro: '◀ Indietro',
    avanti: 'Avanti',
    caricamento: 'Caricamento…',
    gia_visto: '◆ già visto da {chi}',
    timeout: '…',
    tieni: 'TIENI PREMUTO',
    corale_bloccato: 'Si sblocca dopo aver vissuto la giornata con tutti e cinque.',
  },
  select: {
    titolo: 'Chi sei, oggi?',
    intro: 'Sabato 17 ottobre 2026. Una sola giornata, un solo scontro, cinque punti di vista. Scegli chi essere.',
    nuovo: 'Inizia',
    continua: 'Continua',
    ricomincia: 'Ricomincia da capo',
    rigioca: 'Rigioca',
    non_iniziato: 'Non ancora vissuto',
    in_corso: 'In corso',
    prossimamente: 'In arrivo',
    finale: 'Finale: {esito}',
  },
  personaggi: {
    ines:   { nome: 'Inès Haddad', eta: '17 anni', ruolo: 'La studentessa', frase: '«On demande pas la lune. On demande un plafond.»' },
    sacha:  { nome: 'Sacha Lemaire', eta: '23 anni', ruolo: 'Il black bloc', frase: '«Se non ci siamo noi davanti, davanti ci sono i ragazzini.»' },
    jerome: { nome: 'Jérôme Ferrand', eta: '34 anni', ruolo: 'Il pompiere', frase: '«Prima la vita, poi i beni, poi il resto.»' },
    odile:  { nome: 'Odile Garnier', eta: '52 anni', ruolo: 'L\'insegnante', frase: '«Oggi non è un giorno qualunque.»' },
    mehdi:  { nome: 'Mehdi Saïdi', eta: '26 anni', ruolo: 'Il poliziotto', frase: '«Non sono mai dove sono.»' },
  },
  capitoli: {
    alba: 'Alba', mattina: 'Mattina', mezzogiorno: 'Mezzogiorno', pomeriggio: 'Pomeriggio',
    scontro: 'Lo scontro', sera: 'Sera', notte: 'Notte',
  },
  incroci: {
    X01: 'La grata', X02: 'Il sasso sul parabrezza', X03: '«On est pas vos ennemis!»',
    X04: 'La prof e la visiera', X05: 'Lo screenshot', X06: 'La maschera nella metro',
    X07: 'Gli applausi', X08: 'Il volantino del 1961', X09: 'Il cassonetto sotto il palazzo',
    X10: 'La granata che rotola', X11: 'La mano tesa', X12: 'Il bancone del commissariato',
    X13: 'Il corridoio di Avicenne',
  },
  map: {
    titolo: 'Mappa della giornata',
    intro: 'Gli incroci sono le scene che più personaggi vivono da lati diversi. Ogni ◆ è un punto di vista che hai già attraversato.',
    ignoto: '???',
  },
  end: {
    PACE: 'PACE',
    VIOLENZA: 'VIOLENZA',
    recap: 'Come ci sei arrivato',
    altri: '◀ Gli altri punti di vista',
  },
  gm: {
    riprendi: '▶ Riprendi',
    ricomincia: '↺ Ricomincia questo personaggio',
    esci: '⌂ Torna al titolo',
    conferma_ricomincia: 'Ricominciare da capo? I progressi di questo personaggio andranno persi.',
  },
  opz: {
    velocita: 'Velocità del testo',
    lenta: 'Lenta', normale: 'Normale', veloce: 'Veloce', istantanea: 'Istantanea',
    crt: 'Effetto CRT (scanline)',
    timer: 'Scelte a tempo nello scontro',
    flash: 'Riduci i lampeggi',
    audio: 'Audio',
    reset: 'Cancella tutti i progressi',
    conferma_reset: 'Cancellare tutti i progressi e i finali ottenuti?',
  },
  mini: {
    getto: 'Tieni il getto sul fuoco. I sassi arrivano lo stesso.',
    respiro: 'Respira con il cerchio: tieni premuto quando si allarga, lascia quando si stringe.',
    maschera: 'Tieni premuto per togliere la maschera. Piano.',
  },
  crediti: [
    '<b>C\'EST LES TÉNÈBRES</b>',
    'Un gioco narrativo su una giornata di proteste a Parigi, 17 ottobre 2026.',
    'Ispirato ai fatti dell\'autunno 2026. Liceo, persone ed episodi sono inventati; strade e piazze sono reali.',
    'Stile visivo ispirato alla serie Pixel Pulps di LCB Game Studio.',
    'Storia scritta in Ink (inkle) ed eseguita con inkjs. Font: VT323 e Press Start 2P (SIL Open Font License).',
    'Illustrazioni: segnaposto procedurali, in attesa delle tavole definitive.',
  ],
};
