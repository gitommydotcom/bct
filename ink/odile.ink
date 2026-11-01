// =====================================================================
//  ODILE GARNIER — l'insegnante
//  "Ni oubli"
// =====================================================================
INCLUDE comune.ink

VAR mehdi_alba = ""           // nome | mezzo | filmato
VAR chiamata_madre = false
VAR nomi_preside = ""         // dati | rifiutati | mentito
VAR lavagna_titolo = ""
VAR padre_chiesto = false
VAR discorso = ""             // avvertire | accendere | tacere
VAR metro_scelta = ""         // sacha | ines | niente
VAR volantino_mehdi = false
VAR volantino_jerome = false
VAR poesia = ""              // letta | tenuta

~ personaggio = "odile"
~ rabbia = 3
~ paura = 6
~ fiducia = 5
~ responsabilita = 9
-> alba

// =====================================================================
=== alba ===
# capitolo: alba
# ora: 07:05
# img: odile/01_thermos
# amb: sirene
Alle 7:05, all'angolo della rue de la Folie, con un thermos di caffè per il picchetto e la sciarpa verde che ti ha regalato la classe del 2019.
Dal fondo della strada sale un fumo nero. Senti le sirene. Vedi un camion dei pompieri che riparte con il parabrezza in frantumi, e tre furgoni blu che arrivano.
Hai cinquantadue anni, ventiquattro di Dumont. Ti metti a correre lo stesso.

# img: shared/c1_sgombero
# ora: 07:15
# fx: lampeggianti
Davanti alla grata i ragazzi sono seduti per terra, intrecciati. Gli agenti li sollevano uno a uno. Riconosci le felpe, i cappucci, gli zaini: sono i tuoi. La seconda B, la prima A, la quinta di Inès Haddad.
I colleghi del sindacato arrivano alla spicciolata, con le pettorine. Qualcuno ha portato i croissant. È ridicolo e commovente. Come tutta la scuola pubblica.

# ---
Philippe, fisica e chimica, ti passa un caffè. Da settembre fa anche matematica in seconda B, gratis, perché il professore non è mai arrivato.
«Hanno ragione, sai. I ragazzi.» Lo dice come si dice una cosa vietata.
«Lo so. È per questo che ho paura.»

# img: shared/c1_prof_visiera
# ora: 07:35
# incrocio: X04
Un agente sta sollevando un ragazzino per il cappuccio. Il casco, la visiera, il collo. Il collo lo conosci.
Ti avvicini. Lo guardi a lungo. Sotto la visiera c'è un ragazzo che nel 2015 ha preso diciotto in un compito sulla decolonizzazione e non ci credeva.
* [«Mehdi? Mehdi Saïdi?»]
    ~ mehdi_alba = "nome"
    ~ su(fiducia, 1)
    Non risponde. Ma il ragazzino gli scivola dalle mani, e lui non lo riprende.
    «Ti ricordi di me?» Il casco si gira appena. Poi l'ordine di un superiore, e lui si gira davvero. # ricorda: Mehdi se ne ricorderà.
* [Ti metti tra lui e i ragazzi.]
    ~ mehdi_alba = "mezzo"
    ~ su(paura, 1)
    ~ su(responsabilita, 1)
    Ti metti in mezzo, le mani aperte. Lo scudo ti sfiora il petto. «Sono ragazzi. Sono i MIEI alunni.»
    L'agente si ferma. Sotto la visiera, per un secondo, ti sembra di vedere un tuo alunno. Poi non lo vedi più.
* [Tiri fuori il telefono e filmi.]
    ~ mehdi_alba = "filmato"
    ~ su(rabbia, 1)
    Filmi. L'agente si irrigidisce quando vede il telefono. Abbassa la visiera.
    Nel video, più tardi, riconoscerai il suo modo di girare la testa. Lo stesso di quando non sapeva rispondere alle interrogazioni.
- -> genitori

= genitori
# img: shared/c1_grata_vuota
# ora: 07:45
# fxoff
# amb: silenzio
Alle 7:45 la grata è libera. Il liceo è chiuso comunque: primo giorno di vacanza. Avete difeso un edificio vuoto, tutti quanti, da tutte e due le parti.
Inès Haddad ti passa davanti con il fratello per mano. Nassim, seconda B, quindici anni, un ragazzo che scrive poesie e le strappa. Ha le mani nere di fumo.
La loro madre lavora ad Avicenne, turni di notte. Hai il suo numero, dal colloquio di settembre.
* [Chiami la madre.]
    ~ chiamata_madre = true
    ~ su(responsabilita, 1)
    ~ giu(fiducia, 1)
    Risponde al terzo squillo, dalla pausa. Le dici che i ragazzi stanno bene. Le dici del fumo. Non le dici di Nassim e delle sue mani nere.
    «Grazie, professoressa. Grazie di avermelo detto.» Riattacca. Ti chiedi per chi hai chiamato: per lei, per loro o per te.
* [Non chiami nessuno. Sono abbastanza grandi.]
    ~ su(fiducia, 1)
    Non chiami. Hai passato ventiquattro anni a dire ai ragazzi di pensare con la loro testa. Non puoi chiamare la mamma la prima volta che lo fanno.
- -> mattina

// =====================================================================
=== mattina ===
# capitolo: mattina
# ora: 08:30
# img: odile/02_telefono
# amb: interno
# chat: Mme Pasquier (preside)
Mme Pasquier: Odile, buongiorno. Era sul posto stamattina?
Mme Pasquier: Il provveditorato mi chiede l'elenco degli studenti coinvolti nel blocco. Ne ha riconosciuto qualcuno?
Mme Pasquier: È anche per proteggerli, sa.
* [Le mandi tre nomi. I più grandi, quelli che lo sanno già.]
    ~ nomi_preside = "dati"
    ~ giu(fiducia, 2)
    Odile: Inès Haddad (rappresentante), Yasmine Kébé, Bilal Traoré. Erano in prima fila. Senza violenza.
    Mme Pasquier: Grazie Odile. Sapevo di poter contare su di lei.
    _Sapevo di poter contare su di lei._ La frase ti resta addosso tutta la mattina, come l'odore del fumo.
* [Rifiuti.]
    ~ nomi_preside = "rifiutati"
    ~ su(rabbia, 1)
    ~ su(fiducia, 1)
    Odile: Non sono un'ausiliaria di polizia, signora preside. Sono una professoressa di storia.
    Mme Pasquier: Ne prendo nota.
    Tre parole. Sai esattamente cosa vogliono dire in un'amministrazione.
* [Menti: «Non ho visto nessuno, c'era troppo fumo.»]
    ~ nomi_preside = "mentito"
    ~ su(paura, 1)
    Odile: Sono arrivata tardi, c'era troppo fumo. Non ho riconosciuto nessuno.
    Mme Pasquier: Peccato.
    Hai mentito alla tua preside per proteggere tre ragazzi. A diciassette anni avresti trovato la cosa eroica. A cinquantadue la trovi solo necessaria.
- -> aula

= aula
# /chat
# img: odile/03_aula
# ora: 09:30
Vai al liceo lo stesso: il bidello ti apre la porta di servizio. Aula 204. Trentacinque sedie per trenta metri quadri. Una macchia d'umido a forma di Africa sul soffitto.
Prendi il gesso. Lunedì, dopo le vacanze, dovrai fare lezione. Ma quale lezione, dopo una giornata come questa?
Scrivi il titolo.
* [«17 ottobre 1961»]
    ~ lavagna_titolo = "1961"
    17 OCTOBRE 1961 # lavagna: 17 OCTOBRE 1961
* [«Chi ha il diritto di manifestare?»]
    ~ lavagna_titolo = "diritto"
    ~ su(fiducia, 1)
    ‹Qui a le droit de manifester ?=Chi ha il diritto di manifestare?› # lavagna: Qui a le droit de manifester ?
* [«Memoria»]
    ~ lavagna_titolo = "memoria"
    ‹Mémoire=Memoria› # lavagna: MÉMOIRE
- Sotto, una parola. Quella che vuoi che rimanga.
* [«Testimoniare»]
    ~ su(responsabilita, 1)
    ‹— témoigner=testimoniare› # lavagna: — témoigner
* [«Disobbedire»]
    ~ su(rabbia, 1)
    ‹— désobéir=disobbedire› # lavagna: — désobéir
* [«Tacere»]
    ~ su(paura, 1)
    ‹— se taire (?)=tacere (?)› # lavagna: — se taire (?)
- E un'ultima riga, per te.
* [«E noi?»]
    ~ su(fiducia, 1)
    ‹Et nous ?=E noi?› # lavagna: Et nous ?
* [«Mio padre.»]
    ~ su(paura, 1)
    ‹Mon père.=Mio padre.› # lavagna: Mon père.
    La cancelli subito con il palmo. Resta un alone bianco che nessuno saprà leggere.
- Guardi la lavagna a lungo. Poi chiudi l'aula a chiave e vai a Vincennes.
-> ehpad

= ehpad
# img: odile/04_ehpad
# ora: 10:30
# amb: interno
EHPAD Les Tilleuls, Vincennes. A quindici minuti a piedi da place de la Nation. Tuo padre, Lucien, ottantotto anni, guarda la finestra.
Era agente di polizia, un _gardien de la paix_. Nel 1961 aveva ventitré anni. Non ti ha mai detto dov'era la notte del 17 ottobre. Tu insegni quella notte da vent'anni e non l'hai mai detto ai tuoi alunni.
«Odile? Sei tu? C'è rumore fuori.» Oggi è un giorno buono, quasi.
* [Gli chiedi di quella notte.]
    ~ padre_chiesto = true
    ~ su(paura, 1)
    «Papà. Il 17 ottobre 1961. Tu dov'eri?»
    Lui guarda la finestra per un minuto intero. «Pioveva. Avevamo degli ordini. Il ponte…» Si ferma. «Io non ho buttato niente. Io non ho buttato niente.»
    Poi ti chiede se hai mangiato. Non saprai mai se quell'_io_ era una difesa o una confessione. # ricorda: Tuo padre se ne ricorderà, forse.
* [Gli tieni la mano e non chiedi niente.]
    ~ su(fiducia, 1)
    Gli tieni la mano. È leggera, una mano di carta. Fuori passano i primi gruppi diretti a Nation, con le bandiere.
    «Cosa vogliono?» «Professori, papà. Soffitti.» «Ah.» Sorride. «Fanno bene.»
- -> nation_mattina

= nation_mattina
# img: shared/c5_cassonetto
# ora: 11:15
# amb: sirene
Per tornare passi da place de la Nation. È ancora vuota: transenne, furgoni, agenti che fumano seduti sui paraurti. Si preparano come ci si prepara a una partita.
All'angolo del cours de Vincennes, sopra una farmacia, una signora anziana annaffia i gerani al primo piano. Ti saluta con la mano, come si saluta chiunque passi.
Ricambi. Non sai perché te la ricorderai. Le cose che ricordi non chiedono mai il permesso.
-> mezzogiorno

// =====================================================================
=== mezzogiorno ===
# capitolo: mezzogiorno
# ora: 11:50
# img: shared/c3_assemblea
# amb: folla
L'assemblea nel cortiletto dietro la palestra. Il tetto puntellato, la cassa, le _battle d'aura_. Sacha Lemaire sul muretto, il tuo alunno del 2021: _chi vuole farsi vedere, viene con noi_.
Poi parla Inès. Poi, inaspettatamente, Bilal grida: «Prof Garnier! Parli lei!» E tutti: «Gar-nier! Gar-nier!»
Sali sul muretto. Duecento facce. Ne conosci centoquaranta.
* [Racconti il 1961 per mettere in guardia.]
    ~ discorso = "avvertire"
    ~ su(fiducia, 1)
    «Sessantacinque anni fa, oggi, degli algerini hanno manifestato pacificamente a Parigi. In centinaia sono morti. Buttati nella Senna.»
    «Non ve lo dico per farvi paura. Ve lo dico perché erano pacifici, ed è proprio questo che si è voluto cancellare. Siate pacifici. E siate tanti. Centomila persone non le butti nella Senna.»
* [Lo racconti per accendere.]
    ~ discorso = "accendere"
    ~ su(rabbia, 2)
    «Sessantacinque anni fa, oggi, la polizia di Parigi ha buttato dei manifestanti nella Senna. E per quarant'anni lo Stato ha detto che non era successo niente.»
    «Quindi quando vi dicono di stare calmi, chiedetevi chi ve lo dice.» Il cortile esplode. Sacha ti guarda come si guarda un'alleata. Non era quello che volevi. O forse sì.
* [Non parli. «È la vostra giornata.»]
    ~ discorso = "tacere"
    ~ su(fiducia, 1)
    ~ giu(responsabilita, 1)
    «No. È la vostra giornata, non la mia. Io vi seguo.» Scendi dal muretto tra i fischi affettuosi.
    È la cosa più difficile che hai fatto in ventiquattro anni: stare zitta davanti a una classe.
- -> poesia_nassim

= poesia_nassim
# img: shared/c3_assemblea
# ora: 12:40
Mentre scendi dal muretto, Nassim Haddad ti si para davanti e ti mette in mano un foglio a quadretti piegato in otto. «È per lei. Non lo legga adesso.»
È una poesia. Lo sai dalla forma delle righe. Nassim scrive poesie e le strappa; questa non l'ha strappata.
* [La leggi subito, appena lui si gira.]
    ~ poesia = "letta"
    ~ su(responsabilita, 1)
    ‹Ils disent c'est les ténèbres / mais c'est juste le plafond qui tombe / et nous dessous qui faisons semblant / de pas avoir peur du noir.=Dicono che è il buio / ma è solo il soffitto che cade / e noi sotto, a fare finta / di non avere paura del buio.›
    La rileggi tre volte. È la cosa più bella che ti abbiano dato in ventiquattro anni, dopo la sciarpa verde.
* [La metti nella borsa, per dopo.]
    ~ poesia = "tenuta"
    La metti nella borsa, tra il quaderno dei voti e i volantini. Per dopo. Il dopo, a scuola, è sempre lunedì.
- -> metro

= metro
# img: shared/c3_metro
# ora: 13:10
# amb: metro
# incrocio: X06
Linea 5. Nel vagone accanto al tuo, attraverso il vetro della porta di comunicazione, vedi Sacha Lemaire passare qualcosa di nero a Nassim Haddad. Un passamontagna. Nassim se lo ficca in tasca.
Sacha era bravo in storia. Odiava le date e amava le cause.
* [Attraversi il vagone e vai a parlare a Sacha.]
    ~ metro_scelta = "sacha"
    ~ su(responsabilita, 1)
    «Sacha. Ha quindici anni.» Sacha ti guarda come si guarda una prof: con l'affetto di chi non deve più obbedirle. «È per il gas, prof. Solo per il gas.»
    «Anche nel 1961 avevano i fazzoletti per il gas.» Non risponde. Ma per tutto il viaggio tiene Nassim vicino.
* [Lo dici a Inès.]
    ~ metro_scelta = "ines"
    ~ giu(responsabilita, 1)
    Lo dici a Inès, piano. Lei attraversa il vagone come un temporale e gli strappa il passamontagna dalla tasca. Nassim scende a République senza parlarle.
    Hai delegato. A una ragazza di diciassette anni. Ti dici che è sua sorella. Ti dici molte cose.
* [Fai finta di niente.]
    ~ metro_scelta = "niente"
    ~ su(paura, 1)
    Guardi altrove. Le pubblicità di un'agenzia di viaggi: Marrakech, Lisbona, Napoli. Sono le vacanze di Toussaint, dopotutto.
- -> pomeriggio

// =====================================================================
=== pomeriggio ===
# capitolo: pomeriggio
# ora: 14:20
# img: shared/c4_republique
# amb: folla
République. Gilet gialli, sindacati, infermiere, universitari. I colleghi del sindacato con lo striscione ‹PROFS AVEC VOUS=i prof con voi›. Hai trecento volantini nello zaino, fotocopiati di nascosto in sala professori: _17 OCTOBRE 1961 — 17 OCTOBRE 2026_.
Ti senti ridicola e necessaria. È la sensazione abituale del tuo mestiere.

# ---
# ora: 14:50
Davanti a te i tuoi ragazzi gridano al megafono: «BIS-MIL-LAH!» E duecento voci: «C'EST LES TÉ-NÈ-BRES!» _In nome di Dio, è il buio._
Una signora della CGT ti chiede cosa vuol dire. «Niente, signora. È per questo che fa ridere. Hanno preso la frase di un poliziotto che li prendeva in giro e ne hanno fatto una canzone.»
La signora ci pensa. «Allora vuol dire qualcosa.» Ha ragione. Ti appunti la frase per lunedì.

# img: shared/c4_applausi
# ora: 15:20
# incrocio: X07
Sul boulevard Voltaire un applauso enorme: passano i pompieri in sciopero, in divisa. I tuoi ragazzi impazziscono. Inès ride con un pompiere che ha un graffio bianco sul casco.
Tu applaudi più piano. Pensi a una cosa che hai letto negli archivi: la notte del 17 ottobre 1961, i pompieri di Parigi hanno ripescato corpi dalla Senna per giorni.

# img: shared/c4_volantino
# ora: 15:40
# incrocio: X08
Distribuisci i volantini. A Inès: «Te lo ricordi?» Al pompiere con il casco graffiato.
* [Al pompiere racconti dei corpi nella Senna.]
    ~ volantino_jerome = true
    ~ su(fiducia, 1)
    «Quella notte i pompieri hanno ripescato corpi nella Senna per giorni. Loro sapevano.» Lui piega il volantino e lo mette nel taschino, accanto a una foto di bambina.
* [Gli dai il volantino e passi oltre.]
    Lui lo prende con un sorriso stanco e lo passa a un collega giovane che zoppica. Il ragazzo lo legge muovendo le labbra.
- Poi ti giri verso il cordone, ai lati del corteo. Un agente giovane ha la visiera alzata. Lo riconosci anche da qui: Mehdi.
{ mehdi_alba == "nome":
    Anche lui ti riconosce. Stamattina hai detto il suo nome davanti a tutti.
}
* [Gli tendi un volantino e aspetti, con la mano ferma.]
    ~ volantino_mehdi = true
    ~ su(fiducia, 1)
    Aspetti. Il braccio teso, il foglio che trema nel vento. I colleghi di Mehdi guardano lui, poi te.
    Mehdi prende il volantino. Lo infila nel giubbotto senza leggerlo. Non vi dite niente. # ricorda: Mehdi ha il tuo volantino.
* [Glielo tendi, poi ritiri la mano.]
    ~ su(rabbia, 1)
    Glielo tendi. Lui non si muove. Ritiri la mano prima che la scena diventi umiliante, per tutti e due.
- -> scontro

// =====================================================================
=== scontro ===
# capitolo: scontro
# ora: 17:20
# img: shared/c5_nation
# amb: sirene
Place de la Nation. Sei arrivata con la coda del corteo, insieme ai tuoi colleghi. Ma i tuoi ragazzi no: i tuoi ragazzi sono più avanti, verso la testa, verso il cours de Vincennes.
Conti le teste che conosci. Ne trovi sette. Bilal, Yasmine, Inès. Nassim no.
{ metro_scelta:
- "sacha": Poi lo vedi: in testa, attaccato al gomito di Sacha. Sacha si gira, ti vede, ti fa un cenno. _Ci penso io._ Non sai se crederci. Ci credi un po'.
- "ines": Inès lo cerca con gli occhi, disperata. Da République non le parla più. Per colpa del passamontagna che gli ha strappato. Per colpa tua.
- "niente": Lo vedi, in testa, con il passamontagna nero sulla faccia. Quello che hai visto passare in metro, e hai fatto finta di niente.
    ~ su(paura, 1)
}
{ discorso == "accendere":
    Qualcuno grida: «Chi vi dice di stare calmi?» Sono parole tue. Dette in un cortile, a mezzogiorno, sembravano storia. Qui sembrano un ordine.
    ~ su(rabbia, 1)
}

# img: shared/c5_gas
# ora: 17:26
# sfx: lacrimogeno
# fx: gas
Il gas. A cinquantadue anni il gas lacrimogeno non è un'avventura. È un'aggressione ai polmoni di una donna che ha l'asma da bambina.
Ti metti la sciarpa verde sulla bocca. Non serve a niente. Tieni gli occhi aperti lo stesso: devi contare.

# img: shared/c5_cassonetto
# ora: 17:37
# fx: fumo
# amb: fuoco
# incrocio: X09
All'angolo del cours de Vincennes un cassonetto prende fuoco sotto un palazzo. Al primo piano una donna della tua età, forse più vecchia, alla finestra.
E i tuoi ragazzi, Bilal, Yasmine e altri cinque, stanno andando verso il fuoco. Verso la testa. Verso gli scudi che si muovono.
Bilal si gira e ti vede. «Prof! Venga!» # timer: 9
* [Li richiami e li porti indietro per il cours de Vincennes.]
    ~ decisiva(1, "P", "Hai riportato indietro i tuoi alunni, lontano dal fuoco e dagli scudi.")
    ~ su(responsabilita, 1)
    «BILAL! YASMINE! Con me! Subito!» La voce da interrogazione, quella che non usi mai. Funziona. Ti seguono, controvoglia, tenendosi per le felpe.
    Li porti via dal palazzo, dalla carica, verso una via laterale. Sette su sette. Nassim non c'è.
* [Vai con loro, in prima fila, a gridare.]
    ~ decisiva(1, "V", "Hai portato i tuoi alunni in prima fila, contro gli scudi.")
    ~ su(rabbia, 2)
    Vai con loro. Davanti. Gridi con loro, la sciarpa verde alzata come una bandiera. «‹Ni oubli! Ni pardon!=né oblio, né perdono›»
    Per un minuto ti senti giovane e giusta. I ragazzi, vedendoti lì, non indietreggiano più. Nessuno di loro. È quello che hai voluto, e non è quello che volevi.
* [Resti ferma. # timeout]
    ~ decisiva(1, "F", "Sei rimasta ferma mentre i tuoi alunni andavano verso il fuoco.")
    ~ su(paura, 1)
    Il gas, l'asma, le gambe. Resti ferma. I tuoi ragazzi si allontanano verso il fuoco senza di te.
- -> carica

= carica
# img: shared/c5_carica
# ora: 17:39
# sfx: colpo
La carica. Gli scudi avanzano, la folla si rovescia. Qualcuno ti spinge, perdi la sciarpa, la vedi sparire sotto le scarpe.
# sfx: granata
# flash
Un mortaio esplode contro gli scudi in scintille verdi. Il volantino del 1961 vola via da una tasca, da molte tasche.

# img: shared/c5_granata
# ora: 17:42
# sfx: granata
# flash
# incrocio: X10
La granata rotola tra le scarpe ed esplode. Il mondo diventa un fischio.
Quando torna, vicino al cassonetto in fiamme c'è un ragazzo a terra. Felpa grigia. Nassim Haddad, seconda B, quello che scrive poesie e le strappa. Sopra di lui, un casco. # timer: 8
* { paura < 8 } [Corri da lui.]
    ~ decisiva(2, "P", "Sei corsa da Nassim, a cinquantadue anni, nel gas.")
    ~ su(responsabilita, 1)
    Corri. Non corri da trent'anni. Corri come si corre nei sogni, piano e con tutto il corpo. Arrivi. Ti inginocchi accanto a lui.
    «Nassim. Sono la prof Garnier. Respira.» Lui apre un occhio. «Prof… lunedì c'è lezione?»
    { poesia == "letta": «Sì. E mi leggerai la tua poesia ad alta voce.» Lui sorride, con il sangue sui denti. «Neanche per sogno.» }
* { paura >= 8 } [Corri da lui. # locked: le gambe non ti reggono più]
    -> mano
* [Spingi via l'agente con tutte e due le mani.]
    ~ decisiva(2, "V", "Hai spinto via l'agente che stava sopra Nassim.")
    ~ su(rabbia, 2)
    # sfx: colpo
    Lo spingi con tutte e due le mani, come si spinge una porta che non vuole aprirsi. L'agente perde l'equilibrio. Il suo collega si gira verso di te con il manganello alzato.
    Il colpo ti prende al braccio. Senti l'osso. Non lo senti. Lo sentirai stanotte.
* [Resti ferma. # timeout]
    ~ decisiva(2, "F", "Sei rimasta ferma mentre Nassim era a terra.")
    ~ su(paura, 1)
    Resti ferma. Hai ventiquattro anni di lezioni sulla resistenza e non riesci a fare un passo.
- -> mano

= mano
# img: shared/c5_mano
# ora: 17:44
# fx: fumo
# incrocio: X11
L'agente solleva Nassim per il cappuccio e lo trascina verso il cordone. Si gira. È Mehdi.
{ volantino_mehdi:
    Dal giubbotto gli spunta un angolo di carta bianca. Il tuo volantino.
}
{ volantino_jerome:
    Nel fumo si fa largo un pompiere in divisa: è quello del taschino, quello dei corpi nella Senna. Urla «POMPIERE!». # timer: 8
- else:
    Nel fumo, un pompiere in divisa si fa largo urlando «POMPIERE!». # timer: 8
}
* { fiducia >= 4 } [«Mehdi. Il 17 ottobre. Ti ricordi cosa abbiamo studiato?»]
    ~ decisiva(3, "P", "Hai ricordato a Mehdi la lezione sul 17 ottobre.")
    Mehdi si blocca. Sotto la visiera, gli occhi di un ragazzo di sedici anni seduto in terza fila, aula 204, che prende diciotto e non ci crede.
    «Prof…» Solo questo. Poi molla il cappuccio. Il pompiere si inginocchia su Nassim. Mehdi resta lì, in piedi, con le mani vuote.
* { fiducia < 4 } [«Mehdi. Il 17 ottobre. Ti ricordi cosa abbiamo studiato?» # locked: non credi più che le lezioni servano a qualcosa]
    -> dopo
* [Gli strappi lo scudo.]
    ~ decisiva(3, "V", "Hai strappato lo scudo a Mehdi.")
    ~ su(rabbia, 2)
    # sfx: colpo
    Afferri il bordo dello scudo e tiri. Mehdi lo molla per sorpresa, e lo scudo ti cade sui piedi. Per un secondo siete due persone disarmate.
    Poi altri due agenti ti prendono per le braccia. Una donna di cinquantadue anni piegata a terra davanti a cento telefoni.
* [Lasci fare e prendi i nomi dei testimoni.]
    ~ decisiva(3, "P", "Hai raccolto i nomi dei testimoni, invece di intervenire.")
    ~ su(responsabilita, 1)
    Tiri fuori il quaderno dei voti dalla borsa. È l'unica cosa che hai. «Ha visto? Il suo nome. Il suo telefono.» Li scrivi tutti: un ragazzo, una nonna, un infermiere.
    Mehdi porta via Nassim. Il pompiere lo raggiunge dietro gli scudi. Il tuo quaderno è pieno di nomi. È così che si scrive la storia, ti dici. Di solito dopo.
* [Resti ferma. # timeout]
    ~ decisiva(3, "F", "Sei rimasta ferma mentre Mehdi portava via Nassim.")
    ~ su(paura, 1)
    Non ti muovi. Mehdi porta via Nassim. Tu guardi, come si guarda un documentario che si conosce già.
- -> dopo

= dopo
# img: shared/c5_vuota
# ora: 17:52
# fxoff: gas
# amb: sirene
Alle 17:52 la piazza si svuota. Scarpe spaiate, cartelli, i tuoi volantini calpestati a centinaia. _17 ottobre 1961_, sotto le suole.
{ d1 == "P":
    I tuoi sette sono con te, in una via laterale, tossendo. Yasmine piange. Bilal ride. Sono vivi tutti e sette.
- else:
    Conti. Sei. Yasmine non c'è.
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
# ora: 20:30
# img: odile/05_bancone
# fxoff
# amb: interno
# incrocio: X12
Commissariato del 12°. Sei venuta a cercare i tuoi alunni fermati: ne hai contati quattro, sui social. Al bancone, dietro il vetro, c'è Mehdi. Senza casco, ha la faccia di un ragazzo stanco.
«Prof Garnier.» Lo dice prima di te.
Gli dici i nomi uno per uno, come all'appello. Lui li cerca sullo schermo. Due li fanno uscire subito. Due resteranno la notte.
{ nomi_preside == "dati":
    Uno dei due è Bilal Traoré. Il suo nome, stamattina, l'hai scritto tu alla preside. Non c'entra niente. Ti sembra che c'entri tutto.
}

* [«Grazie, Mehdi.»]
    Lui annuisce. Poi, a bassa voce, senza guardarti: «Il piccolo Haddad. È ad Avicenne. Polso rotto. L'ha portato il pompiere.»
    { volantino_mehdi: Tira fuori dal giubbotto il tuo volantino, piegato. «L'ho letto, prof. Sul furgone.» }
* [«E tu dov'eri, oggi? Davvero?»]
    ~ su(rabbia, 1)
    Mehdi ti guarda a lungo. «Ero dove mi hanno messo, prof. Come lei.» Poi: «Il piccolo Haddad è ad Avicenne. Sta bene.»
    È la risposta più onesta che tu abbia sentito oggi. Non ti piace per niente.
- -> telefonata

= telefonata
# img: odile/02_telefono
# ora: 22:10
Il telefono. L'EHPAD di Vincennes. Tuo padre si è agitato, ha sentito le sirene tutta la sera. Chiede di te.
{ padre_chiesto:
    L'infermiera dice che ripete una frase: _Io non ho buttato niente. Diglielo, che non ho buttato niente._
- else:
    L'infermiera dice che ha chiesto se i ragazzi hanno avuto i loro soffitti.
}
Vai. A piedi, attraverso la piazza vuota. Gli tieni la mano fino a quando si addormenta.
{ chiamata_madre:
    -> madre_haddad
}
-> notte_pace

= madre_haddad
# img: odile/02_telefono
# ora: 23:30
Uscendo dall'EHPAD, un messaggio vocale. È la madre di Inès e Nassim, da Avicenne, la voce stanca di dodici ore.
_Prof Garnier. Sono la mamma di Nassim. Mi ha chiamata stamattina. Nessun altro mi ha chiamata, stamattina. Grazie._
La riascolti due volte sul marciapiede, sotto le finestre spente. Ti chiedi ancora per chi l'hai chiamata. Adesso hai una risposta.
-> notte_pace

= notte_pace
# capitolo: notte
# ora: 00:10
# img: odile/06_pont
# amb: notte
A mezzanotte e dieci sei sul ponte Saint-Michel. Ci sono già altre persone: una ragazza con un cartello scritto a mano, un uomo anziano con il cappello, una coppia che non parla. Sessantacinque anni, oggi.
Lasci cadere un garofano nella Senna. Per il 1961. Per oggi. Per tuo padre, che forse era qui, forse no.
Il garofano gira su se stesso e se ne va con la corrente, verso il mare, come tutte le cose che non si possono dire.

# img: odile/07_aula_dopo
# ora: lunedì
Lunedì 2 novembre, alle 7:50, entri nell'aula 204 prima degli alunni.
Sulla lavagna, sotto le tue parole di sabato, qualcuno ha scritto con una calligrafia storta che conosci: ‹17 OCTOBRE 2026 : NOUS AUSSI ON S'EN SOUVIENDRA.=17 ottobre 2026: anche noi ce ne ricorderemo.›
E sotto, più piccolo: ‹(et merci madame)=e grazie prof›.
{ lavagna_titolo:
- "diritto": Accanto alla tua domanda, _Qui a le droit de manifester ?_, qualcuno ha disegnato una freccia e ha scritto: ‹nous.=noi.›
- "memoria": Accanto a _MÉMOIRE_, qualcuno ha aggiunto una s, poi l'ha cancellata, poi l'ha riscritta. ‹MÉMOIRES.=memorie, al plurale.›
- else: Accanto alla data del 1961, qualcuno ha scritto la stessa data con un altro anno. Le due righe si guardano come in uno specchio.
}
-> END

// =====================================================================
=== sera_violenza ===
# capitolo: sera
# ora: 20:30
# img: shared/c6_commissariato
# fxoff
# amb: interno
# incrocio: X12
Commissariato del 12°. Non sei venuta a cercare i tuoi alunni: sei venuta in furgone, con le fascette ai polsi. Il braccio ti fa un male da urlo.
Al bancone c'è Mehdi. Ti guarda entrare. Scrive il tuo nome sullo schermo, lettera per lettera, senza alzare gli occhi. G-A-R-N-I-E-R.
{ d1 == "V":
    Yasmine Kébé, diciassette anni, quinta, è ad Avicenne con un braccio rotto. Era in prima fila. Era in prima fila perché c'eri tu.
- else:
    Hai saputo da un'agente che ti ha portato un bicchiere d'acqua: Nassim Haddad è in rianimazione. Trauma cranico.
}

# img: odile/02_telefono
# chat: Mme Pasquier (preside)
# ora: 23:00
Mme Pasquier: Odile. Il provveditorato ha visto i video.
Mme Pasquier: Un'insegnante in prima linea con degli studenti minorenni. Si rende conto.
{ chiamata_madre:
    Mme Pasquier: Mi ha chiamata la madre degli Haddad. Dice che lei l'aveva avvisata stamattina. Non la aiuterà, ma volevo che lo sapesse.
}
{ nomi_preside == "dati":
    Mme Pasquier: Ho già trasmesso i nomi che mi ha dato stamattina. Ora c'è anche il suo.
- else:
    Mme Pasquier: Ho dovuto trasmettere un elenco. Il suo nome è il primo.
}
* [Non rispondi.]
    Non rispondi. Lasci il telefono a faccia in giù sulla panca. La panca è fredda come una lavagna.
* [«Ho fatto quello che insegno.»]
    ~ su(rabbia, 1)
    Odile: Ho fatto quello che insegno.
    Mme Pasquier: No, Odile. Lei insegna la storia. Oggi l'ha fabbricata. Non è la stessa cosa.
- -> notte_violenza

= notte_violenza
# /chat
# capitolo: notte
# ora: 04:00
# img: odile/08_cella
# amb: notte
Alle quattro di notte, nella cella, pensi a una data. Non il 1961: il 2015. Mehdi Saïdi in terza fila che prende diciotto. Tu che gli dici _vedi che ce la fai_.
Pensi a cosa hai insegnato a quel ragazzo, e a Yasmine, e a Nassim. Che la storia la fanno quelli che stanno davanti. Non hai mai detto chi raccoglie i pezzi.

# img: shared/c6_commissariato
# ora: 05:30
Alle cinque e mezza arriva Philippe, il collega di fisica, con l'avvocata del sindacato e un termos di caffè. Ha guidato da Montreuil nel buio.
«Lo sai che finirai davanti al consiglio di disciplina.» «Lo so.» «Lo sai che testimonierò per te.» Non lo sapevi.
{ poesia == "tenuta":
    Nella borsa che ti restituiscono c'è ancora il foglio di Nassim, piegato in otto. Lo apri. ‹Ils disent c'est les ténèbres / mais c'est juste le plafond qui tombe.=Dicono che è il buio / ma è solo il soffitto che cade.› Nassim è in ospedale. Lo leggi troppo tardi, come tutto oggi.
}

# img: odile/09_ehpad_mattina
# ora: domenica
Il giorno dopo, quando ti rilasciano, vai direttamente all'EHPAD, con il braccio fasciato.
Tuo padre è lucido. Succede, a volte, per un minuto. Ti guarda il braccio. «Sono stati loro?» Annuisci.
«Ero sul ponte, nel '61», dice. «Tenevo le braccia. Altri buttavano. Io tenevo le braccia.» Poi chiede se hai mangiato.
È troppo tardi per qualsiasi cosa. Lo sai. Gli tieni la mano lo stesso.
-> END
