// =====================================================================
//  MEHDI SAÏDI — il poliziotto (gardien de la paix, CSI 93)
//  "Sotto il casco"
// =====================================================================
INCLUDE comune.ink

VAR garnier_risposta = ""     // madame | visiera | circulez
VAR nassim_fermato = false
VAR battuta = ""              // riso | taciuto | detto
VAR snapchat = ""             // rifiutato | accettato | guardato
VAR domanda_briefing = false
VAR cenno_pompiere = false
VAR volantino_preso = false
VAR respiro_ok = false
VAR verbale = ""              // verita | coperto
VAR quartiere_detto = false
VAR visiera_corteo = ""       // occhi | abbassata

~ personaggio = "mehdi"
~ rabbia = 4
~ paura = 6
~ fiducia = 4
~ responsabilita = 5
-> alba

// =====================================================================
=== alba ===
# capitolo: alba
# ora: 06:00
# img: mehdi/01_briefing
# amb: interno
Commissariato di Bobigny, sala briefing, 6:00. Odore di caffè della macchinetta e di ginocchiere sudate. Il brigadier-chef Carrel legge dal tablet senza occhiali, tenendolo lontano.
«Blocco al liceo Ernestine-Dumont. Cassonetti in fiamme. Liberiamo il cancello, fermiamo chi lancia oggetti. Niente zelo, niente video, niente cazzate.»
Il Dumont. Il tuo liceo. Dieci minuti a piedi da casa di tua madre.

# img: mehdi/02_furgone
# ora: 06:50
# amb: sirene
# incrocio: X02
Nel furgone. Fabre, accanto a te, mastica una gomma e racconta di una ragazza. Gli altri ridono. Tu guardi la visiera appoggiata sulle ginocchia.
La radio gracchia: _Mezzo dei pompieri preso a sassate davanti al liceo. Parabrezza rotto. Richiesta supporto._
«Adesso prendono a sassate i pompieri», dice Fabre. «I pompieri! Sono malati, 'sti ragazzini.» Tu sai chi sono quei ragazzini. Sono quelli del palazzo C. Eri uno di loro.

# img: mehdi/03_palazzo_c
# ora: 07:05
Il furgone passa sotto il palazzo C. Al quarto piano la finestra di tua madre ha la luce accesa: è già sveglia, prepara il caffè, ascolta la radio in arabo.
Ti abbassi sul sedile senza volerlo. Fabre se ne accorge. «Che hai, Saïdi?» «Niente. Un crampo.»
Al quartiere sei un poliziotto. In furgone sei l'arabo. Non sei mai dove sei.

# img: shared/c1_sgombero
# ora: 07:10
# fx: lampeggianti
I ragazzi sono seduti davanti alla grata, intrecciati. Altri, più grandi, sono già spariti nei cortili. Il fumo di un cassonetto spento. Carrel fa la sua lettura al megafono.
Poi l'ordine: sollevarli uno a uno. Sono leggeri. Sono più leggeri di quanto pensavi. Un ragazzino ti si aggrappa al braccio come a una sbarra.

# img: shared/c1_prof_visiera
# ora: 07:35
# incrocio: X04
Una donna con la sciarpa verde ti si para davanti. Ti guarda a lungo. Conosci quello sguardo da prima di sapere chi è.
«Mehdi? Mehdi Saïdi?»
La Garnier. Storia e geografia. Aula 204. Nel 2015 ti ha dato diciotto in un compito sulla decolonizzazione e tu sei andato in bagno a guardare il foglio per cinque minuti.
* [«Professoressa.»]
    ~ garnier_risposta = "madame"
    ~ su(fiducia, 1)
    Lo dici piano, sotto la visiera: «Prof.» Lei lo sente. Il ragazzino che tenevi per il cappuccio ti scivola via. Non lo riprendi.
    Fabre, dietro di te, fischia. «Prof? La conosci, la nonnina?» # ricorda: La Garnier se ne ricorderà.
* [Abbassi la visiera e non rispondi.]
    ~ garnier_risposta = "visiera"
    ~ su(paura, 1)
    Abbassi la visiera. Il mondo diventa grigio e rigato. Lei resta lì un secondo, poi si gira verso i suoi alunni.
    Ti senti come quando non sapevi rispondere a un'interrogazione: piccolo, e furioso di esserlo.
* [«Circolare, signora.»]
    ~ garnier_risposta = "circulez"
    ~ giu(fiducia, 1)
    ~ su(rabbia, 1)
    «Circolare, signora.» La voce di servizio, quella che hai imparato in scuola di polizia. Non ti riconosci.
    Lei ti guarda come si guarda un compito copiato. Poi circola.
- -> sputo

= sputo
# img: mehdi/04_nassim
# ora: 07:40
Un ragazzino con la felpa grigia ti passa accanto, le mani nere di fumo. Ti guarda, ti riconosce. Sputa a dieci centimetri dai tuoi stivali.
«Lo sbirro del palazzo C. Bismillah, è il buio, eh?» Ride. È Nassim Haddad. L'hai visto nascere, praticamente. Sua madre e la tua prendono lo stesso autobus.
* [Lo fermi.]
    ~ nassim_fermato = true
    ~ su(rabbia, 1)
    Lo prendi per il braccio. « Oltraggio. » Lui smette di ridere. Ha paura. Ha quindici anni.
    Carrel arriva, guarda il ragazzino, guarda te. «Lascialo, Saïdi. Abbiamo detto niente zelo.» Lo lasci. Il ragazzino scappa e si gira solo una volta, all'angolo. # ricorda: Nassim se ne ricorderà.
* [Lasci perdere.]
    ~ su(fiducia, 1)
    Lasci perdere. Fabre ride. «Sei proprio molle, Saïdi. Ti ha sputato addosso.» «Accanto. Ha sputato accanto.»
    È una differenza che solo tu capisci. È tutta la differenza del mondo.
- -> ritorno

= ritorno
# img: mehdi/02_furgone
# ora: 08:10
Nel furgone, al ritorno, Carrel si siede accanto a te. Si toglie il casco e si passa una mano sulla testa rasata.
«Li conosci, quei ragazzini, Saïdi? Anche la prof ti conosceva.»
* [«Sì, capo. È il mio quartiere.»]
    ~ quartiere_detto = true
    ~ su(fiducia, 1)
    «È il mio quartiere. Mia madre abita al palazzo C.» Carrel annuisce lentamente, come uno che archivia un'informazione.
    «Bene. Può tornare utile.» Non ti piace come lo dice. Non ti piace _utile_.
* [«No, capo. Non proprio.»]
    ~ su(paura, 1)
    «Non proprio.» Carrel non insiste. Fabre ride sotto i baffi: lui ha sentito la prof.
    Hai rinnegato il tuo quartiere in un furgone alle otto del mattino. Non c'era neanche un gallo a cantare.
- -> mattina

// =====================================================================
=== mattina ===
# capitolo: mattina
# ora: 09:30
# img: mehdi/05_commissariato
# fxoff
# amb: interno
Commissariato, open space. Fabre ha il telefono in mano e legge ad alta voce, con l'accento esagerato, uno screenshot che gira da ieri.
«_Wesh la team, bismillah c'est les ténèbres, demain on bloque à kel heure svp, jsui chaud de ouf frérot._» _Ehi team, bismillah è il buio, domani a che ora blocchiamo, sono gasatissimo fratè._ Imita un accento che non è di nessuno, e quindi è di tutti quelli come tua madre.
Ridono tutti. Dicono che è uno di voi, quello che l'ha scritto. Un collega infiltrato nelle chat dei liceali. Nessuno sa chi.

# incrocio: X05
«Saïdi! L'hai scritto tu? Hai il vocabolario giusto!» Altre risate. Tutti ti guardano.
* [Ridi anche tu.]
    ~ battuta = "riso"
    ~ giu(fiducia, 1)
    ~ su(rabbia, 1)
    Ridi. Fai anche tu l'accento, peggio di Fabre. Le risate raddoppiano. Per un minuto sei uno di loro.
    Poi vai in bagno e ti guardi allo specchio. Hai la faccia di tuo padre quando tornava dal cantiere e diceva che andava tutto bene.
* [Non dici niente.]
    ~ battuta = "taciuto"
    ~ su(paura, 1)
    Non dici niente. Fai un mezzo sorriso, quello che non impegna. Le risate si spengono da sole.
    Nessuno se ne accorge. È questo che ti fa più male: che nessuno si accorga del tuo silenzio.
* [«È razzista, Fabre.»]
    ~ battuta = "detto"
    ~ su(responsabilita, 2)
    ~ su(paura, 1)
    Lo dici normale, senza alzare la voce. La stanza si raffredda di dieci gradi.
    «Oh, dai, è una battuta.» «Lo so che è una battuta.» Fabre non ti rivolgerà più la parola fino a stasera. Neanche gli altri. # ricorda: I colleghi se ne ricorderanno.
- -> carrel

= carrel
# img: mehdi/05_commissariato
# ora: 10:20
Carrel ti chiama nel suo ufficio. Ha un figlio della tua età, dice sempre. Non dice mai come si chiama.
{ quartiere_detto: «Mi hai detto che è il tuo quartiere.» } «Saïdi. Tu li conosci, quei ragazzini. Parli la loro lingua. Dai un'occhiata alle loro storie, ai loro gruppi, a cosa preparano per Nation. In via ufficiosa.»
Ti tende un telefono di servizio. Nella stanza accanto qualcuno fa ancora l'accento del messaggio.
* [«No, capo.»]
    ~ snapchat = "rifiutato"
    ~ su(fiducia, 1)
    ~ su(paura, 1)
    «No, capo. Non è il mio lavoro. E non è la mia lingua, è la loro.» Carrel ti guarda a lungo. «Come vuoi.» Ripone il telefono nel cassetto.
    Non sai se hai appena perso la tua promozione o salvato qualcosa che non sapresti nominare. Forse tutte e due.
* [Accetti.]
    ~ snapchat = "accettato"
    ~ giu(fiducia, 2)
    Lo prendi. Per un'ora guardi storie di ragazzini: balli, cartelli, _battle d'aura_, un gatto. Un video di Nassim Haddad che dice _aura meno mille agli sbirri_.
    Non c'è niente da trovare. Scrivi a Carrel: _Niente di particolare._ Ti senti sporco come se avessi frugato in un cassetto di tua madre.
* [Lo prendi, guardi, e non dici niente a nessuno.]
    ~ snapchat = "guardato"
    ~ su(paura, 1)
    Lo prendi. Guardi. Vedi che oggi alle cinque _i grandi_ vogliono andare in testa. Vedi che Nassim Haddad ha chiesto un passamontagna a qualcuno.
    Quando Carrel ti chiede, dici: «Niente, capo.» È una bugia. Non sai a favore di chi.
- -> estate

= estate
# img: mehdi/06_estate
# ora: 11:00
# amb: notte
Dal bagno del commissariato, la mano appoggiata al lavandino, ti torna addosso l'estate.
Luglio, una notte di rivolte a Clichy. Un mortaio d'artificio che ti esplode sullo scudo a mezzo metro dalla faccia. Il rumore, il caldo, la visiera che si riempie di luce verde.
Da allora, sotto il casco, a volte il respiro se ne va. Il cuore corre, le mani si addormentano, il mondo si restringe a un tubo. Nessuno lo sa. Se lo sapessero, ti toglierebbero dalla CSI.
Respiri. Conti fino a quattro. Esci dal bagno.
-> mezzogiorno

// =====================================================================
=== mezzogiorno ===
# capitolo: mezzogiorno
# ora: 12:30
# img: mehdi/07_panino
# amb: interno
Panino nel furgone, parcheggiato a Nation, dietro le transenne. La piazza è ancora vuota. Davanti a te, all'angolo del cours de Vincennes, una farmacia. Al primo piano una signora annaffia i gerani.
Il telefono vibra. _Maman._ Tua madre.
«Mehdi. La madre degli Haddad mi ha chiesto se oggi ci sarai. A Nation.»
«E tu cosa le hai detto?» «Che non lo sapevo.» Una pausa. «Ci sarai?» «Sì, mamma.» «Allora stai attento ai piccoli. Sono tutti figli di qualcuno.»

# img: mehdi/01_briefing
# ora: 13:15
Briefing sul posto. Un commissario che non conosci, con la fascia tricolore, parla davanti ai furgoni. «Dispositivo rafforzato. Cours de Vincennes vietato. In caso di disordini, si disperde e si ferma. Voglio dei fermi, signori.»
_Voglio dei fermi._ Un numero. Fabre si sfrega le mani.
* [Alzi la mano: «E per i minorenni, signor commissario?»]
    ~ domanda_briefing = true
    ~ su(fiducia, 1)
    ~ su(responsabilita, 1)
    Il commissario ti guarda. «I minorenni si fermano come gli altri. Con discernimento.» _Discernimento._ Fabre ti dà un calcio alla caviglia.
    Hai fatto una domanda. In CSI una domanda è già una risposta.
* [Annuisci.]
    ~ su(rabbia, 1)
    Annuisci con gli altri. Il commissario se ne va. Fabre: «Discernimento un cazzo. Chi mi tira un sampietrino, se lo mangia.»
- -> pomeriggio

// =====================================================================
=== pomeriggio ===
# capitolo: pomeriggio
# ora: 15:20
# img: mehdi/08_cordone
# amb: folla
# incrocio: X07
Cordone sul boulevard Voltaire, ai lati del corteo. Sei lì da un'ora, immobile, sotto venti chili di protezioni. Il corteo ti passa davanti come un fiume che non ti vede.
Poi l'applauso. Passano i pompieri in sciopero, in divisa. I ragazzi impazziscono. Uno di loro ha il casco graffiato di bianco.
Una ragazza ha un cartello storto: ‹BISMILLAH C'EST LES TÉNÈBRES (ET LE PLAFOND AUSSI)=in nome di Dio, è il buio (e anche il soffitto)›. È Inès Haddad. La sorella. Ti viene da ridere. Ti trattieni.

# ---
Il pompiere con il casco graffiato ti guarda il casco, la visiera, poi la faccia. Ti fa un cenno con la testa. Due uniformi.
* [Rispondi al cenno.]
    ~ cenno_pompiere = true
    ~ su(fiducia, 1)
    Rispondi, appena. Fabre non se ne accorge. Il pompiere sorride e torna tra i suoi. # ricorda: Il pompiere si ricorderà di te.
* [Guardi dritto davanti a te.]
    Guardi dritto davanti a te. Non si risponde ai manifestanti. Anche se sono pompieri. Soprattutto se sono pompieri.
- -> coro

= coro
# img: mehdi/08_cordone
# ora: 15:30
Poi passano i liceali. Si fermano davanti al cordone, a due metri, e cantano verso di voi: «‹Tout le monde dé-teste la po-li-ce!=tutti odiano la polizia›»
Poi, ridendo: «BIS-MIL-LAH! C'EST LES TÉ-NÈ-BRES!» La frase dello screenshot, la frase di Fabre. Adesso è loro.
Un ragazzino ti guarda dritto nella visiera. Ha l'età di Nassim. Ha la faccia di tutti quelli del palazzo C.
* [Lo guardi negli occhi, la visiera alzata.]
    ~ visiera_corteo = "occhi"
    ~ su(fiducia, 1)
    ~ su(paura, 1)
    Alzi la visiera. Lo guardi. Lui smette di cantare. Per tre secondi siete solo due ragazzi della stessa banlieue, uno con il casco e uno senza.
    Poi il corteo lo porta via. Fabre: «Abbassa la visiera, sei matto?»
* [Abbassi la visiera.]
    ~ visiera_corteo = "abbassata"
    ~ su(rabbia, 1)
    Abbassi la visiera. Il ragazzino diventa una sagoma grigia, come gli altri. È più facile, così. È fatto apposta per essere più facile.
- -> volantino

= volantino
# img: shared/c4_volantino
# ora: 15:40
# incrocio: X08
La Garnier risale il corteo con una pila di volantini. Si ferma davanti a te. Ti tende un foglio. _17 OCTOBRE 1961 — 17 OCTOBRE 2026._
Il braccio teso, il foglio che trema nel vento. I colleghi guardano te.
{ garnier_risposta == "madame":
    Stamattina le hai detto _prof_. Lei se lo ricorda: si vede da come aspetta.
}
* [Lo prendi e lo infili nel giubbotto.]
    ~ volantino_preso = true
    ~ su(fiducia, 1)
    ~ su(responsabilita, 1)
    Lo prendi. Lo infili nel giubbotto senza leggerlo. Non vi dite niente. Fabre: «Hai preso un volantino? Adesso sei del sindacato?»
    Nel 2015, nell'aula 204, la Garnier aveva proiettato una foto: una scritta su un muro del lungosenna, ‹Ici on noie les Algériens=qui si annegano gli algerini›. Te la ricordi adesso, con il foglio contro il petto.
* [Non lo prendi.]
    ~ su(rabbia, 1)
    Non lo prendi. Lei aspetta un secondo di troppo, poi ritira la mano. La guardi andare via e ti senti come quando non hai consegnato un compito che avevi fatto.
- -> scontro

// =====================================================================
=== scontro ===
# capitolo: scontro
# ora: 17:20
# img: shared/c5_nation
# amb: sirene
Place de la Nation. Il cordone tra la piazza e il cours de Vincennes. Tu sei in prima linea. Davanti a te arriva la testa del corteo: k-way neri, ombrelli, cappucci. Dietro, migliaia di persone che spingono.
La radio: _Tenete la linea. Tenete la linea._

# img: shared/c5_gas
# ora: 17:26
# sfx: lacrimogeno
# fx: gas
Partono i lacrimogeni, dietro di te. Tu hai la maschera. Il mondo diventa un acquario bianco e i ragazzi davanti a te pesci che tossiscono.
Una bottiglia rimbalza sul tuo scudo. Poi un sasso. Poi una cosa che non vedi e che fa un rumore di ferro.

# img: shared/c5_cassonetto
# ora: 17:37
# fx: fumo
# amb: fuoco
# incrocio: X09
All'angolo del cours de Vincennes un cassonetto prende fuoco sotto il palazzo della farmacia. Al primo piano, alla finestra, la signora dei gerani. Il fumo sale verso di lei.
Dici alla radio: «Fuoco sotto palazzo abitato, angolo Vincennes.» La radio risponde: _Tenete la linea._
Il cuore comincia a correre. Il casco si stringe. È luglio, è Clichy, è la luce verde.

# img: mehdi/09_casco
# ora: 17:38
Ordine di carica tra trenta secondi. Le mani ti si addormentano dentro i guanti. Devi respirare. # mini: respiro
* [ok # ok]
    ~ respiro_ok = true
    ~ giu(paura, 2)
    Quattro dentro. Quattro fuori. Il tubo si allarga. Torna la piazza, tornano i rumori, tornano le persone dentro le sagome.
    Sei qui. Sei a Nation, il 17 ottobre. Non sei a Clichy.
* [ko # ko]
    ~ su(paura, 2)
    Il respiro non torna. Il mondo resta un tubo. Le sagome davanti a te non hanno più facce: sono solo forme che si muovono verso di te.
- -> carica

= carica
# img: shared/c5_carica
# ora: 17:39
# sfx: colpo
«AVANTI!» La linea parte. Venti caschi, venti scudi, un unico animale.
{ domanda_briefing:
    _Con discernimento_, ha detto il commissario. La parola ti torna in mente adesso, ridicola e preziosa.
}
{ visiera_corteo == "occhi":
    Tra le sagome davanti a te cerchi il ragazzino del coro. Non lo trovi. Li cerchi tutti.
}
La radio ripete l'ordine. # timer: 8
* [Carichi a fondo.]
    ~ decisiva(1, "V", "Hai caricato a fondo, colpendo chi ti capitava davanti.")
    ~ su(rabbia, 2)
    Carichi. Il manganello si alza e si abbassa da solo. Una spalla, una schiena, un braccio alzato a proteggere una testa. Non conti.
    Quando la linea si ferma, il manganello ti pesa come se fosse bagnato.
* { paura < 8 } [Avanzi tenendo la linea, senza colpire.]
    ~ decisiva(1, "P", "Hai avanzato con la linea senza colpire.")
    ~ su(responsabilita, 1)
    Avanzi con la linea. Lo scudo spinge, il manganello resta abbassato. Spingi la folla come si spinge una porta, non come si picchia un uomo.
    Fabre, accanto a te, colpisce per due. Lo vedi. Lo vedi bene.
* { paura >= 8 } [Avanzi tenendo la linea, senza colpire. # locked: il panico non ti lascia misurare i gesti]
    -> granata
* [Resti fermo. Il panico. # timeout]
    ~ decisiva(1, "F", "Sei rimasto fermo, paralizzato dal panico, mentre la linea caricava.")
    ~ su(paura, 1)
    La linea parte e tu resti lì. Un buco nel cordone. Carrel ti urla qualcosa dalla radio. Le gambe non sono più tue.
- -> granata

= granata
# img: shared/c5_granata
# ora: 17:41
# sfx: granata
# flash
Un mortaio d'artificio esplode contro gli scudi in scintille verdi. A mezzo metro. Luglio. Clichy. Il cuore.
{ respiro_ok:
    Il respiro tiene. Quattro dentro, quattro fuori. Sei ancora qui.
- else:
    Il respiro se ne va di nuovo. Il tubo si stringe.
}
Fabre ti mette in mano una granata di dispersione. «Vai, Saïdi! Lanciala! Ci stanno bombardando!»
Davanti a te: la folla, il fumo, il cassonetto in fiamme. Ragazzi. Ragazzi di quindici anni. # timer: 7
* [La lanci in mezzo alla folla.]
    ~ decisiva(2, "V", "Hai lanciato la granata in mezzo alla folla.")
    ~ su(rabbia, 1)
    # sfx: granata
    # flash
    La lanci. Rotola sull'asfalto tra le scarpe, piccola come una lattina. Esplode accanto al cassonetto in fiamme.
* [Non la lanci.]
    ~ decisiva(2, "P", "Non hai lanciato la granata che Fabre ti ha messo in mano.")
    ~ su(responsabilita, 1)
    La tieni in mano. Non la lanci. «No.» Fabre te la strappa, impreca, e la lancia lui.
    Rotola sull'asfalto tra le scarpe, piccola come una lattina. Esplode accanto al cassonetto in fiamme. Non è stata la tua mano. Era nella tua mano.
* [Resti con la granata in mano. # timeout]
    ~ decisiva(2, "F", "Sei rimasto paralizzato con la granata in mano.")
    ~ su(paura, 1)
    Resti con la granata in mano. Fabre te la strappa e la lancia lui. Rotola tra le scarpe ed esplode accanto al cassonetto.
- -> nassim

= nassim
# img: shared/c5_mano
# ora: 17:43
# fx: fumo
# incrocio: X10
Quando il fumo si apre, c'è un ragazzo a terra accanto al cassonetto. Felpa grigia. Nassim Haddad.
Lo prendi per il cappuccio e lo trascini via dal fuoco, verso la linea. È la procedura. Ha la faccia piena di sangue. Respira con un fischio che non ti piace.
# ---
{ snapchat == "guardato":
    Stamattina, nelle sue storie, chiedeva un passamontagna. Non l'hai detto a nessuno. Adesso il passamontagna è nero di fumo e sangue.
}
{ nassim_fermato:
    Ti riconosce. Stamattina l'hai preso per il braccio davanti al liceo. Adesso ti guarda come si guarda la fine del mondo.
- else:
    Ti riconosce. «Lo sbirro del palazzo C…» Non ride più.
}

# incrocio: X11
Una ragazza si pianta davanti a te: Inès. Dietro di lei, il pompiere con il casco graffiato si fa largo nel fumo urlando «POMPIERE! FATEMI PASSARE!».
Fabre arriva da destra con il manganello alzato. «Si muove ancora, quello!» # timer: 8
* [Colpisci il ragazzo, prima che lo faccia Fabre.]
    ~ decisiva(3, "V", "Hai colpito Nassim, a terra.")
    ~ su(rabbia, 2)
    # sfx: colpo
    Lo colpisci. Una volta. Sulla testa, perché è lì che il manganello cade quando non lo guidi.
    Nassim smette di muoversi. Inès urla il tuo nome, il tuo nome vero, quello di quando eravate piccoli.
* { fiducia >= 4 } [Lo copri con lo scudo e lasci passare il pompiere.]
    ~ decisiva(3, "P", "Hai protetto Nassim con lo scudo e hai lasciato passare il pompiere.")
    ~ su(responsabilita, 1)
    Ti metti tra Fabre e il ragazzo. Lo scudo alzato. «È a terra. Basta così.» Fabre ti guarda come un traditore.
    { cenno_pompiere: Il pompiere ti riconosce: il cenno del boulevard Voltaire. } «POMPIERE!» Ti sposti. Lui si inginocchia su Nassim.
* { fiducia < 4 } [Lo copri con lo scudo e lasci passare il pompiere. # locked: non ti fidi di nessuno, qui, neanche di un pompiere]
    -> dopo
* [Lo ammanetti e basta.]
    ~ decisiva(3, "P", "Hai ammanettato Nassim senza colpirlo.")
    Lo giri a pancia in giù e gli metti le fascette, senza colpire, senza ginocchio sulla schiena. Fabre si ferma.
    «Fermato», dici alla radio. È quello che volevano: un numero. Almeno è un numero vivo.
* [Ti blocchi. # timeout]
    ~ decisiva(3, "F", "Ti sei bloccato mentre Fabre alzava il manganello su Nassim.")
    ~ su(paura, 1)
    Ti blocchi. Il tubo, il respiro. Fabre colpisce. Tu guardi attraverso la visiera come attraverso un vetro sporco.
- -> dopo

= dopo
# img: shared/c5_vuota
# ora: 17:52
# fxoff: gas
# amb: sirene
Alle 17:52 la piazza è vuota. Scarpe, cartelli, volantini calpestati. Il cassonetto nero fuma.
Al primo piano la finestra della signora dei gerani. { d1 == "P": Le imposte sono chiuse.|La finestra è aperta e nera. La Brigata sale con la scala.}
Ti togli la maschera. L'aria della piazza ti brucia la gola. Non è il gas: è la piazza.
~ calcola_esito()
{ esito == "PACE":
    -> sera_pace
- else:
    -> sera_violenza
}

// =====================================================================
=== sera_pace ===
# capitolo: sera
# ora: 20:00
# img: mehdi/10_verbale
# fxoff
# amb: interno
Commissariato del 12°. Il verbale d'intervento. Lo schermo, il cursore. Fabre è passato due volte dietro la tua sedia senza dire niente.
Hai visto Fabre colpire per due durante la carica. Hai visto Fabre lanciare la granata, o te la sei vista strappare di mano. Il verbale chiede: _Uso della forza — circostanze._
* [Scrivi la verità.]
    ~ verbale = "verita"
    ~ su(responsabilita, 1)
    Scrivi tutto. Gli orari, i gesti, il lancio della granata a corto raggio in direzione di un gruppo di minori. Il nome del collega.
    Premi _Conferma_. Il dito trema. Sai cosa succede a chi scrive certi verbali. Lo sanno tutti. # ricorda: Fabre se ne ricorderà.
* [Copri Fabre.]
    ~ verbale = "coperto"
    ~ giu(fiducia, 1)
    Scrivi _uso proporzionato dei mezzi di dispersione, in risposta a lanci di oggetti_. È la frase standard. È nel manuale. È falsa.
    Premi _Conferma_. Il dito non trema. Questo ti spaventa di più.
- -> carrel_sera

= carrel_sera
# img: mehdi/10_verbale
# ora: 20:20
Carrel legge il verbale sul suo schermo. Poi ti chiama.
{ verbale == "verita":
    «Lo sai cosa stai facendo, Saïdi?» «Sì, capo.» «Fabre ha due figli.» «Il piccolo Haddad ha una madre.»
    Carrel ti guarda a lungo. Poi chiude il file senza modificarlo. «Vai al bancone. C'è una prof che chiede di te.»
- else:
    «È pulito», dice. Ti batte sulla spalla. { snapchat == "accettato": «E grazie per le storie, stamattina. Mi sono servite per il rapporto.» Non gli sono servite a niente: non c'era niente. Gli sono servite lo stesso. } «Vai al bancone. C'è una prof che chiede di te.»
}
-> bancone

= bancone
# img: odile/05_bancone
# ora: 20:30
# incrocio: X12
Al bancone, alle 20:30, arriva la Garnier. Ha perso la sciarpa verde. Cerca i suoi alunni fermati. «Mehdi», dice. Non _agente_. Mehdi.
Ti detta i nomi come all'appello. Li cerchi sullo schermo. Due li fai uscire subito. Due resteranno la notte.
Poi le dici, a bassa voce, senza guardarla: «Il piccolo Haddad. È ad Avicenne. Polso rotto. L'ha portato il pompiere.»
{ volantino_preso:
    Tiri fuori dal giubbotto il volantino, piegato in quattro, un po' bagnato di sudore. «L'ho letto, prof. Sul furgone.» Lei non dice niente. Annuisce, come quando qualcuno dava la risposta giusta.
}
-> notte_pace

= notte_pace
# capitolo: notte
# ora: 01:30
# img: mehdi/11_parcheggio
# amb: notte
Alle una e mezza, nel parcheggio sotterraneo del commissariato, ti togli il casco seduto in macchina. Finalmente.
{ battuta == "detto" || verbale == "verita":
    I colleghi non ti parlano. Su WhatsApp il gruppo della compagnia è diventato silenzioso da quando sei entrato tu. Domani sarà peggio.
- else:
    Fabre ti ha dato una pacca sulla spalla, uscendo. «Sei uno a posto, Saïdi.» Non sai se è un complimento.
}
Respiri. Quattro dentro, quattro fuori. Nessun tubo. Solo il parcheggio, l'odore di benzina, e il volantino sul sedile del passeggero.

# img: shared/c7_grata_scritta
# ora: domenica
Il giorno dopo passi davanti al Dumont, in borghese, tornando da casa di tua madre. La grata è ancora nera di fumo.
Qualcuno ci ha scritto sopra, con lo spray bianco, a lettere enormi: ‹ON EST PAS VOS ENNEMIS=non siamo vostri nemici›.
Ti fermi. Lo leggi due volte. Non sai a chi è rivolto: a te, ai ragazzi, ai pompieri, a nessuno.
Decidi che è rivolto a tutti. Riprendi a camminare.
-> END

// =====================================================================
=== sera_violenza ===
# capitolo: sera
# ora: 20:00
# img: mehdi/10_verbale
# fxoff
# amb: interno
Commissariato del 12°. Il verbale. Il cursore lampeggia nella casella _Uso della forza — circostanze_.
Il ragazzo è ad Avicenne. { d3 == "V": Il colpo alla testa. } { d2 == "V": La granata, a due metri dalla faccia. } { d1 == "V": La carica: l'hanno trovato sotto la folla. } Un medico ha detto a Carrel una frase che Carrel ripete a tutti con la stessa voce: _rischia di perdere l'occhio_.
* [Scrivi la verità.]
    ~ verbale = "verita"
    Scrivi la verità. Sui tuoi gesti. Ti ci vuole un'ora per quattro righe. Ogni parola pesa come lo scudo.
    Carrel legge sopra la tua spalla. Non dice niente. Poi ti mette una mano sulla spalla, per la prima volta in tre anni.
* [Scrivi la frase standard.]
    ~ verbale = "coperto"
    _Uso proporzionato dei mezzi di dispersione, in risposta a lanci di oggetti._ Premi _Conferma_.
    I video sono già su tutti i telefoni di Francia. La frase standard non cambierà niente. La scrivi lo stesso.
- -> igpn

= igpn
# img: mehdi/13_telefono
# chat: Mamma
# ora: 23:40
Mamma: Mehdi
Mamma: sei tu nel video?
Mamma: la madre degli Haddad piange per le scale
* [«Sì, mamma.»]
    Mehdi: sì mamma
    Mehdi: scusa
    Il messaggio risulta letto. Nessuna risposta.
* [Non rispondi.]
    Il telefono vibra ancora due volte. Poi smette.
- -> notte_violenza

= notte_violenza
# /chat
# capitolo: notte
# ora: 02:00
# img: mehdi/11_parcheggio
# amb: notte
L'IGPN ha aperto un'inchiesta. Sei sospeso in via cautelare dalla CSI. Fabre è venuto a dirti che ti difenderanno, che il sindacato è con te, che hai fatto il tuo lavoro.
Nel parcheggio sotterraneo, in macchina, ti togli il casco. Il respiro non torna. Non torna per tutta la notte.
{ volantino_preso:
    Sul sedile del passeggero c'è il volantino della Garnier. Lo apri finalmente. _17 ottobre 1961._ Poliziotti che eseguivano ordini. Lo richiudi.
}

# img: mehdi/12_muro
# ora: domenica
Il giorno dopo torni da tua madre. Non apre. Resti sul pianerottolo del quarto piano dieci minuti, poi scendi.
Sul muro del palazzo C, accanto al portone, a spray nero, qualcuno ha scritto il tuo nome. Solo il nome. SAÏDI.
Non c'è bisogno di aggiungere niente. Al quartiere tutti sanno leggere.
-> END
