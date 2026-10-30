# Lista delle illustrazioni

Generata da `npm run artlist` (non modificare a mano: le descrizioni stanno in `js/scenedefs.js`).

**Formato:** 320×200 pixel (o più grande, ma con proporzioni 16:10), **in scala di grigi**.
Il gioco converte la luminosità nei 4 colori del personaggio con un dither ordinato:
nero → colore 1, grigio scuro → colore 2, grigio chiaro → colore 3, bianco → colore 4.
Usa `tools/convertitore.html` per preparare disegni e foto e vedere subito l'anteprima nelle cinque palette.
Per provare una tavola basta salvarla nel percorso indicato e ricaricare il gioco.

**Avanzamento:** 0/90 tavole disegnate.

## Interfaccia (titolo, ritratti, finali)

| File | Inquadratura | Usata da | Stato |
|---|---|---|---|
| `art/ui/titolo.png` | Schermata del titolo: la scritta C'EST LES TÉNÈBRES sopra una banlieue di notte, un fuoco in basso. | corale | ◻ segnaposto |
| `art/ui/ritratto_ines.png` | Ritratto per la selezione: Inès, felpa con cappuccio, capelli raccolti. | interfaccia | ◻ segnaposto |
| `art/ui/ritratto_sacha.png` | Ritratto: Sacha, cappuccio e passamontagna, solo gli occhi. | interfaccia | ◻ segnaposto |
| `art/ui/ritratto_jerome.png` | Ritratto: Jérôme, casco F1 da pompiere, banda riflettente. | interfaccia | ◻ segnaposto |
| `art/ui/ritratto_odile.png` | Ritratto: Odile, occhiali, sciarpa, capelli corti. | interfaccia | ◻ segnaposto |
| `art/ui/ritratto_mehdi.png` | Ritratto: Mehdi, casco antisommossa con la visiera alzata. | interfaccia | ◻ segnaposto |
| `art/ui/finale_PACE.png` | Schermata del finale PACE: l'alba sulla banlieue, fumo che si dirada. | interfaccia | ◻ segnaposto |
| `art/ui/finale_VIOLENZA.png` | Schermata del finale VIOLENZA: notte, un cassonetto bruciato, luci blu. | interfaccia | ◻ segnaposto |

## Scene condivise — si disegnano UNA volta, il gioco le ricolora per ogni personaggio

| File | Inquadratura | Usata da | Stato |
|---|---|---|---|
| `art/shared/c1_grata.png` | Alba, 6:00. La grata del Lycée Ernestine-Dumont, l'edificio anni '70 dietro. Una trentina di ragazzi con striscioni arrotolati; due cassonetti spinti sul marciapiede. Cielo ancora blu notte, lampioni accesi. | ines, sacha | ◻ segnaposto |
| `art/shared/c1_fuoco.png` | 6:20. Un cassonetto in fiamme davanti alla grata. Il fumo sale verso le finestre del palazzo di fronte. Silhouette di ragazzi con i telefoni alzati, controluce. | ines, sacha | ◻ segnaposto |
| `art/shared/c1_camion.png` | 6:45. Il camion dei pompieri SDIS 77 si ferma a venti metri dalla grata. Due pompieri scendono, uno con il casco in mano. Il fumo del cassonetto a destra. | ines, jerome, sacha | ◻ segnaposto |
| `art/shared/c1_pompiere.png` | Primo piano del pompiere più anziano (Jérôme): casco con un graffio bianco nuovo, sguardo stanco. Dietro, sfocato, il camion col parabrezza stellato. | ines, jerome, sacha | ◻ segnaposto |
| `art/shared/c1_sgombero.png` | 7:10. Tre furgoni della polizia, luci blu che girano sui muri. Il cordone avanza verso i ragazzi seduti davanti alla grata. Il commissario con la fascia tricolore e il megafono. | ines, jerome, mehdi, odile, sacha | ◻ segnaposto |
| `art/shared/c1_prof_visiera.png` | 7:35. La prof Garnier, sciarpa verde, davanti a un agente con il casco abbassato. Lei lo guarda dritto: «Mehdi?». Lui non risponde. Inquadratura di tre quarti, i due volti vicini. | ines, mehdi, odile | ◻ segnaposto |
| `art/shared/c1_grata_vuota.png` | 7:45. La grata libera, il cassonetto annerito rovesciato, striscioni calpestati sull'asfalto bagnato. Luce grigia del mattino. | ines, odile, sacha | ◻ segnaposto |
| `art/shared/c3_assemblea.png` | Mezzogiorno. Il cortiletto dietro la palestra (tetto puntellato con travi). Duecento ragazzi, cartelli, una cassa bluetooth. Sacha in piedi sul muretto parla, braccio alzato. | ines, odile, sacha | ◻ segnaposto |
| `art/shared/c3_metro.png` | 13:10. Linea 5, un vagone pieno di liceali con i cartelli. In fondo, Sacha passa un passamontagna a Nassim. Luci della galleria che scorrono nei finestrini. | ines, odile, sacha | ◻ segnaposto |
| `art/shared/c4_republique.png` | 14:20. Place de la République: la statua della Marianne coperta di ragazzi, una folla enorme di gilet gialli, sindacati, infermiere, nonni. Bandiere e cartelli. | ines, jerome, odile, sacha | ◻ segnaposto |
| `art/shared/c4_applausi.png` | 15:20. Boulevard Voltaire. I pompieri in sciopero sfilano in divisa con i bracciali POMPIERS EN GRÈVE; i liceali intorno applaudono a braccia alzate. | ines, jerome, odile | ◻ segnaposto |
| `art/shared/c4_volantino.png` | 15:40. Una mano tende un volantino fotocopiato: «17 OCTOBRE 1961 — 17 OCTOBRE 2026». Dietro, sfocato, il cordone di polizia ai lati del corteo. | ines, jerome, mehdi, odile | ◻ segnaposto |
| `art/shared/c4_testa.png` | 16:50. La testa del corteo: k-way neri, ombrelli aperti senza pioggia, cappucci. Tra loro, piccolo, il cappuccio di Nassim che si allontana. | ines, sacha | ◻ segnaposto |
| `art/shared/c5_nation.png` | 17:20. Place de la Nation dall'alto del boulevard: la colonna con le statue di bronzo, la folla che arriva, sul lato del cours de Vincennes un muro di scudi. | ines, jerome, mehdi, odile, sacha | ◻ segnaposto |
| `art/shared/c5_gas.png` | 17:26. Il gas lacrimogeno basso e bianco. Silhouette che tossiscono, piegate, si tengono per le felpe. Un candelotto fuma per terra. | ines, jerome, mehdi, odile, sacha | ◻ segnaposto |
| `art/shared/c5_cassonetto.png` | 17:37. L'angolo del cours de Vincennes: un palazzo haussmanniano, farmacia al piano terra con la croce accesa, un cassonetto in fiamme sotto. Al primo piano, alla finestra, una signora anziana in vestaglia (Mme Ferrero). Il fumo sale verso di lei. | ines, jerome, mehdi, odile, sacha | ◻ segnaposto |
| `art/shared/c5_carica.png` | 17:39. La carica: gli scudi in primo piano che avanzano, la folla che si rovescia all'indietro. Un cartello a terra calpestato. | ines, jerome, mehdi, odile, sacha | ◻ segnaposto |
| `art/shared/c5_granata.png` | 17:42. Inquadratura bassa, ad altezza di scarpa: una granata che rotola tra le scarpe e fuma. Sullo sfondo, accanto al cassonetto in fiamme, un ragazzo a terra (Nassim). | ines, jerome, mehdi, odile, sacha | ◻ segnaposto |
| `art/shared/c5_mano.png` | 17:44. LA MANO TESA. Un agente (Mehdi) trascina Nassim per il cappuccio lontano dal fuoco; in primo piano una mano tesa verso di lui, nel fumo. Sullo sfondo un pompiere in divisa si fa largo. | ines, jerome, mehdi, odile, sacha | ◻ segnaposto |
| `art/shared/c5_vuota.png` | 17:52. La piazza che si svuota. Scarpe spaiate, cartelli a terra, un volantino del 1961 calpestato. Il cassonetto nero fuma ancora sotto la finestra del primo piano. | ines, jerome, mehdi, odile, sacha | ◻ segnaposto |
| `art/shared/c6_avicenne.png` | Sera. Il corridoio dell'ospedale Avicenne a Bobigny: sedie arancioni, una macchinetta, neon. In fondo, seduto, un pompiere con la divisa sporca di fumo. | ines, jerome | ◻ segnaposto |
| `art/shared/c6_commissariato.png` | Sera. Commissariato di Bobigny: una panca di metallo, un neon che ronza, il bancone in fondo con un agente. Pareti verde ospedale. | ines, jerome, odile, sacha | ◻ segnaposto |
| `art/shared/c7_grata_scritta.png` | Il giorno dopo. La grata del Dumont ancora nera di fumo; sopra, a spray bianco, a lettere enormi: ON EST PAS VOS ENNEMIS. | ines, mehdi | ◻ segnaposto |
| `art/shared/c7_cartello.png` | Il giorno dopo. Un'edicola: in prima pagina una foto di Nation con il fumo e, in basso, il cartello di Inès calpestato. Titolo: «La jeunesse en colère». | ines | ◻ segnaposto |
| `art/shared/c8_grata_lunedi.png` | Epilogo corale, lunedì 2 novembre, 7:55. La grata del Dumont ridipinta di verde; sotto la vernice fresca si intravede ancora la scritta ON EST PAS VOS ENNEMIS. Ragazzi con gli zaini, luce fredda del mattino. | corale | ◻ segnaposto |
| `art/shared/c8_aula_lunedi.png` | Epilogo corale, 8:20. L'aula 204 piena: trentacinque ragazzi stretti nei banchi, la macchia d'umido a forma di Africa sul soffitto, la lavagna. | corale | ◻ segnaposto |

## Inès

| File | Inquadratura | Usata da | Stato |
|---|---|---|---|
| `art/ines/01_cucina.png` | Inès, 5:40. La cucina di casa, buia, una sola luce sopra il tavolo. Una tazza, un post-it giallo. Dalla finestra le torri della cité con qualche finestra accesa. | ines | ◻ segnaposto |
| `art/ines/02_telefono.png` | Inès: il telefono in mano al buio, lo schermo acceso illumina le dita. (Usata per le schermate di chat.) | ines | ◻ segnaposto |
| `art/ines/03_sasso.png` | Inès, 6:48. In primo piano di spalle un ragazzo col cappuccio (Nassim) con il braccio alzato; il parabrezza del camion che si stella. Il momento prima e dopo, insieme. | ines | ◻ segnaposto |
| `art/ines/04_camera.png` | Inès, 9:10. Il soggiorno di giorno: Nassim addormentato sul divano con le scarpe ai piedi. Luce grigia dalla finestra. | ines | ◻ segnaposto |
| `art/ines/05_cucina_giorno.png` | Inès, 10:30. La stessa cucina di giorno, il telefono sul tavolo che vibra: «Maman». | ines | ◻ segnaposto |
| `art/ines/06_cartello.png` | Inès. Il cartello scritto a mano sul cartone di una pizza: BISMILLAH C'EST LES TÉNÈBRES (ET LE PLAFOND AUSSI). Un pennarello, le mani sporche d'inchiostro. | ines | ◻ segnaposto |
| `art/ines/07_microfono.png` | Inès, 15:35. Una giornalista radio tende il microfono verso Inès (soggettiva). Dietro il corteo sul boulevard Voltaire. | ines | ◻ segnaposto |
| `art/ines/08_mamma.png` | Inès, 22:30. La mamma in camice da aiuto-infermiera che arriva di corsa in fondo al corridoio di Avicenne. | ines | ◻ segnaposto |
| `art/ines/09_camera_notte.png` | Inès, 2:40. La cameretta al buio: Nassim dorme con il gesso sul cuscino; il telefono di Inès acceso sul letto accanto. | ines | ◻ segnaposto |
| `art/ines/10_telefono_commissariato.png` | Inès, 23:00. Il telefono a muro del commissariato, la cornetta in mano, un agente che guarda l'orologio. | ines | ◻ segnaposto |
| `art/ines/11_cella.png` | Inès, 3:10. La cella di garde à vue: piastrelle, una panca, una luce al neon dietro una grata, le sbarre in primo piano. | ines | ◻ segnaposto |

## Sacha

| File | Inquadratura | Usata da | Stato |
|---|---|---|---|
| `art/sacha/01_magazzino.png` | Sacha, 4:50. Il parcheggio del magazzino di Aulnay sotto i lampioni al sodio: operai in gilet catarifrangente che escono dal turno di notte. Sacha di spalle si toglie il gilet. | sacha | ◻ segnaposto |
| `art/sacha/02_telefono.png` | Sacha: il telefono in una mano guantata nera, lo schermo della chat Signal. (Usata per le schermate di chat.) | sacha | ◻ segnaposto |
| `art/sacha/03_appartamento.png` | Sacha, 9:30. L'appartamento di Lou a Pantin: ombrelli neri contro il muro, una scatola di occhialini da piscina, tazze di caffè solubile, tre ragazzi sui telefoni. | sacha | ◻ segnaposto |
| `art/sacha/04_furgone.png` | Sacha, ricordo: a 17 anni, la guancia schiacciata sul pavimento di gomma di un furgone di polizia, un ginocchio sulla schiena, gli stivali in primo piano. | sacha | ◻ segnaposto |
| `art/sacha/05_vetrina.png` | Sacha, 15:55. La vetrina di una banca all'angolo con la rue de la Roquette che riflette la testa del corteo vestita di nero; un ragazzino con un pezzo di pavé in mano. | sacha | ◻ segnaposto |
| `art/sacha/06_volantino_terra.png` | Sacha, 16:30. Il volantino del 1961 per terra, calpestato da un'impronta di scarpa, sull'asfalto del boulevard. Una mano guantata lo raccoglie. | sacha | ◻ segnaposto |
| `art/sacha/07_cella.png` | Sacha, notte. La cella del commissariato del 12°: panca di metallo, Sacha seduto a viso scoperto, la luce del corridoio che entra dalla grata della porta. | sacha | ◻ segnaposto |
| `art/sacha/08_palestra.png` | Sacha, il giorno dopo. La palestra di boxe del quartiere: il ring, i sacchi appesi, Nassim seduto sulle corde con il gesso al polso che tende un paio di guantoni. | sacha | ◻ segnaposto |
| `art/sacha/09_portone.png` | Sacha, 19:30. Rue des Pyrénées: un portone socchiuso, Sacha nell'androne che si toglie il k-way nero; fuori, le sirene che passano. | sacha | ◻ segnaposto |
| `art/sacha/10_kebab.png` | Sacha, 21:10. Un kebab di Ménilmontant: il televisore sopra il frigo delle bibite che trasmette in loop il video di Nation; Sacha di spalle al bancone. | sacha | ◻ segnaposto |
| `art/sacha/11_canale.png` | Sacha, il giorno dopo all'alba. Il canale dell'Ourcq, acqua grigia, i magazzini sull'altra riva; un passamontagna nero che galleggia. | sacha | ◻ segnaposto |

## Jérôme

| File | Inquadratura | Usata da | Stato |
|---|---|---|---|
| `art/jerome/01_cabina.png` | Jérôme, 6:15. La cabina del camion SDIS 77 di notte sulla N3: il cruscotto illuminato, Hugo al volante, i lampioni che scorrono, la radio. | jerome | ◻ segnaposto |
| `art/jerome/02_parabrezza.png` | Jérôme, 6:48. Dall'interno della cabina: il parabrezza stellato dal sasso, dietro le crepe il fuoco del cassonetto e le silhouette dei ragazzi. | jerome | ◻ segnaposto |
| `art/jerome/03_getto.png` | Jérôme, 6:50. In primo piano le mani guantate sulla lancia, il getto d'acqua che colpisce il cassonetto in fiamme, il vapore; un sasso che vola nel controluce. | jerome | ◻ segnaposto |
| `art/jerome/04_caserma.png` | Jérôme, 8:40. Il centro di soccorso di Chelles: un ufficio con un vecchio computer, il cursore nella casella «Observations», dalla finestra il camion col parabrezza rotto. | jerome | ◻ segnaposto |
| `art/jerome/05_telefono.png` | Jérôme: il telefono in una mano con un cerotto, lo sfondo con la foto di Jade vestita da pompiere. (Usata per le chat.) | jerome | ◻ segnaposto |
| `art/jerome/06_armadietto.png` | Jérôme, 10:30. Lo spogliatoio della caserma: un armadietto aperto, il casco di riserva, una busta bianca «Lettre de démission». | jerome | ◻ segnaposto |
| `art/jerome/07_rer.png` | Jérôme, 12:40. Il vagone della RER E: una decina di pompieri in divisa con i bracciali arancioni POMPIERS EN GRÈVE, una signora che offre una clementina, il cartello di Samia. | jerome | ◻ segnaposto |
| `art/jerome/08_cordone.png` | Jérôme, 16:10. Sul boulevard Voltaire un giovane agente con la visiera alzata (Mehdi) guarda il bracciale di Jérôme. I due si guardano. | jerome | ◻ segnaposto |
| `art/jerome/09_vsav.png` | Jérôme, 18:10. Dentro l'ambulanza VSAV della Brigata: Nassim sulla barella con la maschera d'ossigeno, Maxime che controlla il monitor, Jérôme seduto con gli occhi rossi. | jerome | ◻ segnaposto |
| `art/jerome/10_cucina_notte.png` | Jérôme, 0:40. La cucina di casa a Chelles: Sandrine in pigiama al tavolo, un bicchiere d'acqua, le mani fasciate di Jérôme. | jerome | ◻ segnaposto |
| `art/jerome/11_cameretta.png` | Jérôme, il giorno dopo. Mattina, il letto: Jade di quattro anni che guarda le mani fasciate del papà. Luce morbida. | jerome | ◻ segnaposto |
| `art/jerome/12_tv.png` | Jérôme, notte/mattina. Il soggiorno: il televisore acceso con il video in loop di un pompiere che colpisce un poliziotto; Jade sul divano di spalle. | jerome | ◻ segnaposto |

## Odile

| File | Inquadratura | Usata da | Stato |
|---|---|---|---|
| `art/odile/01_thermos.png` | Odile, 7:05. L'angolo della rue de la Folie all'alba: una donna con sciarpa e thermos che si mette a correre; in fondo alla strada il fumo nero e le luci blu. | odile | ◻ segnaposto |
| `art/odile/02_telefono.png` | Odile: il telefono in mano, occhiali da lettura appoggiati sul naso. (Usata per le chat con la preside e l'EHPAD.) | odile | ◻ segnaposto |
| `art/odile/03_aula.png` | Odile, 9:30. L'aula 204 vuota: trentacinque sedie strette, la macchia d'umido a forma di Africa sul soffitto, la lavagna dove Odile scrive (il gioco ci scrive sopra le parole scelte: lasciare la lavagna libera). | odile | ◻ segnaposto |
| `art/odile/04_ehpad.png` | Odile, 10:30. Una stanza dell'EHPAD di Vincennes: Lucien, 88 anni, in poltrona davanti alla finestra; Odile seduta accanto che gli tiene la mano. | odile | ◻ segnaposto |
| `art/odile/05_bancone.png` | Odile, 20:30. Il bancone del commissariato del 12°: dietro il vetro Mehdi, senza casco, davanti a uno schermo; Odile di spalle con la borsa. | mehdi, odile | ◻ segnaposto |
| `art/odile/06_pont.png` | Odile, mezzanotte. Il ponte Saint-Michel, la Senna nera, Notre-Dame sullo sfondo; poche persone con cartelli scritti a mano; un garofano che cade nell'acqua. | odile | ◻ segnaposto |
| `art/odile/07_aula_dopo.png` | Odile, lunedì 2 novembre. L'aula 204 al mattino: sulla lavagna, sotto le parole di Odile, una scritta in un'altra calligrafia. | odile | ◻ segnaposto |
| `art/odile/08_cella.png` | Odile, notte. La cella del commissariato: una donna di cinquantadue anni seduta sulla panca con il braccio fasciato, la sciarpa verde persa. | odile | ◻ segnaposto |
| `art/odile/09_ehpad_mattina.png` | Odile, il giorno dopo. L'EHPAD all'alba: il padre lucido per un minuto, gli occhi aperti, la mano su quella fasciata della figlia. | odile | ◻ segnaposto |

## Mehdi

| File | Inquadratura | Usata da | Stato |
|---|---|---|---|
| `art/mehdi/01_briefing.png` | Mehdi, 6:00. La sala briefing del commissariato di Bobigny: neon, agenti in tenuta antisommossa seduti, il brigadier-chef Carrel in piedi con il tablet. | mehdi | ◻ segnaposto |
| `art/mehdi/02_furgone.png` | Mehdi, 6:50. Dentro il furgone della CSI: caschi sulle ginocchia, Fabre che mastica la gomma, la radio sul cruscotto, le luci blu che entrano dai finestrini con la grata. | mehdi | ◻ segnaposto |
| `art/mehdi/03_palazzo_c.png` | Mehdi, 7:05. Dal finestrino del furgone, attraverso la grata: il palazzo C della cité della Folie, la finestra del quarto piano accesa. | mehdi | ◻ segnaposto |
| `art/mehdi/04_nassim.png` | Mehdi, 7:40. Nassim, felpa grigia e mani nere di fumo, ghigna e sputa a dieci centimetri dagli stivali dell'agente; inquadratura dal basso. | mehdi | ◻ segnaposto |
| `art/mehdi/05_commissariato.png` | Mehdi, 9:30. L'open space del commissariato: scrivanie, schermi, Fabre in piedi con il telefono che legge ad alta voce, colleghi che ridono. | mehdi | ◻ segnaposto |
| `art/mehdi/06_estate.png` | Mehdi, ricordo di luglio: un mortaio d'artificio che esplode su uno scudo a mezzo metro dalla visiera, una luce verde che riempie tutto. | mehdi | ◻ segnaposto |
| `art/mehdi/07_panino.png` | Mehdi, 12:30. Dentro il furgone parcheggiato a Nation, un panino in mano; dal parabrezza la piazza vuota, le transenne, e all'angolo il palazzo della farmacia con la signora che annaffia i gerani. | mehdi | ◻ segnaposto |
| `art/mehdi/08_cordone.png` | Mehdi, 15:20. Il corteo visto da dentro il casco (soggettiva attraverso la visiera rigata): i pompieri in divisa applauditi, il cartello di Inès. | mehdi | ◻ segnaposto |
| `art/mehdi/09_casco.png` | Mehdi, 17:38. Il mondo da dentro il casco con la maschera antigas: il respiro appannato sulla visiera, il fuoco e la folla sfocati, il bordo nero che si stringe. | mehdi | ◻ segnaposto |
| `art/mehdi/10_verbale.png` | Mehdi, 20:00. Davanti allo schermo del verbale, la casella «Usage de la force — circonstances»; il casco appoggiato sulla scrivania. | mehdi | ◻ segnaposto |
| `art/mehdi/11_parcheggio.png` | Mehdi, notte. Il parcheggio sotterraneo del commissariato: Mehdi in macchina, il casco sul sedile, un neon che sfarfalla, un volantino sul sedile del passeggero. | mehdi | ◻ segnaposto |
| `art/mehdi/12_muro.png` | Mehdi, il giorno dopo. Il muro del palazzo C accanto al portone: a spray nero, una sola parola, SAÏDI. | mehdi | ◻ segnaposto |
| `art/mehdi/13_telefono.png` | Mehdi: il telefono in mano, i guanti tattici sul ginocchio. (Usata per le chat con la madre.) | mehdi | ◻ segnaposto |
