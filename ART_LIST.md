# Lista delle illustrazioni

Generata da `npm run artlist` (non modificare a mano: le descrizioni stanno in `js/scenedefs.js`).

**Formato:** 320×200 pixel (o più grande, ma con proporzioni 16:10), **in scala di grigi**.
Il gioco converte la luminosità nei 4 colori del personaggio con un dither ordinato:
nero → colore 1, grigio scuro → colore 2, grigio chiaro → colore 3, bianco → colore 4.
Usa `tools/convertitore.html` per preparare disegni e foto e vedere subito l'anteprima nelle cinque palette.
Per provare una tavola basta salvarla nel percorso indicato e ricaricare il gioco.

**Avanzamento:** 0/43 tavole disegnate.

## Interfaccia (titolo, ritratti, finali)

| File | Inquadratura | Usata da | Stato |
|---|---|---|---|
| `art/ui/titolo.png` | Schermata del titolo: la scritta C'EST LES TÉNÈBRES sopra una banlieue di notte, un fuoco in basso. | interfaccia | ◻ segnaposto |
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
| `art/shared/c1_grata.png` | Alba, 6:00. La grata del Lycée Ernestine-Dumont, l'edificio anni '70 dietro. Una trentina di ragazzi con striscioni arrotolati; due cassonetti spinti sul marciapiede. Cielo ancora blu notte, lampioni accesi. | ines | ◻ segnaposto |
| `art/shared/c1_fuoco.png` | 6:20. Un cassonetto in fiamme davanti alla grata. Il fumo sale verso le finestre del palazzo di fronte. Silhouette di ragazzi con i telefoni alzati, controluce. | ines | ◻ segnaposto |
| `art/shared/c1_camion.png` | 6:45. Il camion dei pompieri SDIS 77 si ferma a venti metri dalla grata. Due pompieri scendono, uno con il casco in mano. Il fumo del cassonetto a destra. | ines | ◻ segnaposto |
| `art/shared/c1_pompiere.png` | Primo piano del pompiere più anziano (Jérôme): casco con un graffio bianco nuovo, sguardo stanco. Dietro, sfocato, il camion col parabrezza stellato. | ines | ◻ segnaposto |
| `art/shared/c1_sgombero.png` | 7:10. Tre furgoni della polizia, luci blu che girano sui muri. Il cordone avanza verso i ragazzi seduti davanti alla grata. Il commissario con la fascia tricolore e il megafono. | ines | ◻ segnaposto |
| `art/shared/c1_prof_visiera.png` | 7:35. La prof Garnier, sciarpa verde, davanti a un agente con il casco abbassato. Lei lo guarda dritto: «Mehdi?». Lui non risponde. Inquadratura di tre quarti, i due volti vicini. | ines | ◻ segnaposto |
| `art/shared/c1_grata_vuota.png` | 7:45. La grata libera, il cassonetto annerito rovesciato, striscioni calpestati sull'asfalto bagnato. Luce grigia del mattino. | ines | ◻ segnaposto |
| `art/shared/c3_assemblea.png` | Mezzogiorno. Il cortiletto dietro la palestra (tetto puntellato con travi). Duecento ragazzi, cartelli, una cassa bluetooth. Sacha in piedi sul muretto parla, braccio alzato. | ines | ◻ segnaposto |
| `art/shared/c3_metro.png` | 13:10. Linea 5, un vagone pieno di liceali con i cartelli. In fondo, Sacha passa un passamontagna a Nassim. Luci della galleria che scorrono nei finestrini. | ines | ◻ segnaposto |
| `art/shared/c4_republique.png` | 14:20. Place de la République: la statua della Marianne coperta di ragazzi, una folla enorme di gilet gialli, sindacati, infermiere, nonni. Bandiere e cartelli. | ines | ◻ segnaposto |
| `art/shared/c4_applausi.png` | 15:20. Boulevard Voltaire. I pompieri in sciopero sfilano in divisa con i bracciali POMPIERS EN GRÈVE; i liceali intorno applaudono a braccia alzate. | ines | ◻ segnaposto |
| `art/shared/c4_volantino.png` | 15:40. Una mano tende un volantino fotocopiato: «17 OCTOBRE 1961 — 17 OCTOBRE 2026». Dietro, sfocato, il cordone di polizia ai lati del corteo. | ines | ◻ segnaposto |
| `art/shared/c4_testa.png` | 16:50. La testa del corteo: k-way neri, ombrelli aperti senza pioggia, cappucci. Tra loro, piccolo, il cappuccio di Nassim che si allontana. | ines | ◻ segnaposto |
| `art/shared/c5_nation.png` | 17:20. Place de la Nation dall'alto del boulevard: la colonna con le statue di bronzo, la folla che arriva, sul lato del cours de Vincennes un muro di scudi. | ines | ◻ segnaposto |
| `art/shared/c5_gas.png` | 17:26. Il gas lacrimogeno basso e bianco. Silhouette che tossiscono, piegate, si tengono per le felpe. Un candelotto fuma per terra. | ines | ◻ segnaposto |
| `art/shared/c5_cassonetto.png` | 17:37. L'angolo del cours de Vincennes: un palazzo haussmanniano, farmacia al piano terra con la croce accesa, un cassonetto in fiamme sotto. Al primo piano, alla finestra, una signora anziana in vestaglia (Mme Ferrero). Il fumo sale verso di lei. | ines | ◻ segnaposto |
| `art/shared/c5_carica.png` | 17:39. La carica: gli scudi in primo piano che avanzano, la folla che si rovescia all'indietro. Un cartello a terra calpestato. | ines | ◻ segnaposto |
| `art/shared/c5_granata.png` | 17:42. Inquadratura bassa, ad altezza di scarpa: una granata che rotola tra le scarpe e fuma. Sullo sfondo, accanto al cassonetto in fiamme, un ragazzo a terra (Nassim). | ines | ◻ segnaposto |
| `art/shared/c5_mano.png` | 17:44. LA MANO TESA. Un agente (Mehdi) trascina Nassim per il cappuccio lontano dal fuoco; in primo piano una mano tesa verso di lui, nel fumo. Sullo sfondo un pompiere in divisa si fa largo. | ines | ◻ segnaposto |
| `art/shared/c5_vuota.png` | 17:52. La piazza che si svuota. Scarpe spaiate, cartelli a terra, un volantino del 1961 calpestato. Il cassonetto nero fuma ancora sotto la finestra del primo piano. | ines | ◻ segnaposto |
| `art/shared/c6_avicenne.png` | Sera. Il corridoio dell'ospedale Avicenne a Bobigny: sedie arancioni, una macchinetta, neon. In fondo, seduto, un pompiere con la divisa sporca di fumo. | ines | ◻ segnaposto |
| `art/shared/c6_commissariato.png` | Sera. Commissariato di Bobigny: una panca di metallo, un neon che ronza, il bancone in fondo con un agente. Pareti verde ospedale. | ines | ◻ segnaposto |
| `art/shared/c7_grata_scritta.png` | Il giorno dopo. La grata del Dumont ancora nera di fumo; sopra, a spray bianco, a lettere enormi: ON EST PAS VOS ENNEMIS. | ines | ◻ segnaposto |
| `art/shared/c7_cartello.png` | Il giorno dopo. Un'edicola: in prima pagina una foto di Nation con il fumo e, in basso, il cartello di Inès calpestato. Titolo: «La jeunesse en colère». | ines | ◻ segnaposto |

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
