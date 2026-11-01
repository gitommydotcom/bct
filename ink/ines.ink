// =====================================================================
//  INÈS HADDAD — la studentessa
//  "Il plafond aussi"
// =====================================================================
INCLUDE comune.ink

VAR barricata = ""          // accettata | striscioni | votata
VAR fiamme_spente = false
VAR nassim_sgridato = false
VAR nassim_coperto = false
VAR scuse_pompiere = false
VAR scelta_sgombero = ""           // seduta | trattativa | fuga
VAR maelys_verita = false
VAR ha_mentito = false
VAR discorso = ""           // pace | rabbia | nassim
VAR screenshot = ""         // inoltrato | avvertito | cartello
VAR maschera_presa = false
VAR garnier_avvisata = false
VAR microfono = false
VAR seguito_testa = false
VAR video_girato = false
VAR colpito_mehdi = false
VAR confronto_martedi = false

~ personaggio = "ines"
~ rabbia = 4
~ paura = 4
~ fiducia = 6
~ responsabilita = 7
-> alba

// =====================================================================
=== alba ===
# capitolo: alba
# ora: 05:40
# img: ines/01_cucina
# amb: interno
Sono le 5:40. In cucina c'è ancora l'odore del caffè della mamma, uscita alle nove di ieri sera per il turno di notte ad Avicenne.
Sul tavolo, un post-it giallo: ‹Mange quelque chose. Je t'aime. Maman.=Mangia qualcosa. Ti voglio bene. Mamma.›
La porta della camera di Nassim è aperta. Il letto è fatto, cioè disfatto come sempre, ma vuoto.
Tuo fratello ha quindici anni e da tre settimane si sveglia prima di te.

# img: ines/02_telefono
# chat: BLOCUS DUMONT ⚡
Yasmine: raga dove siete
Bilal: davanti al cancello tra 10 min
Yasmine: c'è già un sacco di gente
Bilal: dicono che ci sono anche i grandi del quartiere 👀
* [«Chi ha chiamato i grandi?»]
    Inès: chi li ha chiamati i grandi??
    Bilal: tuo fratello credo 💀
    ~ su(paura, 1)
* [«Arrivo. Niente fuoco, avevamo detto.»]
    Inès: arrivo. niente fuoco, avevamo detto.
    Yasmine: sissignora capa 🫡
    ~ su(fiducia, 1)
- Inès: Nassim dove sei
Nassim ha visualizzato.
-> grata

= grata
# /chat
# img: shared/c1_grata
# ora: 06:02
# amb: folla
Davanti al Dumont la notte è ancora blu. Una trentina di ragazzi, gli striscioni arrotolati sotto il braccio, i thermos che passano di mano in mano.
Poi il rumore: ruote di plastica sull'asfalto. Cinque o sei ragazzi più grandi spingono i cassonetti del quartiere giù per la rue de la Folie.
# ---
Davanti a tutti c'è Sacha, quello della palestra di boxe. Ha il passamontagna arrotolato sul collo, come una sciarpa.

# incrocio: X01
«Ciao, delegata. Vi abbiamo portato i mobili.»
Dietro di lui, con un cassonetto tutto per sé, c'è Nassim. Ti fa un sorriso enorme, lo stesso di quando a sei anni rubava i biscotti dall'armadio alto.
I cassonetti sono lì. Tutti aspettano che tu dica qualcosa.
* [«Metteteli davanti al cancello. Ma niente fuoco.»]
    ~ barricata = "accettata"
    ~ su(rabbia, 1)
    ~ giu(fiducia, 1)
    Sacha annuisce. «Niente fuoco.» Lo dice come si dice _a dopo_.
    I cassonetti si allineano davanti alla grata, uno accanto all'altro, come denti.
* [«No. Striscioni e i nostri corpi. Basta.»]
    ~ barricata = "striscioni"
    ~ su(fiducia, 1)
    Sacha alza le spalle. «Come vuoi tu, capa.»
    Ma i cassonetti restano lì, a dieci metri, parcheggiati sul marciapiede. Come un'idea che nessuno ha ancora avuto il coraggio di avere.
* [Ti giri verso il gruppo: «Votiamo?»]
    ~ barricata = "votata"
    ~ giu(responsabilita, 1)
    Le mani si alzano nel buio. Vince la barricata, di poco.
    Ti dici che è democrazia. Ti senti più leggera, e la leggerezza non ti piace.
- -> fuoco

= fuoco
# img: shared/c1_fuoco
# ora: 06:20
# fx: fumo
# amb: fuoco
Alle 6:20 qualcuno accende un cassonetto. Non vedi chi. Vedi solo l'arancio che sale e trenta telefoni che si alzano insieme, come girasoli.
«Le fiamme fanno visualizzazioni», ride qualcuno dietro di te.
Il fumo sale verso le finestre del palazzo di fronte, dove si accende una luce, poi un'altra.
* [Svuoti le bottiglie d'acqua degli zaini sul fuoco.]
    ~ fiamme_spente = true
    ~ su(responsabilita, 1)
    Tu e Yasmine svuotate sei bottiglie. Il fuoco sfrigola, si abbassa, non si spegne.
    Ma adesso è più fumo che fuoco, e nessuno lo filma più. Qualcuno ti chiama _la pompiera_. Non è un complimento.
* [Lo lasci bruciare. Senza un'immagine, nessuno vi vede.]
    ~ su(rabbia, 1)
    Il fuoco sale fino all'insegna del liceo. Le lettere di ERNESTINE-DUMONT diventano nere una alla volta.
    Domani sarà su tutte le storie. Una parte di te è fiera. L'altra conta le finestre accese del palazzo di fronte.
- -> camion

= camion
# img: shared/c1_camion
# ora: 06:45
# sfx: sirena
Alle 6:45 arriva un camion dei pompieri. Non è come quelli di Parigi: sulla fiancata c'è scritto SDIS 77.
Si ferma a venti metri. Scende un pompiere giovanissimo, poi un altro più grande, con il casco in mano e la faccia di chi non dorme da un'estate.

# img: ines/03_sasso
# ora: 06:48
# sfx: vetro
# incrocio: X02
Vedi il braccio prima del sasso. Lo riconosceresti tra mille: è il braccio che ti ruba le patatine dal piatto.
Il parabrezza si stella con un rumore secco, come un ghiacciolo che si spezza.
Nassim è già tornato dietro il cassonetto. Ride. Qualcuno gli dà una pacca sulla spalla.
Martedì era lo stesso. Martedì non l'hai detto a nessuno.
* [Lo afferri per il cappuccio e lo trascini via.]
    ~ nassim_sgridato = true
    ~ su(responsabilita, 1)
    «Mollami, non sei mia madre!» Lo tieni. Ti dà una spinta. Lo tieni lo stesso, fino al muro della palestra.
    «Sono pompieri, Nassim. POMPIERI.»
    Non risponde. Ti guarda come se la nemica fossi tu. # ricorda: Nassim se ne ricorderà.
    -> pompiere_lontano
* [Ti metti davanti a lui, perché nessuno lo veda.]
    ~ nassim_coperto = true
    ~ giu(responsabilita, 1)
    ~ su(paura, 1)
    Ti metti tra Nassim e i telefoni, le braccia larghe, come per stiracchiarti.
    Adesso il segreto è doppio: martedì, e stamattina. Pesa come uno zaino pieno di libri che nessuno ti ha chiesto di portare.
    -> pompiere_lontano
* [Vai verso il camion, a mani alzate.]
    ~ scuse_pompiere = true
    ~ su(fiducia, 2)
    -> pompiere_vicino

= pompiere_vicino
# img: shared/c1_pompiere
# incrocio: X03
Il pompiere grande ha un graffio bianco nuovo sul casco. Ti guarda arrivare con le mani alzate e per un attimo non capisce.
«Scusi. Non… non siamo noi. Cioè sì. Scusi.»
Lui si gira verso i ragazzi e alza la voce, quella che si usa nei cortili: «NON SIAMO VOSTRI NEMICI!»
Poi a te, piano: «Dai. Tieni i piccoli lontani dal fuoco.»
-> sgombero

= pompiere_lontano
# img: shared/c1_pompiere
# incrocio: X03
Dal camion, il pompiere grande urla qualcosa verso i ragazzi. Lo senti a metà, tra le risate: «…NON SIAMO VOSTRI NEMICI!»
Qualcuno risponde con un insulto. Lui rimette il casco e apre la manichetta.
-> sgombero

= sgombero
# img: shared/c1_sgombero
# ora: 07:10
# fxoff: fumo
# fx: lampeggianti
# amb: sirene
Alle 7:10 arrivano i blu. Tre furgoni, le luci che girano sui muri come in discoteca. Nessuno balla.
Un commissario con la fascia tricolore legge qualcosa al megafono. Le parole arrivano storte: _…dispersione… intimazioni…_
Yasmine ti stringe il braccio. «Inès. Che facciamo?»
* [«Ci sediamo. Tutti. A braccetto.»]
    ~ scelta_sgombero = "seduta"
    ~ su(paura, 1)
    ~ su(fiducia, 1)
    Vi sedete sull'asfalto gelato, intrecciati. Gli agenti vi sollevano uno a uno, come sacchi di patate.
    Fa male ai polsi e alla dignità. Ma nessuno tira niente: la vostra immobilità tiene fermi anche gli altri.
* [Vai dal commissario a trattare.]
    ~ scelta_sgombero = "trattativa"
    ~ su(fiducia, 1)
    «Liberiamo il cancello alle otto. Senza casini.»
    Il commissario ti guarda come si guarda un cane che parla. Poi, sorprendentemente, guarda l'orologio.
    «Sette e quarantacinque. Non un minuto di più.» Hai ottenuto mezz'ora. Ti sembra un secolo e niente.
* [Prendi Nassim per mano e scappi verso il quartiere.]
    ~ scelta_sgombero = "fuga"
    ~ su(paura, 1)
    ~ giu(responsabilita, 1)
    Corri. Nassim corre con te, per una volta senza discutere. Dietro di voi, i primi colpi sui cassonetti, le urla.
    Ti fermi solo all'angolo del palazzo C, col fiato rotto. Gli altri sono rimasti là.
- -> prof

= prof
# img: shared/c1_prof_visiera
# ora: 07:35
# incrocio: X04
Alle 7:35 arrivano i prof in sciopero, con le pettorine del sindacato. Davanti a tutti c'è la Garnier, la prof di storia, con la sua sciarpa verde.
Si ferma davanti a un agente col casco. Lo guarda a lungo. Poi dice, forte: «Mehdi? Mehdi Saïdi?»
L'agente non risponde. Ma adesso lo riconosci anche tu: è il figlio della signora Saïdi, palazzo C. Quello che vi portava al parco quando eravate piccoli.

# img: shared/c1_grata_vuota
# ora: 07:45
# fxoff
# amb: silenzio
Alle 7:45 la grata è libera. Restano un cassonetto annerito, gli striscioni calpestati, l'odore di plastica bruciata nei capelli.
Il liceo è chiuso comunque: oggi è il primo giorno delle vacanze. Avete bloccato una scuola vuota.
È questo il punto, pensi. Che nessuno se ne accorga mai.
-> mattina

// =====================================================================
=== mattina ===
# capitolo: mattina
# ora: 09:10
# img: ines/04_camera
# amb: interno
A casa ti togli la felpa che puzza di fumo e la ficchi in lavatrice, prima che torni la mamma.
Nassim dorme sul divano con le scarpe ancora ai piedi. Quando dorme sembra più piccolo. Sembra quello che è.

# img: ines/02_telefono
# chat: Maëlys 🩹
Maëlys: hai visto i video di stamattina?
Maëlys: il fuoco davanti alla scuola gira ovunque 🔥
Maëlys: io ho ancora la mascella a pezzi
Maëlys: il medico dice che potrò rimangiare le patatine tra 3 settimane. CHE AGONIA
* [Le dici la verità: hai paura per oggi pomeriggio.]
    ~ maelys_verita = true
    ~ su(fiducia, 1)
    Inès: ho paura per oggi pomeriggio. soprattutto per nassim
    Maëlys: anch'io avevo paura
    Maëlys: e ci sono andata lo stesso
    Maëlys: stai davanti. fatti vedere. e non mollare tuo fratello
* [Fai la forte.]
    ~ su(rabbia, 1)
    Inès: tranqui, spacchiamo tutto. cioè… per dire 😅
    Maëlys: inès.
    Maëlys: anch'io dicevo "per dire"
- -> chiamata

= chiamata
# /chat
# img: ines/05_cucina_giorno
# ora: 10:30
Alle 10:30 chiama la mamma, dalla pausa. Ha la voce di chi ha fatto dodici ore e ne farà altre dodici.
«Tesoro. Ho visto il fuoco al liceo su Facebook. Tu c'eri?»
Non aspetta la risposta. «E oggi pomeriggio? Andate a Parigi?»
* [«Sì. Andiamo a Nation. Nassim lo tengo con me.»]
    ~ su(responsabilita, 1)
    Silenzio. Si sente un bip di macchinario, lontano.
    «Tieni d'occhio tuo fratello. Promettimelo.»
    Prometti. La promessa ti resta in gola come una lisca.
* [«No, restiamo nel quartiere. Te lo giuro.»]
    ~ ha_mentito = true
    ~ su(paura, 1)
    «Va bene. Mi fido di te.»
    Riattacca. La fiducia della mamma ti pesa più di un cassonetto. # ricorda: La mamma se ne ricorderà.
- -> divano

= divano
# img: ines/04_camera
# ora: 11:00
Nassim apre un occhio quando gli togli le scarpe. «Hai fatto la spia?»
{ nassim_sgridato:
    Stamattina l'hai trascinato per il cappuccio davanti a tutti. Non te l'ha perdonato, si vede da come si gira verso il muro.
- else:
    Non sa se l'hai visto, stamattina. Lo sta chiedendo senza chiederlo.
}
* [«Lo so di martedì. Il sasso. E di stamattina.»]
    ~ confronto_martedi = true
    ~ su(fiducia, 1)
    Si mette seduto. Per un momento ha di nuovo sei anni e l'armadio alto alle spalle.
    «Lo fanno tutti.» Poi, più piano: «Il tipo ha urlato che non era nostro nemico. L'ho sentito.»
    Non dice altro. Ma non si rigira verso il muro. # ricorda: Nassim se ne ricorderà.
* [«No. Non ho detto niente a nessuno.»]
    ~ su(paura, 1)
    «Giura?» «Giuro.»
    È la verità, ed è proprio questo il problema. Nassim si rimette a dormire, tranquillo. Tu no.
- -> mezzogiorno

// =====================================================================
=== mezzogiorno ===
# capitolo: mezzogiorno
# ora: 11:50
# img: shared/c3_assemblea
# amb: folla
A mezzogiorno siete in duecento nel cortiletto dietro la palestra, quella col tetto puntellato. Il preside ha lasciato aperto il cancello piccolo, "per evitare disordini".
Bilal ha portato una cassa. Sul muretto c'è una _battle d'aura_, la gara a chi dà i punti più assurdi: «Aura +1000 al cancello! Aura meno six-seven al ministro!»
Ridono tutti. Per un minuto sembra una festa.

# ---
Poi Sacha sale sul muretto. Parla poco, come sempre.
«Il corteo ufficiale è una passeggiata. Gli sbirri vi chiudono in un recinto, tornate a casa, e lunedì niente. Noi andiamo davanti. Chi vuole farsi vedere, viene con noi.»
Nassim è in prima fila. Applaude più forte di tutti.
Adesso guardano te. Sei la delegata.
* [Parli di numeri e di pace.]
    ~ discorso = "pace"
    ~ su(fiducia, 1)
    «Se siamo centomila non c'è bisogno di spaccare niente. Basta esserci. Tutti. Fino in fondo.»
    Qualcuno fischia, molti applaudono. Il cortile vota il corteo ufficiale.
    Sacha scende dal muretto senza rancore apparente. «Come vuoi.» Nassim non ti guarda.
* [Parli di rabbia e di dignità.]
    ~ discorso = "rabbia"
    ~ su(rabbia, 2)
    «Siamo stati educati per tre settimane. Educati! E Maëlys ha la mascella rotta. A cosa serve essere educati?»
    Il cortile esplode. Ti senti alta tre metri. Sacha ti fa un cenno, da pari a pari.
    Solo scendendo ti accorgi che non hai detto cosa fare. Hai solo acceso.
* [Passi la parola a Nassim, che vuole parlare.]
    ~ discorso = "nassim"
    ~ su(fiducia, 1)
    ~ giu(responsabilita, 1)
    Nassim sale sul muretto. Balbetta, poi trova la voce.
    «Io ho quindici anni e nella mia classe non c'è il prof di matematica da settembre. Ecco. Basta.»
    Un silenzio. Poi un applauso enorme. Per la prima volta in tre settimane, il cortile sta zitto per ascoltare un ragazzino.
- -> screenshot_chat

= screenshot_chat
# img: ines/02_telefono
# chat: BLOCUS DUMONT ⚡
# incrocio: X05
Bilal: AHAHAHAH guardate cosa ha ricevuto uno su snap
_«wesh la team bismillah c'est les ténèbres demain on bloque a kel heure svp 🙏 jsui chaud de ouf frérot 😎 67»_
Il messaggio, più o meno: _«ehi team, bismillah è il buio, domani a che ora blocchiamo pls 🙏 sono gasatissimo fratè 😎 67»._ Scritto come un adulto che imita un ragazzino.
Yasmine: è uno sbirro al 100%. nessun ragazzo scrive "gasatissimo fratè" 💀
* [Lo inoltri ad altri tre gruppi, piangendo dal ridere.]
    ~ screenshot = "inoltrato"
    Inès: STO MORENDO 💀💀 lo giro
    In quattro minuti lo screenshot ha fatto il giro di tre gruppi, poi di trenta.
* [«State attenti a cosa scrivete qui.»]
    ~ screenshot = "avvertito"
    ~ su(paura, 1)
    Inès: ridete ma state attenti. se ci sono sbirri nei gruppi, di oggi pomeriggio qui non si dice niente
    Bilal: ok mamma 🙄
    Yasmine: no ha ragione
* [«Lo metto sul mio cartello.»]
    ~ screenshot = "cartello"
    ~ su(fiducia, 1)
    Inès: lo metto sul cartello. con il soffitto
    Yasmine: LEGGENDARIA
- -> cartello

= cartello
# /chat
# img: ines/06_cartello
Sul cartone di una pizza scrivi in nero, a lettere storte: ‹BISMILLAH C'EST LES TÉNÈBRES=in nome di Dio, è il buio›.
E sotto, più piccolo: ‹(ET LE PLAFOND AUSSI)=e anche il soffitto›. Quello della vostra aula, che perde.
{ screenshot == "cartello":
    Yasmine lo fotografa prima ancora che la vernice si asciughi.
- else:
    Ne hanno uno uguale in venti. Il tuo è il più storto, e quindi il tuo.
}
-> metro

= metro
# img: shared/c3_metro
# ora: 13:10
# amb: metro
# incrocio: X06
Linea 5, direzione Place d'Italie. Il vagone è pieno di cartelli, di risate troppo forti, di adulti che vi guardano come si guarda un temporale.
In fondo al vagone c'è Sacha. Tira fuori dalla tasca un passamontagna nero, ripiegato, e lo passa a Nassim come si passa una sigaretta.
Nassim se lo infila in tasca, veloce, guardandosi intorno. Il suo sguardo incontra il tuo.
* [Attraversi il vagone e glielo togli dalla tasca.]
    ~ maschera_presa = true
    ~ su(responsabilita, 1)
    ~ giu(fiducia, 1)
    «Stai scherzando?» Davanti a tutti. Lo fai lo stesso.
    Sacha alza le mani. «È per il gas, delegata. Solo per il gas.»
    Ti metti il passamontagna in tasca. Nassim scende a République senza parlarti. # ricorda: Nassim se ne ricorderà.
* [Lasci fare. Ha quindici anni, non cinque.]
    ~ giu(responsabilita, 1)
    Ti ripeti che è giusto, che non sei sua madre.
    Guardi fuori dal finestrino il buio della galleria e ci vedi la tua faccia, che non ci crede.
* [Cerchi la Garnier nel vagone accanto.]
    ~ garnier_avvisata = true
    ~ su(fiducia, 1)
    La Garnier ascolta, annuisce, non fa scenate.
    «Ci parlo io, con Sacha. Era un mio allievo, sai.»
    Ti senti un po' una spia e un po' una sorella. Forse è la stessa cosa.
- -> pomeriggio

// =====================================================================
=== pomeriggio ===
# capitolo: pomeriggio
# ora: 14:20
# img: shared/c4_republique
# amb: folla
Place de la République sembra un festival e un funerale insieme. Gilet gialli, sindacati, infermiere, universitari con le casse, nonni con i cartelli scritti a mano.
La statua è coperta di ragazzi. Qualcuno ha messo un cappellino a Marianne.
Il corteo parte verso il boulevard Voltaire. Direzione Nation.

# ---
# ora: 14:50
Davanti a voi qualcuno ha un megafono e una voce da stadio: «BIS-MIL-LAH!» E duecento liceali rispondono: «C'EST LES TÉ-NÈ-BRES!»
Un signore con il gilet giallo ride fino alle lacrime. Una signora con il cartello della CGT chiede a Yasmine cosa vuol dire. Yasmine ci pensa. «Niente. È per questo che fa ridere.»
{ discorso == "nassim":
    Nassim cammina accanto a te. Da stamattina, dopo il cortile, ogni tanto qualcuno lo riconosce: «Sei il piccolo della matematica!» Lui fa finta di niente ed è felice.
- else:
    Nassim cammina dieci metri davanti a te, con quelli della boxe. Ogni tanto si gira per controllare che tu ci sia. O che tu non ci sia.
}

# img: shared/c4_applausi
# ora: 15:20
# incrocio: X07
Sul boulevard Voltaire, all'improvviso, un applauso parte da dietro e vi passa sopra come un'onda.
Sono i pompieri. Una cinquantina, in divisa, con i bracciali ‹POMPIERS EN GRÈVE=pompieri in sciopero›. Camminano in mezzo a voi. I ragazzi gridano: «I pompieri con noi!»
Uno ha un graffio bianco sul casco. Ti riconosce. Si avvicina.

# ---
{ scuse_pompiere:
    «La ragazza con le mani alzate. Tutto bene?»
- else:
    Ti guarda come si guarda qualcuno che si è già visto senza ricordare dove.
}
Poi legge il tuo cartello e ride. «Anche il soffitto, eh. Da noi sono i camion. Tre invece di quattro.»
Prima di tornare tra i suoi, si china verso di te: «Tuo fratello. Quello del sasso. Tienilo vicino, oggi.»
Allora l'aveva visto.

# img: ines/07_microfono
# ora: 15:35
Una giornalista con il microfono di una radio ti si para davanti. «Sei una liceale? Vuoi dire qualcosa?»
* [Parli.]
    ~ microfono = true
    ~ su(fiducia, 1)
    Parli di Maëlys e della sua mascella, della palestra col tetto puntellato, del prof di matematica che non arriva da settembre.
    Non dici parolacce. Lei ti ringrazia. Per un minuto ti senti ascoltata da tutto il paese.
* [«Chieda agli altri. Io sto badando a mio fratello.»]
    ~ su(responsabilita, 1)
    Lei passa a Bilal, che dice _aura meno mille al governo_ e diventerà virale entro sera.
    Tu intanto conti le teste. Nassim c'è. Nassim c'è ancora.
- -> volantino

= volantino
# img: shared/c4_volantino
# ora: 15:40
# incrocio: X08
La Garnier risale il corteo con una pila di volantini fotocopiati. _17 OCTOBRE 1961 — 17 OCTOBRE 2026._
«Te lo ricordi, Inès?» Te lo ricordi: l'avete fatto in classe. I manifestanti algerini, la polizia, la Senna. I nomi che per quarant'anni nessuno ha voluto dire.
Ne dà uno a te, uno al pompiere, uno a chiunque. Poi lo allunga anche verso il cordone di polizia ai lati del corteo. Un agente lo guarda. Non vedi se lo prende.
{ garnier_avvisata:
    «Ho parlato con Sacha», ti dice piano. «Mi ha detto che era per il gas. Gli ho creduto a metà.»
}

# img: shared/c4_testa
# ora: 16:50
Verso le cinque, la testa del corteo accelera. Vedi i k-way neri, gli ombrelli aperti senza pioggia.
Vedi il cappuccio di Nassim che si allontana in mezzo a loro. { maschera_presa: Senza passamontagna. Ma con loro. }
Il telefono vibra. Nassim: _sto davanti tranqui_.
* [Lasci la classe e lo segui verso la testa.]
    ~ seguito_testa = true
    ~ su(paura, 1)
    Lasci a Yasmine il tuo pezzo di striscione. Corri controcorrente, poi con la corrente.
    Più avanzi, più la gente è vestita di nero, più l'aria sa di gas vecchio.
* [Resti con la classe e gli scrivi.]
    ~ su(fiducia, 1)
    Gli scrivi: _torna. subito._ Visualizzato. Nessuna risposta.
    Restate insieme, la classe intera, e arrivate a Nation dal boulevard venti minuti dopo la testa.
- -> scontro

// =====================================================================
=== scontro ===
# capitolo: scontro
# ora: 17:20
# img: shared/c5_nation
# amb: sirene
Place de la Nation. La colonna al centro, le statue di bronzo in cima, e sotto un mare di gente che non sa più dove andare.
Dal lato del cours de Vincennes c'è un muro di scudi. Dall'altro, il corteo che continua ad arrivare e spinge.
{ discorso == "rabbia":
    Qualcuno vicino a te grida: «A cosa serve essere educati?» Sono le tue parole di mezzogiorno. Adesso non sono più tue.
    ~ su(rabbia, 1)
}
{ discorso == "pace":
    «Fino in fondo! Tutti!» grida qualcuno della tua classe. Sono le tue parole di mezzogiorno. Ti tengono in piedi.
}

# img: shared/c5_gas
# ora: 17:26
# sfx: lacrimogeno
# fx: gas
Il primo lacrimogeno fa un rumore stupido, _pof_, come un tappo di spumante.
Poi il gas. Ti entra negli occhi, nel naso, nella gola, nei pensieri. Il mondo diventa bianco e lento.
{ seguito_testa:
    Sei a dieci metri da Nassim. Lo vedi tossire, ridere, tossire.
- else:
    Vi fate strada tenendovi per le felpe. Laggiù, vicino ai palazzi, vedi il cappuccio di Nassim.
}

# img: shared/c5_cassonetto
# ora: 17:37
# fx: fumo
# amb: fuoco
# incrocio: X09
Un gruppo trascina un cassonetto fino all'angolo del cours de Vincennes, sotto un palazzo. Al piano terra c'è una farmacia, la croce verde ancora accesa.
Il cassonetto prende fuoco con un soffio.
Al primo piano, dietro una finestra, una signora anziana in vestaglia guarda giù. Il fumo sale verso di lei.
{ fiamme_spente:
    Ti tornano in mente le sei bottiglie di stamattina. _La pompiera._
}
Hai in mano una bottiglia di plastica, quella dell'acqua per il gas. E il cordone, dall'altra parte, si muove. # timer: 9
* { paura < 8 } [«INDIETRO! C'È GENTE LASSÙ!»]
    ~ decisiva(1, "P", "Hai urlato alla folla di allontanarsi dal palazzo in fiamme.")
    ~ su(responsabilita, 1)
    La tua voce è una cosa piccola nel rumore. Ma Yasmine la riprende, e poi Bilal, e poi venti persone: «INDIETRO!»
    La folla si allarga, si stacca dal palazzo. La signora alla finestra chiude le imposte.
* { paura >= 8 } [«INDIETRO! C'È GENTE LASSÙ!» # locked: la paura ti chiude la gola]
    -> carica
* [Lanci la bottiglia contro gli scudi.]
    ~ decisiva(1, "V", "Hai lanciato una bottiglia contro il cordone mentre partiva la carica.")
    ~ su(rabbia, 2)
    # sfx: colpo
    La bottiglia vola, ruota, rimbalza su uno scudo. Un rumore minuscolo.
    Ma ha la forma di un segnale: intorno a te volano altre bottiglie, sassi, un cartello. Il cordone carica.
* [Resti ferma. # timeout]
    ~ decisiva(1, "F", "Sei rimasta ferma mentre il fumo saliva verso la finestra.")
    ~ su(paura, 1)
    Non riesci a muoverti. Il gas ti ha messo le mani nei polmoni.
    Guardi il fumo che sale, la signora che non si muove, e ti sembra di guardare un video.
- -> carica

= carica
# img: shared/c5_carica
# ora: 17:39
# sfx: colpo
La carica. Il cordone avanza di trenta metri in pochi secondi. La folla si rovescia all'indietro come acqua in una vasca.
Ti spingono, cadi, ti rialzi. Hai perso il cartello. Qualcuno ci cammina sopra.
{ scelta_sgombero:
- "seduta": Stamattina ti sei seduta per terra e ha funzionato. Qui, se ti siedi, ti calpestano.
- "trattativa": Stamattina hai trattato con un commissario. Qui non c'è nessuno con cui trattare: solo scudi.
- "fuga": Stamattina sei scappata e ti è sembrato giusto. Adesso non sai più da che parte si scappa.
}
# sfx: granata
# flash
Un botto contro gli scudi: un mortaio d'artificio, scintille verdi sul cordone. Gli agenti si abbassano. Si rialzano più arrabbiati.

# img: shared/c5_granata
# ora: 17:42
# sfx: granata
# flash
# incrocio: X10
Poi la vedi: una granata che rotola sull'asfalto in mezzo alle scarpe, piccola come una lattina.
Esplode a tre metri da te. Il suono te lo ricorderai per anni: non un _bum_, uno schiaffo all'aria.
Quando riapri gli occhi, Nassim è a terra. Vicino al cassonetto in fiamme. Sopra di lui, un casco. # timer: 8
* { responsabilita >= 5 } [Corri da Nassim e lo copri con il tuo corpo.]
    ~ decisiva(2, "P", "Sei corsa da Nassim e l'hai coperto con il tuo corpo.")
    ~ su(responsabilita, 1)
    ~ su(paura, 1)
    Corri. Ti butti su Nassim. Senti il manganello sulla schiena, una volta, due.
    Non fa male subito. Fa male dopo, quando capisci che l'avrebbe preso lui.
* { responsabilita < 5 } [Corri da Nassim e lo copri con il tuo corpo. # locked: oggi l'hai lasciato andare troppe volte]
    -> mano
* [Alzi il telefono e filmi l'agente sopra di lui.]
    ~ decisiva(2, "P", "Hai filmato l'agente sopra tuo fratello, invece di correre da lui.")
    ~ video_girato = true
    ~ su(rabbia, 1)
    Filmi. Il telefono trema, l'immagine è bianca di gas, ma l'agente si vede: il numero sul casco, il ginocchio.
    Nassim urla il tuo nome. Tu continui a filmare, perché qualcuno deve. Perché nessuno ci crederà, altrimenti.
* [Raccogli un sasso dal marciapiede e lo tiri contro il casco.]
    ~ decisiva(2, "V", "Hai tirato un sasso contro l'agente sopra tuo fratello.")
    ~ su(rabbia, 2)
    ~ colpito_mehdi = true
    # sfx: colpo
    Il sasso colpisce il casco con un rumore sordo. L'agente si gira verso di te. Per un secondo vi guardate.
    Poi si rimette in piedi. E Nassim resta solo, per terra.
* [Resti a terra. # timeout]
    ~ decisiva(2, "F", "Sei rimasta a terra mentre tuo fratello era sotto il casco.")
    ~ su(paura, 1)
    Resti a terra. Le mani sull'asfalto, le orecchie che fischiano.
    Vedi tutto e non fai niente, e ti odi per ogni secondo.
- -> mano

= mano
# img: shared/c5_mano
# ora: 17:44
# incrocio: X11
Un agente afferra Nassim per il cappuccio e lo trascina lontano dal fuoco, verso il cordone. Nassim ha la faccia piena di sangue e di gas.
L'agente si gira un attimo. Sotto la visiera lo riconosci: è Mehdi. Il ragazzo del palazzo C.
{ confronto_martedi:
    Nassim ti vede. Smette di divincolarsi. Ti guarda come stamattina sul divano, quando ha detto _ha urlato che non era nostro nemico_.
- else:
    Nassim si divincola, scalcia, urla parole che peggiorano tutto.
}
Nel fumo, accanto a te, si fa largo un uomo in divisa da pompiere, con il casco graffiato. Urla: «POMPIERE! FATEMI PASSARE!» # timer: 8
* { fiducia >= 4 } [Ti pianti davanti a Mehdi: «Sei del palazzo C. Ti conosco. Lascialo.»]
    ~ decisiva(3, "P", "Hai chiamato Mehdi per nome, invece di colpirlo.")
    Mehdi si blocca. Sotto la visiera ci sono gli occhi di un ragazzo di ventisei anni che ha paura quanto te.
    «Inès?» Solo il tuo nome. Poi la radio gracchia qualcosa che non capisci.
    Allenta la presa. Nassim scivola giù, sull'asfalto, e il pompiere è già lì.
* { fiducia < 4 } [Ti pianti davanti a Mehdi: «Sei del palazzo C. Ti conosco. Lascialo.» # locked: non credi più che qualcuno qui possa ascoltarti]
    -> dopo
* [Ti lanci su Mehdi e lo colpisci per strappargli Nassim.]
    ~ decisiva(3, "V", "Hai colpito Mehdi per strappargli tuo fratello.")
    ~ su(rabbia, 2)
    ~ colpito_mehdi = true
    # sfx: colpo
    Lo colpisci con tutta la forza che hai: la faccia, il casco, il petto, non sai. Qualcosa ti si rompe nella mano.
    Mehdi barcolla e molla Nassim. Poi altre mani ti prendono, ti piegano, ti schiacciano la guancia sull'asfalto caldo di fuoco.
* [Corri dal pompiere: «Mio fratello! Là!»]
    ~ decisiva(3, "P", "Hai chiamato il pompiere, invece di lottare.")
    ~ su(fiducia, 1)
    Il pompiere ti guarda, guarda Nassim, e corre. Si mette tra Mehdi e il ragazzo con le mani alzate.
    «POMPIERE! Respira male! Lasciate fare a me!» Mehdi esita. Poi lo lascia.
* [Non riesci a muoverti. # timeout]
    ~ decisiva(3, "F", "Sei rimasta ferma mentre portavano via tuo fratello.")
    ~ su(paura, 1)
    Resti lì. Vedi il pompiere arrivare troppo tardi, vedi Nassim sparire dietro gli scudi.
    Il fumo ti chiude gli occhi.
- -> dopo

= dopo
# img: shared/c5_vuota
# ora: 17:52
# fxoff: gas
# amb: sirene
Alle 17:52 la piazza si svuota come una vasca. Restano scarpe spaiate, cartelli, un volantino del 1961 calpestato. Il cassonetto è nero e fuma ancora.
{ d1 == "P":
    Al primo piano, le imposte sono chiuse.
- else:
    La finestra del primo piano è spalancata e buia. Due pompieri della Brigata stanno salendo con la scala.
}
~ calcola_esito()
{ esito == "PACE":
    -> sera_pace
- else:
    -> sera_violenza
}

// =====================================================================
=== sera_pace ===
# capitolo: sera
# ora: 21:00
# img: shared/c6_avicenne
# fxoff
# amb: interno
# incrocio: X13
Ospedale Avicenne, Bobigny. Lo stesso corridoio dove la settimana scorsa hai aspettato notizie di Maëlys: le sedie arancioni, la macchinetta che ruba le monete.
Nassim ha il polso rotto, un taglio sulla fronte, gli occhi ancora rossi di gas. Ma parla, si lamenta, chiede patatine.
È vivo e insopportabile.
{ nassim_sgridato:
    A un certo punto, senza guardarti, dice: «I pompieri. Avevi ragione.» Poi chiede altre patatine, per non dover dire altro.
}

# ---
In fondo al corridoio, con la divisa sporca di fumo, c'è il pompiere. Si chiama Jérôme, ti dice. Ha accompagnato Nassim in ambulanza.
{ scuse_pompiere:
    «Due volte nello stesso giorno, la ragazza con le mani alzate.»
}
«Tuo fratello mi ha tirato un sasso stamattina. L'ho visto, sai.» Una pausa. «Non l'ho messo nel rapporto.»
* [«Grazie. Per lui. E per stamattina.»]
    Lui alza le spalle. «È il mestiere.»
    Poi, guardando il soffitto: «Insomma. È quello che mi dico.»
* [«Perché non l'ha denunciato?»]
    Ci pensa davvero, prima di rispondere.
    «Perché a quindici anni ho fatto di peggio. E perché stasera sono io che l'ho portato in braccio.»
- -> maelys

= maelys
# img: shared/c6_avicenne
# ora: 22:00
Due piani più su c'è ancora Maëlys. Le infermiere ti lasciano salire cinque minuti, perché ti conoscono.
Ha la mascella fasciata e il telefono in mano. Ha visto tutto in diretta.
{ maelys_verita:
    Scrive sul telefono, perché parlare le fa male, e te lo gira: _ti sei fatta vedere. ti ho vista._
- else:
    Scrive sul telefono e te lo gira: _"per dire", eh._ Poi ti stringe la mano, forte, con la mano sana.
}
-> mamma

= mamma
# img: ines/08_mamma
# ora: 22:30
Alle 22:30 arriva la mamma, ancora in camice. Ha attraversato tutto l'ospedale correndo.
{ ha_mentito:
    Ti guarda. Non dice niente della bugia. Non serve.
    Ti abbraccia così forte che il gomito ti fa male, e ti dice all'orecchio: «L'hai tenuto. L'hai tenuto lo stesso.»
- else:
    «Me l'avevi promesso», dice. Poi vede Nassim, il gesso, la faccia gonfia ma viva.
    «L'hai tenuto.» E piange, finalmente, lei che non piange mai.
}
-> notte_pace

= notte_pace
# capitolo: notte
# ora: 02:40
# img: ines/09_camera_notte
# amb: notte
Alle 2:40 non dormi. Nassim russa nel letto accanto, il gesso sul cuscino come un trofeo.
{ video_girato:
    -> video
}
-> lista

= video
Sul telefono hai il video. L'agente, il ginocchio, il numero sul casco. Potresti pubblicarlo adesso e farebbe un milione di visualizzazioni prima dell'alba.
* [Lo pubblichi così com'è.]
    Lo pubblichi. Al mattino ha due milioni di visualizzazioni. Il numero sul casco non è quello di Mehdi: è di un suo collega.
    L'IGPN apre un'inchiesta. Sotto il video, migliaia di commenti: metà vogliono la testa dell'agente, metà la tua. In un fotogramma si vede la faccia di Nassim.
* [Sfochi i volti, anche quello di Nassim, e lo mandi all'avvocata del collettivo.]
    Lo mandi all'avvocata del collettivo, con i volti sfocati. Non diventerà virale. Diventerà, forse, una prova.
    È meno soddisfacente. È più vero.
- -> lista

= lista
# img: ines/02_telefono
# chat: BLOCUS DUMONT ⚡
Inès: lunedì torniamo. senza fuoco.
Inès: 1. supplenti veri 2. il tetto della palestra 3. massimo trenta per classe
Yasmine: e 4. giustizia per maëlys
Inès: e 4. giustizia per maëlys
Bilal: aura +infinito alla delegata
-> epilogo_pace

= epilogo_pace
# /chat
# img: shared/c7_grata_scritta
# ora: domenica
Il giorno dopo, domenica, passi davanti al Dumont. La grata è ancora nera di fumo.
Qualcuno, nella notte, ci ha scritto sopra con lo spray bianco, a lettere enormi:
‹ON EST PAS VOS ENNEMIS=non siamo vostri nemici›.
Non sai chi l'ha scritto. Non sai a chi è rivolto. Lo fotografi lo stesso.
-> END

// =====================================================================
=== sera_violenza ===
# capitolo: sera
# ora: 20:30
# img: shared/c6_commissariato
# fxoff
# amb: interno
Commissariato di Bobigny. Una panca di metallo, una luce che ronza, l'odore di candeggina e di paura.
Ti hanno presa da un video. Nel video si vede tutto: { d1 == "V": la bottiglia che vola verso gli scudi. } { d2 == "V": Il sasso contro il casco. } { d3 == "V": Il pugno a Mehdi. }
Non ricordi di aver deciso niente. Ricordi solo di averlo fatto.
{ nassim_coperto:
    Ti chiedono anche del sasso contro il camion, stamattina. C'è un video anche di quello. Nel video, tu sei davanti a tuo fratello, le braccia larghe.
}
# ---
_Garde à vue_: il fermo. Ventiquattro ore, forse quarantotto. Hai diciassette anni e ti hanno tolto i lacci delle scarpe.

# incrocio: X12
Attraverso la porta senti una voce che conosci, al bancone. È la prof Garnier. Chiede di te, chiede di Nassim, scandisce i vostri nomi come all'appello. Nessuno le risponde.
Un agente passa con un caffè e dice al collega: «Bismillah, è il buio, eh?» Ridono.
{ colpito_mehdi:
    Un terzo agente, più giovane, non ride. Ha un cerotto sul sopracciglio. È Mehdi. Ti guarda attraverso il vetro e non dice niente.
- else:
    Un terzo agente, più giovane, non ride. Guarda il pavimento.
}

# img: ines/10_telefono_commissariato
# ora: 23:00
Alle 23 ti lasciano parlare con la mamma. Due minuti, al telefono del commissariato.
«Nassim è in rianimazione. Trauma cranico. Dicono che se la caverà. Dicono _probabilmente_.»
{ ha_mentito:
    Poi: «Mi avevi detto che restavate nel quartiere.» Non è una domanda. Non c'è una risposta.
- else:
    Poi: «Mi avevi promesso di tenerlo d'occhio.» Non urla. Sarebbe meglio se urlasse.
}
* [«Scusa, mamma.»]
    «Lo so», dice. E riattacca, perché un'infermiera la sta chiamando.
* [«Hanno cominciato loro!»]
    ~ su(rabbia, 1)
    Silenzio.
    «Non me ne frega niente di chi ha cominciato, Inès. Voglio sapere chi finisce.»
- -> notte_violenza

= notte_violenza
# capitolo: notte
# ora: 03:10
# img: ines/11_cella
# amb: notte
Alle tre di notte, nella cella, conti le piastrelle del soffitto. Quarantadue. Una è rotta, come in classe.
Pensi a Maëlys e alla sua mascella. Una settimana fa la vittima era lei, e tu eri quella dalla parte giusta. Adesso non sai più da che parte stai.
{ video_girato:
    Il video dell'agente sopra Nassim è nel tuo telefono, sotto sequestro. Nessuno lo vedrà. O lo vedranno tutti, insieme al tuo.
}

# img: shared/c7_cartello
# ora: domenica
Il giorno dopo, quando esci, la prima cosa che vedi è un'edicola.
In prima pagina c'è una foto di Nation: il fumo, gli scudi e, in basso, calpestato, il tuo cartello. BISMILLAH C'EST LES TÉNÈBRES (ET LE PLAFOND AUSSI).
Il titolo dice: ‹La jeunesse en colère=la gioventù arrabbiata›. Del soffitto, non dice niente.
-> END
