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
Davanti alla grata i ragazzi sono seduti per terra, intrecciati. Gli agenti li sollevano uno a uno. Riconosci le felpe, i cappucci, gli zaini: sono i tuoi. Seconde B, prima A, la terminale di Inès Haddad.
I colleghi del sindacato arrivano alla spicciolata, con le pettorine. Qualcuno ha portato i croissant. È ridicolo e commovente. Come tutta la scuola pubblica.

# ---
Philippe, fisica e chimica, ti passa un caffè. Da settembre fa anche matematica in seconde B, gratis, perché il professore non è mai arrivato.
« Ils ont raison, tu sais. Les gamins. » Lo dice come si dice una cosa vietata.
« Je sais. C'est pour ça que j'ai peur. »

# img: shared/c1_prof_visiera
# ora: 07:35
# incrocio: X04
Un agente sta sollevando un ragazzino per il cappuccio. Il casco, la visiera, il collo. Il collo lo conosci.
Ti avvicini. Lo guardi a lungo. Sotto la visiera c'è un ragazzo che nel 2015 ha preso diciotto in un compito sulla decolonizzazione e non ci credeva.
* [« Mehdi ? Mehdi Saïdi ? »]
    ~ mehdi_alba = "nome"
    ~ su(fiducia, 1)
    Non risponde. Ma il ragazzino gli scivola dalle mani, e lui non lo riprende.
    « Tu te souviens de moi ? » Il casco si gira appena. Poi l'ordine di un superiore, e lui si gira davvero. # ricorda: Mehdi se ne ricorderà.
* [Ti metti tra lui e i ragazzi.]
    ~ mehdi_alba = "mezzo"
    ~ su(paura, 1)
    ~ su(responsabilita, 1)
    Ti metti in mezzo, le mani aperte. Lo scudo ti sfiora il petto. « Ce sont des enfants. Ce sont MES élèves. »
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
Inès Haddad ti passa davanti con il fratello per mano. Nassim, seconde B, quindici anni, un ragazzo che scrive poesie e le strappa. Ha le mani nere di fumo.
La loro madre lavora ad Avicenne, turni di notte. Hai il suo numero, dal colloquio di settembre.
* [Chiami la madre.]
    ~ chiamata_madre = true
    ~ su(responsabilita, 1)
    ~ giu(fiducia, 1)
    Risponde al terzo squillo, dalla pausa. Le dici che i ragazzi stanno bene. Le dici del fumo. Non le dici di Nassim e delle sue mani nere.
    « Merci, madame. Merci de me dire. » Riattacca. Ti chiedi per chi hai chiamato: per lei, per loro o per te.
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
# chat: Mme Pasquier (proviseure)
Mme Pasquier: Odile, bonjour. Vous étiez sur place ce matin ?
Mme Pasquier: Le rectorat me demande la liste des élèves impliqués dans le blocage. Vous en avez reconnu ?
Mme Pasquier: C'est pour leur protection aussi, vous savez.
* [Le mandi tre nomi. I più grandi, quelli che lo sanno già.]
    ~ nomi_preside = "dati"
    ~ giu(fiducia, 2)
    Odile: Inès Haddad (déléguée), Yasmine Kébé, Bilal Traoré. Ils étaient au premier rang. Sans violence.
    Mme Pasquier: Merci Odile. Je savais que je pouvais compter sur vous.
    _Je savais que je pouvais compter sur vous._ La frase ti resta addosso tutta la mattina, come l'odore del fumo.
* [Rifiuti.]
    ~ nomi_preside = "rifiutati"
    ~ su(rabbia, 1)
    ~ su(fiducia, 1)
    Odile: Je ne suis pas une auxiliaire de police, Mme Pasquier. Je suis professeure d'histoire.
    Mme Pasquier: Je note.
    Due parole. Sai esattamente cosa vogliono dire in un'amministrazione.
* [Menti: « Je n'ai vu personne, il y avait trop de fumée. »]
    ~ nomi_preside = "mentito"
    ~ su(paura, 1)
    Odile: Je suis arrivée tard, il y avait trop de fumée. Je n'ai reconnu personne.
    Mme Pasquier: Dommage.
    Hai mentito alla tua preside per proteggere tre ragazzi. A diciassette anni avresti trovato la cosa eroica. A cinquantadue la trovi solo necessaria.
- -> aula

= aula
# /chat
# img: odile/03_aula
# ora: 09:30
Vai al liceo lo stesso: il bidello ti apre la porta di servizio. Aula 204. Trentacinque sedie per trenta metri quadri. Una macchia d'umido a forma di Africa sul soffitto.
Prendi il gesso. Lunedì, dopo le vacanze, dovrai fare lezione. Ma quale lezione, dopo una giornata come questa?
Scrivi il titolo.
* [« 17 octobre 1961 »]
    ~ lavagna_titolo = "1961"
    17 OCTOBRE 1961 # lavagna: 17 OCTOBRE 1961
* [« Qui a le droit de manifester ? »]
    ~ lavagna_titolo = "diritto"
    ~ su(fiducia, 1)
    Qui a le droit de manifester ? # lavagna: Qui a le droit de manifester ?
* [« Mémoire »]
    ~ lavagna_titolo = "memoria"
    Mémoire # lavagna: MÉMOIRE
- Sotto, una parola. Quella che vuoi che rimanga.
* [« Témoigner »]
    ~ su(responsabilita, 1)
    — témoigner # lavagna: — témoigner
* [« Désobéir »]
    ~ su(rabbia, 1)
    — désobéir # lavagna: — désobéir
* [« Se taire »]
    ~ su(paura, 1)
    — se taire (?) # lavagna: — se taire (?)
- E un'ultima riga, per te.
* [« Et nous ? »]
    ~ su(fiducia, 1)
    Et nous ? # lavagna: Et nous ?
* [« Mon père. »]
    ~ su(paura, 1)
    Mon père. # lavagna: Mon père.
    La cancelli subito con il palmo. Resta un alone bianco che nessuno saprà leggere.
- Guardi la lavagna a lungo. Poi chiudi l'aula a chiave e vai a Vincennes.
-> ehpad

= ehpad
# img: odile/04_ehpad
# ora: 10:30
# amb: interno
EHPAD Les Tilleuls, Vincennes. A quindici minuti a piedi da place de la Nation. Tuo padre, Lucien, ottantotto anni, guarda la finestra.
Era guardiano della pace. Nel 1961 aveva ventitré anni. Non ti ha mai detto dov'era la notte del 17 ottobre. Tu insegni quella notte da vent'anni e non l'hai mai detto ai tuoi alunni.
« Odile ? C'est toi ? Il y a du bruit dehors. » Oggi è un giorno buono, quasi.
* [Gli chiedi di quella notte.]
    ~ padre_chiesto = true
    ~ su(paura, 1)
    « Papa. Le 17 octobre 1961. Tu étais où ? »
    Lui guarda la finestra per un minuto intero. « Il pleuvait. On avait des ordres. Le pont… » Si ferma. « Moi j'ai rien jeté. J'ai rien jeté, moi. »
    Poi ti chiede se hai mangiato. Non saprai mai se _moi_ era una difesa o una confessione. # ricorda: Tuo padre se ne ricorderà, forse.
* [Gli tieni la mano e non chiedi niente.]
    ~ su(fiducia, 1)
    Gli tieni la mano. È leggera, una mano di carta. Fuori passano i primi gruppi diretti a Nation, con le bandiere.
    « Qu'est-ce qu'ils veulent ? » « Des profs, papa. Des plafonds. » « Ah. » Sorride. « C'est bien. »
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
L'assemblea nel cortiletto dietro la palestra. Il tetto puntellato, la cassa, le _battles d'aura_. Sacha Lemaire sul muretto, il tuo alunno del 2021: _qui veut être vu, vient avec nous_.
Poi parla Inès. Poi, inaspettatamente, Bilal grida: « Madame Garnier ! Qu'elle parle ! » E tutti: « Gar-nier ! Gar-nier ! »
Sali sul muretto. Duecento facce. Ne conosci centoquaranta.
* [Racconti il 1961 per mettere in guardia.]
    ~ discorso = "avvertire"
    ~ su(fiducia, 1)
    « Il y a soixante-cinq ans, jour pour jour, des Algériens ont manifesté pacifiquement à Paris. Des centaines sont morts. Jetés dans la Seine. »
    « Je vous le dis pas pour vous faire peur. Je vous le dis parce qu'ils étaient pacifiques, et que c'est ça qu'on a voulu effacer. Soyez pacifiques. Et soyez nombreux. On ne jette pas cent mille personnes dans la Seine. »
* [Lo racconti per accendere.]
    ~ discorso = "accendere"
    ~ su(rabbia, 2)
    « Il y a soixante-cinq ans, jour pour jour, la police de Paris a jeté des manifestants dans la Seine. Et pendant quarante ans, l'État a dit qu'il ne s'était rien passé. »
    « Alors quand on vous dit de rester calmes, demandez-vous qui vous le dit. » Il cortile esplode. Sacha ti guarda come si guarda un'alleata. Non era quello che volevi. O forse sì.
* [Non parli. « C'est votre journée. »]
    ~ discorso = "tacere"
    ~ su(fiducia, 1)
    ~ giu(responsabilita, 1)
    « Non. C'est votre journée, pas la mienne. Moi je vous suis. » Scendi dal muretto tra i fischi affettuosi.
    È la cosa più difficile che hai fatto in ventiquattro anni: stare zitta davanti a una classe.
- -> poesia_nassim

= poesia_nassim
# img: shared/c3_assemblea
# ora: 12:40
Mentre scendi dal muretto, Nassim Haddad ti si para davanti e ti mette in mano un foglio a quadretti piegato in otto. « C'est pour vous. Lisez pas maintenant. »
È una poesia. Lo sai dalla forma delle righe. Nassim scrive poesie e le strappa; questa non l'ha strappata.
* [La leggi subito, appena lui si gira.]
    ~ poesia = "letta"
    ~ su(responsabilita, 1)
    _Ils disent c'est les ténèbres / mais c'est juste le plafond qui tombe / et nous dessous qui faisons semblant / de pas avoir peur du noir._
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
    « Sacha. Il a quinze ans. » Sacha ti guarda come si guarda una prof: con l'affetto di chi non deve più obbedirle. « C'est pour le gaz, madame. Juste pour le gaz. »
    « En 1961 aussi, ils avaient des foulards pour le gaz. » Non risponde. Ma per tutto il viaggio tiene Nassim vicino.
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
République. Gilet gialli, sindacati, infermiere, universitari. I colleghi dello SNES con lo striscione PROFS AVEC VOUS. Hai trecento volantini nello zaino, fotocopiati di nascosto in sala professori: _17 OCTOBRE 1961 — 17 OCTOBRE 2026_.
Ti senti ridicola e necessaria. È la sensazione abituale del tuo mestiere.

# ---
# ora: 14:50
Davanti a te i tuoi ragazzi gridano al megafono: « BIS-MIL-LAH ! » E duecento voci: « C'EST LES TÉ-NÈ-BRES ! »
Una signora della CGT ti chiede cosa vuol dire. « Rien, madame. C'est ça qui est drôle. Ils ont pris la phrase d'un policier qui se moquait d'eux et ils en ont fait une chanson. »
La signora ci pensa. « Alors ça veut dire quelque chose. » Ha ragione. Ti appunti la frase per lunedì.

# img: shared/c4_applausi
# ora: 15:20
# incrocio: X07
Sul boulevard Voltaire un applauso enorme: passano i pompieri in sciopero, in divisa. I tuoi ragazzi impazziscono. Inès ride con un pompiere che ha un graffio bianco sul casco.
Tu applaudi più piano. Pensi a una cosa che hai letto negli archivi: la notte del 17 ottobre 1961, i pompieri di Parigi hanno ripescato corpi dalla Senna per giorni.

# img: shared/c4_volantino
# ora: 15:40
# incrocio: X08
Distribuisci i volantini. A Inès: « Tu te souviens ? » Al pompiere con il casco graffiato.
* [Al pompiere racconti dei corpi nella Senna.]
    ~ volantino_jerome = true
    ~ su(fiducia, 1)
    « Les pompiers, cette nuit-là, ont repêché des corps dans la Seine pendant des jours. Eux, ils savaient. » Lui piega il volantino e lo mette nel taschino, accanto a una foto di bambina.
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
- "sacha": Poi lo vedi: in testa, attaccato al gomito di Sacha. Sacha si gira, ti vede, ti fa un cenno. _Je le garde._ Non sai se crederci. Ci credi un po'.
- "ines": Inès lo cerca con gli occhi, disperata. Da République non le parla più. Per colpa del passamontagna che gli ha strappato. Per colpa tua.
- "niente": Lo vedi, in testa, con il passamontagna nero sulla faccia. Quello che hai visto passare in metro, e hai fatto finta di niente.
    ~ su(paura, 1)
}
{ discorso == "accendere":
    Qualcuno grida: « Qui vous dit de rester calmes ? » Sono parole tue. Detti in un cortile, a mezzogiorno, sembravano storia. Qui sembrano un ordine.
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
Bilal si gira e ti vede. « Madame ! Venez ! » # timer: 9
* [Li richiami e li porti indietro per il cours de Vincennes.]
    ~ decisiva(1, "P", "Hai riportato indietro i tuoi alunni, lontano dal fuoco e dagli scudi.")
    ~ su(responsabilita, 1)
    « BILAL ! YASMINE ! Avec moi ! Maintenant ! » La voce da interrogazione, quella che non usi mai. Funziona. Ti seguono, controvoglia, tenendosi per le felpe.
    Li porti via dal palazzo, dalla carica, verso una via laterale. Sette su sette. Nassim non c'è.
* [Vai con loro, in prima fila, a gridare.]
    ~ decisiva(1, "V", "Hai portato i tuoi alunni in prima fila, contro gli scudi.")
    ~ su(rabbia, 2)
    Vai con loro. Davanti. Gridi con loro, la sciarpa verde alzata come una bandiera. « Ni oubli ! Ni pardon ! »
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
Quando torna, vicino al cassonetto in fiamme c'è un ragazzo a terra. Felpa grigia. Nassim Haddad, seconde B, quello che scrive poesie e le strappa. Sopra di lui, un casco. # timer: 8
* { paura < 8 } [Corri da lui.]
    ~ decisiva(2, "P", "Sei corsa da Nassim, a cinquantadue anni, nel gas.")
    ~ su(responsabilita, 1)
    Corri. Non corri da trent'anni. Corri come si corre nei sogni, piano e con tutto il corpo. Arrivi. Ti inginocchi accanto a lui.
    « Nassim. C'est Madame Garnier. Respire. » Lui apre un occhio. « Madame… on a cours lundi ? »
    { poesia == "letta": « Oui. Et tu me liras ton poème à voix haute. » Lui sorride, con il sangue sui denti. « Même pas en rêve. » }
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
    Nel fumo si fa largo un pompiere in divisa: è quello del taschino, quello dei corpi nella Senna. Urla « POMPIER ! ». # timer: 8
- else:
    Nel fumo, un pompiere in divisa si fa largo urlando « POMPIER ! ». # timer: 8
}
* { fiducia >= 4 } [« Mehdi. Le 17 octobre. Tu te souviens de ce qu'on a étudié ? »]
    ~ decisiva(3, "P", "Hai ricordato a Mehdi la lezione sul 17 ottobre.")
    Mehdi si blocca. Sotto la visiera, gli occhi di un ragazzo di sedici anni seduto in terza fila, aula 204, che prende diciotto e non ci crede.
    « Madame… » Solo questo. Poi molla il cappuccio. Il pompiere si inginocchia su Nassim. Mehdi resta lì, in piedi, con le mani vuote.
* { fiducia < 4 } [« Mehdi. Le 17 octobre. Tu te souviens de ce qu'on a étudié ? » # locked: non credi più che le lezioni servano a qualcosa]
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
    Tiri fuori il quaderno dei voti dalla borsa. È l'unica cosa che hai. « Vous avez vu ? Votre nom. Votre téléphone. » Li scrivi tutti: un ragazzo, una nonna, un infermiere.
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
Alle 17:52 la piazza si svuota. Scarpe spaiate, cartelli, i tuoi volantini calpestati a centinaia. _17 octobre 1961_, sotto le suole.
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
« Madame Garnier. » Lo dice prima di te.
Gli dici i nomi uno per uno, come all'appello. Lui li cerca sullo schermo. Due li fanno uscire subito. Due resteranno la notte.
{ nomi_preside == "dati":
    Uno dei due è Bilal Traoré. Il suo nome, stamattina, l'hai scritto tu alla preside. Non c'entra niente. Ti sembra che c'entri tutto.
}

* [« Merci, Mehdi. »]
    Lui annuisce. Poi, a bassa voce, senza guardarti: « Le petit Haddad. Il est à Avicenne. Poignet cassé. Le pompier l'a amené. »
    { volantino_mehdi: Tira fuori dal giubbotto il tuo volantino, piegato. « Je l'ai lu, madame. Dans le car. » }
* [« Tu étais où, toi, aujourd'hui ? Vraiment ? »]
    ~ su(rabbia, 1)
    Mehdi ti guarda a lungo. « J'étais là où on m'a mis, madame. Comme vous. » Poi: « Le petit Haddad est à Avicenne. Il va bien. »
    È la risposta più onesta che tu abbia sentito oggi. Non ti piace per niente.
- -> telefonata

= telefonata
# img: odile/02_telefono
# ora: 22:10
Il telefono. L'EHPAD di Vincennes. Tuo padre si è agitato, ha sentito le sirene tutta la sera. Chiede di te.
{ padre_chiesto:
    L'infermiera dice che ripete una frase: _J'ai rien jeté. Dis-lui que j'ai rien jeté._
- else:
    L'infermiera dice che ha chiesto se i ragazzi hanno avuto i loro plafond.
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
_Madame Garnier. C'est la maman de Nassim. Vous m'avez appelée ce matin. Personne d'autre ne m'a appelée, ce matin. Merci._
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
Sulla lavagna, sotto le tue parole di sabato, qualcuno ha scritto con una calligrafia storta che conosci: _17 OCTOBRE 2026 : NOUS AUSSI ON S'EN SOUVIENDRA._
E sotto, più piccolo: _(et merci madame)_.
{ lavagna_titolo:
- "diritto": Accanto alla tua domanda, _Qui a le droit de manifester ?_, qualcuno ha disegnato una freccia e ha scritto: _nous._
- "memoria": Accanto a _MÉMOIRE_, qualcuno ha aggiunto una s, poi l'ha cancellata, poi l'ha riscritta. _MÉMOIRES._
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
    Yasmine Kébé, diciassette anni, terminale, è ad Avicenne con un braccio rotto. Era in prima fila. Era in prima fila perché c'eri tu.
- else:
    Hai saputo da un'agente che ti ha portato un bicchiere d'acqua: Nassim Haddad è in rianimazione. Trauma cranico.
}

# img: odile/02_telefono
# chat: Mme Pasquier (proviseure)
# ora: 23:00
Mme Pasquier: Odile. Le rectorat a vu les vidéos.
Mme Pasquier: Une enseignante en première ligne avec des élèves mineurs. Vous imaginez.
{ chiamata_madre:
    Mme Pasquier: La mère des Haddad m'a appelée. Elle dit que vous l'aviez prévenue ce matin. Ça ne vous aidera pas, mais je voulais que vous le sachiez.
}
{ nomi_preside == "dati":
    Mme Pasquier: J'ai déjà transmis les noms que vous m'avez donnés ce matin. Le vôtre s'y ajoute.
- else:
    Mme Pasquier: J'ai dû transmettre une liste. Votre nom est le premier.
}
* [Non rispondi.]
    Non rispondi. Lasci il telefono a faccia in giù sulla panca. La panca è fredda come una lavagna.
* [« J'ai fait ce que j'enseigne. »]
    ~ su(rabbia, 1)
    Odile: J'ai fait ce que j'enseigne.
    Mme Pasquier: Non, Odile. Vous enseignez l'histoire. Aujourd'hui vous en avez fabriqué. Ce n'est pas la même chose.
- -> notte_violenza

= notte_violenza
# /chat
# capitolo: notte
# ora: 04:00
# img: odile/08_cella
# amb: notte
Alle quattro di notte, nella cella, pensi a una data. Non il 1961: il 2015. Mehdi Saïdi in terza fila che prende diciotto. Tu che gli dici _tu vois que tu peux_.
Pensi a cosa hai insegnato a quel ragazzo, e a Yasmine, e a Nassim. Che la storia la fanno quelli che stanno davanti. Non hai mai detto chi raccoglie i pezzi.

# img: shared/c6_commissariato
# ora: 05:30
Alle cinque e mezza arriva Philippe, il collega di fisica, con l'avvocata del sindacato e un termos di caffè. Ha guidato da Montreuil nel buio.
« Tu sais que tu vas passer en conseil de discipline. » « Je sais. » « Tu sais que je témoignerai pour toi. » Non lo sapevi.
{ poesia == "tenuta":
    Nella borsa che ti restituiscono c'è ancora il foglio di Nassim, piegato in otto. Lo apri. _Ils disent c'est les ténèbres / mais c'est juste le plafond qui tombe._ Nassim è in ospedale. Lo leggi troppo tardi, come tutto oggi.
}

# img: odile/09_ehpad_mattina
# ora: domenica
Il giorno dopo, quando ti rilasciano, vai direttamente all'EHPAD, con il braccio fasciato.
Tuo padre è lucido. Succede, a volte, per un minuto. Ti guarda il braccio. « C'est eux ? » Annuisci.
« J'étais sur le pont, en 61 », dice. « Je tenais les bras. D'autres jetaient. Moi je tenais les bras. » Poi chiede se hai mangiato.
È troppo tardi per qualsiasi cosa. Lo sai. Gli tieni la mano lo stesso.
-> END
