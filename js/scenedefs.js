// Definizione di ogni illustrazione: descrizione (per ART_LIST.md) e segnaposto procedurale.
// L'id corrisponde al file da disegnare: "shared/c5_granata" -> art/shared/c5_granata.png
// Le tavole in shared/ si disegnano UNA volta, in scala di grigi: il gioco le ricolora
// con la palette di chi guarda. Quelle in <personaggio>/ sono viste solo da lui.
//
// strati: [nome, parametri] — vedi js/scenes.js (STRATI). fx: effetti animati sopra l'immagine.

const notte = (a = 8, b = 40) => ['cielo', { a, b }];
const giorno = (a = 120, b = 200) => ['cielo', { a, b }];

export const SCENE = {
  // ---------------- interfaccia ----------------
  titolo: { desc: 'Schermata del titolo: la scritta C\'EST LES TÉNÈBRES sopra una banlieue di notte, un fuoco in basso.', strati: [
    notte(0, 30), ['stelle', { n: 30, lum: 140 }], ['cite', { y: 175, lum: 22, finestre: 0.2, flum: 110, hmin: 40 }],
    ['bagliore', { x: 160, y: 200, r: 150, a: 0.35 }], ['colonna', { x: 250, y: 175, h: 150, r: 34, lum: 55, vento: 50 }],
    ['fuoco', { x: 160, y: 200, w: 180, h: 60 }], ['folla', { y: 206, n: 16, s: 0.9, lum: 0, var: 4, cartelli: 0.25 }],
    ['scritta', { testo: "C'EST LES", y: 36, size: 12, lum: 210 }], ['scritta', { testo: 'TÉNÈBRES', y: 58, size: 24, lum: 255 }],
    ['scritta', { testo: 'SAMEDI 17 OCTOBRE 2026', y: 94, size: 8, lum: 160 }],
  ] },
  ritratto_ines: { desc: 'Ritratto per la selezione: Inès, felpa con cappuccio, capelli raccolti.', strati: [['ritratto', { tipo: 'ines', sfondo: 230 }]] },
  ritratto_sacha: { desc: 'Ritratto: Sacha, cappuccio e passamontagna, solo gli occhi.', strati: [['ritratto', { tipo: 'sacha', sfondo: 160 }]] },
  ritratto_jerome: { desc: 'Ritratto: Jérôme, casco F1 da pompiere, banda riflettente.', strati: [['ritratto', { tipo: 'jerome', sfondo: 220 }]] },
  ritratto_odile: { desc: 'Ritratto: Odile, occhiali, sciarpa, capelli corti.', strati: [['ritratto', { tipo: 'odile', sfondo: 230 }]] },
  ritratto_mehdi: { desc: 'Ritratto: Mehdi, casco antisommossa con la visiera alzata.', strati: [['ritratto', { tipo: 'mehdi', sfondo: 200 }]] },
  finale_PACE: { desc: 'Schermata del finale PACE: l\'alba sulla banlieue, fumo che si dirada.', strati: [
    giorno(90, 230), ['luce', { x: 160, y: 140, r: 160, a: 0.5 }], ['cite', { y: 170, lum: 40, finestre: 0.1, flum: 200 }], ['suolo', { y: 170, a: 50, b: 80 }]] },
  finale_VIOLENZA: { desc: 'Schermata del finale VIOLENZA: notte, un cassonetto bruciato, luci blu.', strati: [
    notte(0, 25), ['haussmann', { top: 50, y: 165, lum: 22, accese: 0.05 }], ['suolo', { y: 165, a: 15, b: 35 }],
    ['cassonetto', { x: 160, y: 175, lum: 20, rovesciato: true }], ['colonna', { x: 160, y: 165, h: 120, r: 25, lum: 60 }]], fx: ['lampeggianti'] },

  // ---------------- capitolo 1: alba (condivise) ----------------
  'shared/c1_grata': { desc: 'Alba, 6:00. La grata del Lycée Ernestine-Dumont, l\'edificio anni \'70 dietro. Una trentina di ragazzi con striscioni arrotolati; due cassonetti spinti sul marciapiede. Cielo ancora blu notte, lampioni accesi.', strati: [
    notte(10, 55), ['cite', { y: 95, lum: 20, finestre: 0.15, flum: 120, hmin: 20, hvar: 30 }], ['grata', { y: 168, h: 62, muro: 55, finestre: 35 }],
    ['suolo', { y: 168, a: 25, b: 50 }], ['lampione', { x: 18, y: 175, h: 110 }], ['cassonetto', { x: 52, y: 182, lum: 40 }], ['cassonetto', { x: 284, y: 184, lum: 40 }],
    ['folla', { y: 192, n: 13, s: 0.75, lum: 8, x0: 80, x1: 250, cartelli: 0.1 }]] },
  'shared/c1_fuoco': { desc: '6:20. Un cassonetto in fiamme davanti alla grata. Il fumo sale verso le finestre del palazzo di fronte. Silhouette di ragazzi con i telefoni alzati, controluce.', strati: [
    notte(8, 45), ['grata', { y: 168, h: 62, muro: 45, finestre: 30, insegna: 'LYCÉE ERNESTINE-DUMONT' }], ['suolo', { y: 168, a: 25, b: 45 }],
    ['cassonetto', { x: 160, y: 180, lum: 30 }], ['colonna', { x: 160, y: 150, h: 160, r: 35, lum: 90, vento: 40 }], ['bagliore', { x: 160, y: 160, r: 120, a: 0.45 }],
    ['fuoco', { x: 160, y: 156, w: 44, h: 46 }], ['folla', { y: 200, n: 9, s: 1.2, lum: 0, var: 6, braccia: 0.6, cartelli: 0 }]] },
  'shared/c1_camion': { desc: '6:45. Il camion dei pompieri SDIS 77 si ferma a venti metri dalla grata. Due pompieri scendono, uno con il casco in mano. Il fumo del cassonetto a destra.', strati: [
    ['cielo', { a: 25, b: 85 }], ['cite', { y: 160, lum: 30, finestre: 0.15, flum: 150 }], ['suolo', { y: 160, a: 35, b: 60 }],
    ['camion', { x: 20, y: 178, s: 1, lum: 70, lampeggiante: 230 }], ['figura', { x: 210, y: 182, h: 70, lum: 15, tipo: 'pompiere' }], ['figura', { x: 238, y: 180, h: 64, lum: 18, tipo: 'pompiere' }],
    ['colonna', { x: 290, y: 160, h: 150, r: 30, lum: 100, vento: -20 }], ['scritta', { testo: 'SDIS 77', x: 80, y: 135, size: 8, lum: 230 }]] },
  'shared/c1_pompiere': { desc: 'Primo piano del pompiere più anziano (Jérôme): casco con un graffio bianco nuovo, sguardo stanco. Dietro, sfocato, il camion col parabrezza stellato.', strati: [
    ['cielo', { a: 30, b: 90 }], ['camion', { x: -40, y: 170, s: 1.2, lum: 60, crepa: true }], ['vignetta', { a: 0.5 }],
    ['figura', { x: 200, y: 230, h: 190, lum: 12, tipo: 'pompiere', dettaglio: 200 }], ['scritta', { testo: '/', x: 186, y: 52, size: 12, lum: 255, font: 'VT323' }]] },
  'shared/c1_sgombero': { desc: '7:10. Tre furgoni della polizia, luci blu che girano sui muri. Il cordone avanza verso i ragazzi seduti davanti alla grata. Il commissario con la fascia tricolore e il megafono.', strati: [
    ['cielo', { a: 30, b: 80 }], ['grata', { y: 160, h: 55, muro: 50, insegna: false }], ['suolo', { y: 160, a: 30, b: 55 }],
    ['furgone', { x: 200, y: 172, lum: 35 }], ['cordone', { y: 192, n: 5, x0: 150, x1: 320, s: 1.1 }], ['folla', { y: 200, n: 8, s: 0.6, lum: 5, x0: 0, x1: 150, cartelli: 0.2 }]], fx: ['lampeggianti'] },
  'shared/c1_prof_visiera': { desc: '7:35. La prof Garnier, sciarpa verde, davanti a un agente con il casco abbassato. Lei lo guarda dritto: «Mehdi?». Lui non risponde. Inquadratura di tre quarti, i due volti vicini.', strati: [
    ['cielo', { a: 40, b: 100 }], ['grata', { y: 150, h: 50, muro: 60, insegna: false }], ['vignetta', { a: 0.4 }],
    ['figura', { x: 105, y: 230, h: 175, lum: 20, tipo: 'prof', dir: 1 }], ['figura', { x: 225, y: 235, h: 185, lum: 10, tipo: 'casco', dir: -1, dettaglio: 160, scudo: false }]] },
  'shared/c1_grata_vuota': { desc: '7:45. La grata libera, il cassonetto annerito rovesciato, striscioni calpestati sull\'asfalto bagnato. Luce grigia del mattino.', strati: [
    ['cielo', { a: 90, b: 160 }], ['grata', { y: 165, h: 62, muro: 90, finestre: 60, lum: 30 }], ['suolo', { y: 165, a: 60, b: 100 }],
    ['cassonetto', { x: 120, y: 185, lum: 20, rovesciato: true }], ['pieno', { x: 170, y: 182, w: 70, h: 8, lum: 200 }], ['pieno', { x: 60, y: 190, w: 40, h: 5, lum: 180 }]] },

  // ---------------- capitolo 3: mezzogiorno ----------------
  'shared/c3_assemblea': { desc: 'Mezzogiorno. Il cortiletto dietro la palestra (tetto puntellato con travi). Duecento ragazzi, cartelli, una cassa bluetooth. Sacha in piedi sul muretto parla, braccio alzato.', strati: [
    giorno(140, 210), ['pieno', { x: 0, y: 40, w: 320, h: 110, lum: 110 }], ['sbarre', { x0: 30, x1: 300, y: 30, h: 30, passo: 40, spessore: 3, lum: 60 }],
    ['pieno', { x: 0, y: 140, w: 320, h: 60, lum: 140 }], ['pieno', { x: 100, y: 128, w: 120, h: 12, lum: 80 }], ['figura', { x: 160, y: 128, h: 70, lum: 10, tipo: 'cappuccio', braccio: 'alto' }],
    ['folla', { y: 205, n: 22, s: 1, lum: 15, cartelli: 0.3, braccia: 0.15 }]] },
  'shared/c3_metro': { desc: '13:10. Linea 5, un vagone pieno di liceali con i cartelli. In fondo, Sacha passa un passamontagna a Nassim. Luci della galleria che scorrono nei finestrini.', strati: [
    ['metro', { lum: 80 }], ['folla', { y: 210, n: 8, s: 1.8, lum: 15, cartelli: 0.35, var: 20 }]] },

  // ---------------- capitolo 4: pomeriggio ----------------
  'shared/c4_republique': { desc: '14:20. Place de la République: la statua della Marianne coperta di ragazzi, una folla enorme di gilet gialli, sindacati, infermiere, nonni. Bandiere e cartelli.', strati: [
    giorno(150, 220), ['haussmann', { top: 70, y: 160, lum: 110, accese: 0 }], ['pieno', { x: 150, y: 40, w: 20, h: 120, lum: 60 }], ['figura', { x: 160, y: 42, h: 34, lum: 60 }],
    ['folla', { y: 120, n: 6, s: 0.4, lum: 30, x0: 140, x1: 180 }], ['suolo', { y: 160, a: 120, b: 150 }],
    ['folla', { y: 210, n: 30, s: 0.95, lum: 20, cartelli: 0.35, var: 30 }], ['striscione', { x: 40, y: 140, w: 120, h: 18, testo: 'PROFS AVEC VOUS', size: 7 }]] },
  'shared/c4_applausi': { desc: '15:20. Boulevard Voltaire. I pompieri in sciopero sfilano in divisa con i bracciali POMPIERS EN GRÈVE; i liceali intorno applaudono a braccia alzate.', strati: [
    giorno(140, 210), ['haussmann', { top: 30, y: 165, lum: 100, x0: 0, x1: 120 }], ['haussmann', { top: 40, y: 165, lum: 90, x0: 200, x1: 320 }], ['suolo', { y: 165, a: 110, b: 150, linee: true, lineeLum: 130 }],
    ['folla', { y: 195, n: 18, s: 0.9, lum: 30, braccia: 0.7, cartelli: 0.1, var: 20 }],
    ['figura', { x: 120, y: 205, h: 95, lum: 10, tipo: 'pompiere' }], ['figura', { x: 170, y: 208, h: 100, lum: 10, tipo: 'pompiere', braccio: 'alto' }], ['figura', { x: 220, y: 204, h: 92, lum: 10, tipo: 'pompiere' }],
    ['striscione', { x: 95, y: 92, w: 150, h: 18, testo: 'POMPIERS EN GRÈVE', size: 7 }]] },
  'shared/c4_volantino': { desc: '15:40. Una mano tende un volantino fotocopiato: «17 OCTOBRE 1961 — 17 OCTOBRE 2026». Dietro, sfocato, il cordone di polizia ai lati del corteo.', strati: [
    giorno(100, 170), ['cordone', { y: 160, n: 8, s: 0.8, lum: 40 }], ['vignetta', { a: 0.5 }],
    ['pieno', { x: 95, y: 30, w: 130, h: 90, lum: 235 }], ['scritta', { testo: '17 OCTOBRE 1961', y: 45, size: 8, lum: 20 }], ['scritta', { testo: '—', y: 62, size: 8, lum: 20 }], ['scritta', { testo: '17 OCTOBRE 2026', y: 80, size: 8, lum: 20 }],
    ['scritta', { testo: 'ni oubli ni pardon', y: 100, size: 12, lum: 60, font: 'VT323' }], ['mano', { x: 160, y: 205, s: 1.3, lum: 25 }]] },
  'shared/c4_testa': { desc: '16:50. La testa del corteo: k-way neri, ombrelli aperti senza pioggia, cappucci. Tra loro, piccolo, il cappuccio di Nassim che si allontana.', strati: [
    ['cielo', { a: 90, b: 150 }], ['haussmann', { top: 40, y: 165, lum: 70 }], ['suolo', { y: 165, a: 80, b: 110 }],
    ['folla', { y: 200, n: 16, s: 1.15, lum: 5, var: 6, tipi: ['maschera', 'cappuccio', 'maschera'], cartelli: 0 }]], fx: ['fumo'] },

  // ---------------- capitolo 5: lo scontro ----------------
  'shared/c5_nation': { desc: '17:20. Place de la Nation dall\'alto del boulevard: la colonna con le statue di bronzo, la folla che arriva, sul lato del cours de Vincennes un muro di scudi.', strati: [
    ['cielo', { a: 60, b: 130 }], ['haussmann', { top: 70, y: 150, lum: 60, x0: 0, x1: 110 }], ['haussmann', { top: 80, y: 150, lum: 55, x0: 210, x1: 320 }],
    ['colonna_nation', { x: 160, lum: 25 }], ['suolo', { y: 150, a: 70, b: 100 }], ['cordone', { y: 175, n: 9, x0: 200, x1: 320, s: 0.6 }], ['folla', { y: 205, n: 26, s: 0.8, lum: 15, x0: -10, x1: 210, cartelli: 0.3 }]] },
  'shared/c5_gas': { desc: '17:26. Il gas lacrimogeno basso e bianco. Silhouette che tossiscono, piegate, si tengono per le felpe. Un candelotto fuma per terra.', strati: [
    ['cielo', { a: 70, b: 120 }], ['haussmann', { top: 50, y: 160, lum: 50 }], ['suolo', { y: 160, a: 80, b: 110 }],
    ['folla', { y: 200, n: 12, s: 1.2, lum: 10, var: 8 }], ['granata', { x: 200, y: 190 }]], fx: ['gas'] },
  'shared/c5_cassonetto': { desc: '17:37. L\'angolo del cours de Vincennes: un palazzo haussmanniano, farmacia al piano terra con la croce accesa, un cassonetto in fiamme sotto. Al primo piano, alla finestra, una signora anziana in vestaglia (Mme Ferrero). Il fumo sale verso di lei.', strati: [
    ['cielo', { a: 40, b: 100 }], ['facciata', { x: 160, w: 160, lum: 55, riga: 3, col: 1 }], ['suolo', { y: 170, a: 40, b: 70 }],
    ['cassonetto', { x: 232, y: 188, lum: 25 }], ['bagliore', { x: 232, y: 165, r: 120, a: 0.45 }], ['colonna', { x: 232, y: 160, h: 150, r: 28, lum: 100, vento: -15 }],
    ['fuoco', { x: 232, y: 164, w: 46, h: 50 }], ['folla', { y: 205, n: 9, s: 1.1, lum: 0, var: 6, x0: -10, x1: 170 }]] },
  'shared/c5_carica': { desc: '17:39. La carica: gli scudi in primo piano che avanzano, la folla che si rovescia all\'indietro. Un cartello a terra calpestato.', strati: [
    ['cielo', { a: 70, b: 120 }], ['folla', { y: 150, n: 18, s: 0.7, lum: 40, braccia: 0.4 }], ['suolo', { y: 150, a: 60, b: 100 }],
    ['pieno', { x: 30, y: 180, w: 50, h: 10, lum: 220 }], ['cordone', { y: 230, n: 5, s: 2.2, lum: 10, visiera: 190 }]], fx: ['gas'] },
  'shared/c5_granata': { desc: '17:42. Inquadratura bassa, ad altezza di scarpa: una granata che rotola tra le scarpe e fuma. Sullo sfondo, accanto al cassonetto in fiamme, un ragazzo a terra (Nassim).', strati: [
    ['cielo', { a: 50, b: 90 }], ['suolo', { y: 110, a: 60, b: 110 }], ['cassonetto', { x: 270, y: 130, s: 0.7, lum: 20 }], ['fuoco', { x: 270, y: 113, w: 26, h: 26 }],
    ['figura', { x: 210, y: 140, h: 60, lum: 10, tipo: 'a_terra' }], ['granata', { x: 140, y: 175 }],
    ['pieno', { x: 10, y: 160, w: 40, h: 24, lum: 15 }], ['pieno', { x: 60, y: 168, w: 34, h: 18, lum: 12 }], ['pieno', { x: 250, y: 172, w: 50, h: 22, lum: 10 }]], fx: ['gas'] },
  'shared/c5_mano': { desc: '17:44. LA MANO TESA. Un agente (Mehdi) trascina Nassim per il cappuccio lontano dal fuoco; in primo piano una mano tesa verso di lui, nel fumo. Sullo sfondo un pompiere in divisa si fa largo.', strati: [
    ['cielo', { a: 60, b: 100 }], ['cassonetto', { x: 60, y: 160, s: 0.9, lum: 20 }], ['fuoco', { x: 60, y: 138, w: 34, h: 36 }],
    ['figura', { x: 280, y: 170, h: 80, lum: 20, tipo: 'pompiere', braccio: 'alto' }], ['figura', { x: 200, y: 190, h: 130, lum: 10, tipo: 'casco', dir: -1, scudo: false, braccio: 'avanti' }],
    ['figura', { x: 160, y: 195, h: 80, lum: 15, tipo: 'a_terra', dir: -1 }], ['mano', { x: 70, y: 210, s: 1.2, lum: 0, dir: 1 }]], fx: ['fumo'] },
  'shared/c5_vuota': { desc: '17:52. La piazza che si svuota. Scarpe spaiate, cartelli a terra, un volantino del 1961 calpestato. Il cassonetto nero fuma ancora sotto la finestra del primo piano.', strati: [
    ['cielo', { a: 50, b: 100 }], ['facciata', { x: 190, w: 130, lum: 45, riga: 3, col: 0, persona: false }], ['suolo', { y: 168, a: 50, b: 85 }],
    ['cassonetto', { x: 250, y: 185, lum: 15, rovesciato: true }], ['colonna', { x: 250, y: 175, h: 120, r: 18, lum: 70 }],
    ['pieno', { x: 40, y: 180, w: 30, h: 7, lum: 210 }], ['pieno', { x: 110, y: 188, w: 20, h: 12, lum: 220 }], ['pieno', { x: 150, y: 176, w: 10, h: 5, lum: 20 }]] },

  // ---------------- capitolo 6-7: sera e notte (condivise) ----------------
  'shared/c6_avicenne': { desc: 'Sera. Il corridoio dell\'ospedale Avicenne a Bobigny: sedie arancioni, una macchinetta, neon. In fondo, seduto, un pompiere con la divisa sporca di fumo.', strati: [
    ['corridoio', { lum: 110 }], ['sedie', { x: 20, y: 160, n: 3, lum: 160 }], ['pieno', { x: 270, y: 80, w: 34, h: 90, lum: 60 }], ['pieno', { x: 276, y: 90, w: 22, h: 30, lum: 200 }],
    ['figura', { x: 160, y: 128, h: 44, lum: 20, tipo: 'pompiere' }]] },
  'shared/c6_commissariato': { desc: 'Sera. Commissariato di Bobigny: una panca di metallo, un neon che ronza, il bancone in fondo con un agente. Pareti verde ospedale.', strati: [
    ['stanza', { lum: 90, pav: 50, y: 150 }], ['luce', { x: 160, y: 0, r: 140, a: 0.4 }], ['pieno', { x: 180, y: 100, w: 140, h: 50, lum: 60 }],
    ['figura', { x: 250, y: 102, h: 40, lum: 20, tipo: 'casco', scudo: false }], ['pieno', { x: 20, y: 150, w: 120, h: 8, lum: 140 }], ['figura', { x: 70, y: 152, h: 60, lum: 15, tipo: 'ragazza' }]] },
  'shared/c7_grata_scritta': { desc: 'Il giorno dopo. La grata del Dumont ancora nera di fumo; sopra, a spray bianco, a lettere enormi: ON EST PAS VOS ENNEMIS.', strati: [
    ['cielo', { a: 120, b: 190 }], ['grata', { y: 170, h: 80, muro: 100, finestre: 70, lum: 25 }], ['suolo', { y: 170, a: 90, b: 130 }],
    ['scritta', { testo: 'ON EST PAS', y: 110, size: 14, lum: 255 }], ['scritta', { testo: 'VOS ENNEMIS', y: 132, size: 14, lum: 255 }]] },
  'shared/c7_cartello': { desc: 'Il giorno dopo. Un\'edicola: in prima pagina una foto di Nation con il fumo e, in basso, il cartello di Inès calpestato. Titolo: «La jeunesse en colère».', strati: [
    ['cielo', { a: 120, b: 180 }], ['pieno', { x: 60, y: 20, w: 200, h: 180, lum: 60 }], ['giornale', { x: 92, y: 28, w: 136, h: 165, titolo: 'La jeunesse en colère' }]] },

  // ---------------- INÈS ----------------
  'ines/01_cucina': { desc: 'Inès, 5:40. La cucina di casa, buia, una sola luce sopra il tavolo. Una tazza, un post-it giallo. Dalla finestra le torri della cité con qualche finestra accesa.', strati: [
    ['stanza', { lum: 45, pav: 30, y: 150 }], ['finestra', { x: 190, y: 30, w: 90, h: 80, lum: 20 }], ['cite', { x0: 190, x1: 280, y: 110, lum: 40, finestre: 0.3, flum: 160, hmin: 25, hvar: 30 }],
    ['luce', { x: 110, y: 40, r: 110, a: 0.5 }], ['tavolo', { x: 50, y: 140, w: 130, tazza: true }], ['pieno', { x: 80, y: 136, w: 10, h: 4, lum: 240 }], ['frigo', { x: 6, y: 50 }]] },
  'ines/02_telefono': { desc: 'Inès: il telefono in mano al buio, lo schermo acceso illumina le dita. (Usata per le schermate di chat.)', strati: [
    ['pieno', { lum: 10 }], ['telefono', { x: 160, y: 100, s: 1.1 }], ['vignetta', { a: 0.6 }]] },
  'ines/03_sasso': { desc: 'Inès, 6:48. In primo piano di spalle un ragazzo col cappuccio (Nassim) con il braccio alzato; il parabrezza del camion che si stella. Il momento prima e dopo, insieme.', strati: [
    ['cielo', { a: 30, b: 80 }], ['camion', { x: -110, y: 175, s: 1.7, lum: 70, crepa: true }], ['vignetta', { a: 0.4 }],
    ['figura', { x: 250, y: 240, h: 200, lum: 5, tipo: 'cappuccio', braccio: 'alto', dir: -1 }]] },
  'ines/04_camera': { desc: 'Inès, 9:10. Il soggiorno di giorno: Nassim addormentato sul divano con le scarpe ai piedi. Luce grigia dalla finestra.', strati: [
    ['stanza', { lum: 120, pav: 80, y: 150 }], ['finestra', { x: 30, y: 20, w: 80, h: 90, lum: 210 }], ['pieno', { x: 120, y: 120, w: 170, h: 40, lum: 70 }], ['pieno', { x: 120, y: 100, w: 170, h: 22, lum: 60 }],
    ['figura', { x: 200, y: 128, h: 110, lum: 25, tipo: 'a_terra' }]] },
  'ines/05_cucina_giorno': { desc: 'Inès, 10:30. La stessa cucina di giorno, il telefono sul tavolo che vibra: «Maman».', strati: [
    ['stanza', { lum: 150, pav: 100, y: 150 }], ['finestra', { x: 190, y: 30, w: 90, h: 80, lum: 230 }], ['tavolo', { x: 50, y: 140, w: 130, tazza: true }],
    ['pieno', { x: 100, y: 132, w: 26, h: 8, lum: 30 }], ['frigo', { x: 6, y: 50, lum: 190 }], ['scritta', { testo: 'MAMAN', x: 113, y: 120, size: 6, lum: 40 }]] },
  'ines/06_cartello': { desc: 'Inès. Il cartello scritto a mano sul cartone di una pizza: BISMILLAH C\'EST LES TÉNÈBRES (ET LE PLAFOND AUSSI). Un pennarello, le mani sporche d\'inchiostro.', strati: [
    ['pieno', { lum: 70 }], ['pieno', { x: 40, y: 30, w: 240, h: 140, lum: 200 }], ['pieno', { x: 50, y: 40, w: 220, h: 120, lum: 215 }],
    ['scritta', { testo: 'BISMILLAH', y: 55, size: 30, lum: 15, font: 'VT323' }], ['scritta', { testo: "C'EST LES TÉNÈBRES", y: 88, size: 22, lum: 15, font: 'VT323' }],
    ['scritta', { testo: '(et le plafond aussi)', y: 122, size: 16, lum: 40, font: 'VT323' }], ['mano', { x: 270, y: 215, s: 0.9, lum: 30 }]] },
  'ines/07_microfono': { desc: 'Inès, 15:35. Una giornalista radio tende il microfono verso Inès (soggettiva). Dietro il corteo sul boulevard Voltaire.', strati: [
    giorno(130, 200), ['haussmann', { top: 30, y: 160, lum: 110 }], ['folla', { y: 190, n: 14, s: 0.8, lum: 50, cartelli: 0.3 }], ['vignetta', { a: 0.3 }],
    ['figura', { x: 240, y: 240, h: 200, lum: 15, tipo: 'ragazza', braccio: 'avanti', dir: -1 }], ['pieno', { x: 150, y: 120, w: 14, h: 22, lum: 30 }], ['pieno', { x: 147, y: 112, w: 20, h: 12, lum: 60 }]] },
  'ines/08_mamma': { desc: 'Inès, 22:30. La mamma in camice da aiuto-infermiera che arriva di corsa in fondo al corridoio di Avicenne.', strati: [
    ['corridoio', { lum: 100 }], ['figura', { x: 160, y: 190, h: 150, lum: 210, tipo: 'adulto', dettaglio: 255 }], ['vignetta', { a: 0.4 }]] },
  'ines/09_camera_notte': { desc: 'Inès, 2:40. La cameretta al buio: Nassim dorme con il gesso sul cuscino; il telefono di Inès acceso sul letto accanto.', strati: [
    ['stanza', { lum: 25, pav: 15, y: 150 }], ['finestra', { x: 200, y: 20, w: 80, h: 70, lum: 15 }], ['cite', { x0: 200, x1: 280, y: 90, lum: 35, finestre: 0.2, flum: 120, hmin: 20, hvar: 20 }],
    ['letto', { x: 20, y: 160, persona: true, lum: 60 }], ['pieno', { x: 44, y: 132, w: 14, h: 8, lum: 230 }], ['luce', { x: 260, y: 150, r: 50, a: 0.4 }], ['pieno', { x: 250, y: 146, w: 18, h: 10, lum: 230 }]] },
  'ines/10_telefono_commissariato': { desc: 'Inès, 23:00. Il telefono a muro del commissariato, la cornetta in mano, un agente che guarda l\'orologio.', strati: [
    ['stanza', { lum: 80, pav: 45, y: 160 }], ['luce', { x: 100, y: 0, r: 120, a: 0.35 }], ['pieno', { x: 110, y: 60, w: 40, h: 60, lum: 30 }], ['pieno', { x: 118, y: 70, w: 24, h: 36, lum: 160 }],
    ['figura', { x: 170, y: 200, h: 140, lum: 15, tipo: 'ragazza', braccio: 'alto', dir: -1 }], ['figura', { x: 280, y: 190, h: 120, lum: 25, tipo: 'adulto' }]] },
  'ines/11_cella': { desc: 'Inès, 3:10. La cella di garde à vue: piastrelle, una panca, una luce al neon dietro una grata, le sbarre in primo piano.', strati: [
    ['stanza', { lum: 50, pav: 30, y: 150 }], ['luce', { x: 160, y: 10, r: 90, a: 0.4 }], ['pieno', { x: 60, y: 140, w: 200, h: 10, lum: 80 }],
    ['figura', { x: 160, y: 150, h: 60, lum: 10, tipo: 'ragazza' }], ['sbarre', { x0: 4, x1: 320, passo: 30, spessore: 6, lum: 5 }]] },
  // ---------------- SACHA ----------------
  'sacha/01_magazzino': { desc: 'Sacha, 4:50. Il parcheggio del magazzino di Aulnay sotto i lampioni al sodio: operai in gilet catarifrangente che escono dal turno di notte. Sacha di spalle si toglie il gilet.', strati: [
    notte(5, 35), ['pieno', { x: 0, y: 40, w: 320, h: 110, lum: 50 }], ['pieno', { x: 120, y: 90, w: 80, h: 60, lum: 160 }], ['scritta', { testo: 'QUAI 14', x: 160, y: 50, size: 8, lum: 200 }],
    ['suolo', { y: 150, a: 30, b: 55 }], ['lampione', { x: 40, y: 175, h: 120, r: 60 }], ['lampione', { x: 280, y: 175, h: 120, r: 60 }],
    ['folla', { y: 185, n: 10, s: 0.6, lum: 20, x0: 60, x1: 260, cartelli: 0 }], ['figura', { x: 160, y: 215, h: 150, lum: 5, tipo: 'cappuccio' }]] },
  'sacha/02_telefono': { desc: 'Sacha: il telefono in una mano guantata nera, lo schermo della chat Signal. (Usata per le schermate di chat.)', strati: [
    ['pieno', { lum: 8 }], ['telefono', { x: 160, y: 100, s: 1.1, mano: 5 }], ['vignetta', { a: 0.7 }]] },
  'sacha/03_appartamento': { desc: 'Sacha, 9:30. L\'appartamento di Lou a Pantin: ombrelli neri contro il muro, una scatola di occhialini da piscina, tazze di caffè solubile, tre ragazzi sui telefoni.', strati: [
    ['stanza', { lum: 70, pav: 40, y: 150 }], ['finestra', { x: 220, y: 25, w: 70, h: 75, lum: 160 }], ['tavolo', { x: 60, y: 140, w: 150, tazza: true }],
    ['pieno', { x: 20, y: 70, w: 4, h: 80, lum: 10 }], ['pieno', { x: 30, y: 74, w: 4, h: 76, lum: 10 }], ['pieno', { x: 40, y: 72, w: 4, h: 78, lum: 10 }],
    ['figura', { x: 120, y: 200, h: 100, lum: 15, tipo: 'cappuccio' }], ['figura', { x: 190, y: 205, h: 95, lum: 18, tipo: 'ragazza' }], ['luce', { x: 150, y: 130, r: 30, a: 0.5 }]] },
  'sacha/04_furgone': { desc: 'Sacha, ricordo: a 17 anni, la guancia schiacciata sul pavimento di gomma di un furgone di polizia, un ginocchio sulla schiena, gli stivali in primo piano.', contrasto: 1.3, strati: [
    ['pieno', { lum: 20 }], ['pieno', { x: 0, y: 130, w: 320, h: 70, lum: 45 }], ['sbarre', { x0: 0, x1: 320, y: 130, h: 70, passo: 12, spessore: 2, lum: 30 }],
    ['figura', { x: 160, y: 150, h: 160, lum: 5, tipo: 'a_terra' }], ['pieno', { x: 230, y: 40, w: 40, h: 110, lum: 10 }], ['pieno', { x: 220, y: 140, w: 60, h: 14, lum: 8 }], ['vignetta', { a: 0.8 }]] },
  'sacha/05_vetrina': { desc: 'Sacha, 15:55. La vetrina di una banca all\'angolo con la rue de la Roquette che riflette la testa del corteo vestita di nero; un ragazzino con un pezzo di pavé in mano.', strati: [
    ['pieno', { lum: 90 }], ['pieno', { x: 20, y: 20, w: 280, h: 150, lum: 140 }], ['scritta', { testo: 'BANQUE', y: 30, size: 10, lum: 40 }],
    ['folla', { y: 170, n: 10, s: 1, lum: 70, tipi: ['maschera', 'cappuccio'], cartelli: 0 }], ['figura', { x: 240, y: 215, h: 150, lum: 5, tipo: 'cappuccio', braccio: 'alto' }]] },
  'sacha/06_volantino_terra': { desc: 'Sacha, 16:30. Il volantino del 1961 per terra, calpestato da un\'impronta di scarpa, sull\'asfalto del boulevard. Una mano guantata lo raccoglie.', strati: [
    ['pieno', { lum: 60 }], ['pieno', { x: 70, y: 40, w: 180, h: 110, lum: 220 }], ['scritta', { testo: '17 OCTOBRE 1961', y: 60, size: 8, lum: 30 }], ['scritta', { testo: '17 OCTOBRE 2026', y: 92, size: 8, lum: 30 }],
    ['scritta', { testo: 'ni oubli, ni pardon', y: 118, size: 14, lum: 80, font: 'VT323' }], ['pieno', { x: 130, y: 60, w: 50, h: 80, lum: 120 }], ['mano', { x: 260, y: 210, s: 1, lum: 5 }]] },
  'sacha/07_cella': { desc: 'Sacha, notte. La cella del commissariato del 12°: panca di metallo, Sacha seduto a viso scoperto, la luce del corridoio che entra dalla grata della porta.', strati: [
    ['stanza', { lum: 35, pav: 20, y: 150 }], ['luce', { x: 260, y: 60, r: 80, a: 0.4 }], ['pieno', { x: 240, y: 40, w: 40, h: 40, lum: 150 }], ['sbarre', { x0: 240, x1: 280, y: 40, h: 40, passo: 8, spessore: 2, lum: 20 }],
    ['pieno', { x: 30, y: 140, w: 160, h: 10, lum: 70 }], ['figura', { x: 100, y: 145, h: 70, lum: 10, tipo: 'adulto' }]] },
  'sacha/08_palestra': { desc: 'Sacha, il giorno dopo. La palestra di boxe del quartiere: il ring, i sacchi appesi, Nassim seduto sulle corde con il gesso al polso che tende un paio di guantoni.', strati: [
    ['stanza', { lum: 90, pav: 60, y: 150 }], ['finestra', { x: 20, y: 20, w: 120, h: 50, lum: 210, croce: false }], ['pieno', { x: 60, y: 120, w: 220, h: 6, lum: 200 }], ['pieno', { x: 60, y: 104, w: 220, h: 3, lum: 200 }],
    ['pieno', { x: 290, y: 0, w: 4, h: 60, lum: 30 }], ['pieno', { x: 280, y: 60, w: 24, h: 50, lum: 30 }], ['figura', { x: 170, y: 160, h: 90, lum: 15, tipo: 'cappuccio', braccio: 'avanti' }], ['pieno', { x: 196, y: 108, w: 14, h: 10, lum: 230 }]] },
  'sacha/09_portone': { desc: 'Sacha, 19:30. Rue des Pyrénées: un portone socchiuso, Sacha nell\'androne che si toglie il k-way nero; fuori, le sirene che passano.', strati: [
    ['pieno', { lum: 25 }], ['pieno', { x: 200, y: 0, w: 120, h: 200, lum: 70 }], ['luce', { x: 260, y: 80, r: 90, a: 0.3 }], ['pieno', { x: 190, y: 0, w: 14, h: 200, lum: 10 }],
    ['figura', { x: 110, y: 210, h: 170, lum: 5, tipo: 'cappuccio', braccio: 'alto' }]], fx: ['lampeggianti'] },
  'sacha/10_kebab': { desc: 'Sacha, 21:10. Un kebab di Ménilmontant: il televisore sopra il frigo delle bibite che trasmette in loop il video di Nation; Sacha di spalle al bancone.', strati: [
    ['stanza', { lum: 120, pav: 70, y: 150 }], ['pieno', { x: 180, y: 70, w: 120, h: 80, lum: 200 }], ['pieno', { x: 190, y: 20, w: 100, h: 60, lum: 15 }], ['pieno', { x: 196, y: 26, w: 88, h: 48, lum: 120 }],
    ['colonna', { x: 230, y: 70, h: 40, r: 8, lum: 200 }], ['pieno', { x: 0, y: 140, w: 170, h: 30, lum: 60 }], ['figura', { x: 90, y: 230, h: 180, lum: 10, tipo: 'cappuccio' }]] },
  'sacha/11_canale': { desc: 'Sacha, il giorno dopo all\'alba. Il canale dell\'Ourcq, acqua grigia, i magazzini sull\'altra riva; un passamontagna nero che galleggia.', strati: [
    ['cielo', { a: 90, b: 170 }], ['cite', { y: 110, lum: 60, finestre: 0.05, flum: 200, hmin: 20, hvar: 30 }], ['pieno', { x: 0, y: 110, w: 320, h: 90, lum: 100 }],
    ['luce', { x: 200, y: 110, r: 120, a: 0.25 }], ['pieno', { x: 150, y: 150, w: 26, h: 8, lum: 5 }], ['pieno', { x: 0, y: 180, w: 320, h: 20, lum: 50 }]] },
};
