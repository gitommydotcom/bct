// =====================================================================
//  JÉRÔME FERRAND — il pompiere (caporal-chef, SDIS 77)
//  "Prima la vita"
// =====================================================================
INCLUDE comune.ink

VAR alba_scelta = ""          // spegnere | ritirata | parlare
VAR getto_ok = false
VAR sasso_denunciato = false
VAR rapporto_mezzi = false
VAR lettera = ""              // riletta | strappata | lasciata
VAR risata_meme = false
VAR detto_sandrine = false
VAR avvisata_ines = false
VAR cenno_mehdi = false
VAR volantino_preso = false
VAR siero_dato = false

~ personaggio = "jerome"
~ rabbia = 3
~ paura = 5
~ fiducia = 6
~ responsabilita = 8
-> alba

// =====================================================================
=== alba ===
# capitolo: alba
# ora: 06:15
# img: jerome/01_cabina
# amb: notte
Alle 6:15 il camion corre sulla N3 verso Bobigny. Hugo guida, vent'anni, le mani troppo strette sul volante. Samia dorme seduta dietro, con il casco sulle ginocchia.
Siete in tre. Dovreste essere in quattro. Da settembre siete sempre in tre.
La radio gracchia: _Renfort colonne 77, feu de conteneurs, lycée Ernestine-Dumont, Bobigny. La Brigade est saturée._

# ---

« Encore un lycée », dice Hugo. « C'est le cinquième cette semaine. »
Sei stato sei anni alla Brigata di Parigi, prima di passare in Seine-et-Marne. Conosci queste strade a memoria. Alla Brigata eri un militare: non potevi scioperare. Adesso sì. Oggi pomeriggio sciopererai. Stamattina spegni.
Ti tocchi la tasca della giacca. Il telefono. Una foto di Jade, quattro anni, vestita da pompiere per Carnevale.

# img: shared/c1_camion
# ora: 06:45
# sfx: sirena
# amb: folla
Davanti al Dumont: un cassonetto in fiamme contro la grata, una trentina di ragazzi, telefoni alzati. Altri cassonetti spenti, in fila, come denti.
Hugo frena a venti metri. Scendi. Prendi il casco. Non lo metti subito: vuoi che vedano una faccia.

# img: jerome/02_parabrezza
# ora: 06:48
# sfx: vetro
# incrocio: X02
Il sasso arriva prima del suono. Il parabrezza si stella davanti alla faccia di Hugo, che si butta di lato urlando.
Un secondo sasso ti prende il casco che hai in mano. Lo senti nelle ossa del polso. Sulla vernice, un graffio bianco.
Hai visto la faccia. Un ragazzino, quindici anni al massimo, felpa grigia, che torna a nascondersi dietro un cassonetto ridendo.
Samia è già fuori con la manichetta. Ti guarda. Aspetta un ordine.
* [« On éteint. Casques, et on éteint. »]
    ~ alba_scelta = "spegnere"
    ~ su(paura, 1)
    -> getto
* [« Retrait. On attend la police. »]
    ~ alba_scelta = "ritirata"
    ~ giu(fiducia, 1)
    -> ritirata
* [Scendi senza casco e vai verso i ragazzi.]
    ~ alba_scelta = "parlare"
    ~ su(fiducia, 1)
    ~ su(paura, 1)
    -> parlare

= parlare
# img: shared/c1_pompiere
# incrocio: X03
Cammini verso di loro con il casco in mano, la faccia scoperta. Venti metri sono lunghissimi.
Ti fermi a cinque metri dal fuoco. Riempi i polmoni come quando dovevi farti sentire in un cortile di caserma.
« ON EST PAS VOS ENNEMIS ! »
Silenzio. Poi una ragazza esce dal gruppo con le mani alzate. Ha diciassette anni e la faccia di chi non ha dormito. « Pardon. C'est… c'est pas nous. Enfin si. Pardon. »
« Allez », le dici piano. « Éloigne les petits du feu. » Lei lo fa. Poi ti rimetti il casco.
-> getto

= ritirata
# img: shared/c1_camion
# incrocio: X03
Risalite in cabina. Hugo trema. Samia sbatte la portiera così forte che il parabrezza perde un pezzo.
Abbassi il finestrino e urli verso i ragazzi, più per te che per loro: « ON EST PAS VOS ENNEMIS ! » Qualcuno risponde con un insulto.
Il fuoco cresce. Lambisce la grata, poi l'insegna del liceo. Aspettate. È la procedura. La procedura non ha mai visto un fuoco crescere.
Alle 7:10 arrivano i blu. Spegnete sotto la protezione degli scudi, in quattro minuti, senza un sasso. Non ti senti protetto. Ti senti scortato.
-> partenza

= getto
# img: jerome/03_getto
# fx: fumo
# amb: fuoco
La manichetta ti si gonfia tra le mani come un animale. L'acqua parte. Il vapore sale.
I sassi continuano ad arrivare, più radi. Uno ti batte sulla spalla, uno sul casco. # mini: getto
* [ok # ok]
    ~ getto_ok = true
    ~ su(fiducia, 1)
    Il fuoco si abbassa, sfrigola, muore. Resta un cassonetto nero e fumante, e l'odore di plastica che non se ne andrà dai vestiti per giorni.
    I sassi smettono. Non perché li abbia convinti tu. Perché il fuoco non c'è più, e senza fuoco non c'è più lo spettacolo.
* [ko # ko]
    ~ su(rabbia, 1)
    Un sasso prende Hugo sulla coscia e lui molla la lancia. Il getto impazzisce, bagna i ragazzi, bagna te. Il fuoco riprende.
    Lo spegnete alle 7:12, quando arrivano i blu. Hugo zoppica. Non dice niente. Neanche tu.
- -> partenza

= partenza
# img: shared/c1_sgombero
# ora: 07:20
# fx: lampeggianti
# amb: sirene
I furgoni della polizia, le luci blu sulle facciate. Un commissario con la fascia tricolore viene verso di te.
« C'est vous qui vous êtes fait caillasser ? Vous avez vu qui ? »
Il ragazzino con la felpa grigia è dietro la grata, adesso, vicino alla ragazza con le mani alzate. Lo vedi benissimo.
* [« Non. Trop de fumée. »]
    ~ su(fiducia, 1)
    Il commissario ti guarda come si guarda un collega che ha scelto la squadra sbagliata. Poi se ne va.
* [« Un gamin. Quinze ans. Sweat gris. Il est là-bas. »]
    ~ sasso_denunciato = true
    ~ giu(fiducia, 1)
    Il commissario annota e fa un cenno a due agenti. Il ragazzino scappa verso i palazzi prima che arrivino. # ricorda: Il commissario si ricorderà la descrizione.
- Alle 7:30 ripartite. Il parabrezza è una ragnatela. Hugo guida con la testa fuori dal finestrino, come un cane.
-> ritorno

= ritorno
# img: jerome/01_cabina
# ora: 07:40
# fxoff
# amb: notte
Sulla N3, al primo semaforo, Hugo parla senza guardarti. « Jé. Pourquoi ils nous caillassent ? On est là pour eux. »
Samia, dietro, ride senza allegria. « Parce qu'on a un uniforme, mon grand. Pour eux un uniforme c'est un uniforme. »
* [« Parce qu'on a un uniforme. »]
    ~ giu(fiducia, 1)
    « Samia a raison. Ils voient la tenue, pas nous. » Hugo annuisce. Gli hai appena insegnato a non aspettarsi niente. È un insegnamento utile e triste.
* [« Parce qu'ils ont quinze ans. »]
    ~ su(fiducia, 1)
    « Parce qu'ils ont quinze ans et que personne les écoute. Nous non plus, personne nous écoute. C'est pour ça qu'on marche, cet après-midi. »
    Hugo ci pensa fino a Chelles. Poi dice: « Alors on marche avec eux. » Non era una domanda.
- -> mattina

// =====================================================================
=== mattina ===
# capitolo: mattina
# ora: 08:40
# img: jerome/04_caserma
# fxoff
# amb: interno
Centro di soccorso di Chelles. Il camion in officina, Hugo al pronto soccorso per un livido che non vuole far vedere a nessuno.
Il rapporto d'intervento ti aspetta sullo schermo. Il cursore lampeggia nella casella _Observations_.
{ sasso_denunciato:
    Hai già dato la descrizione al commissario. Il rapporto è una formalità. Oppure no.
}
* [Descrivi il ragazzo.]
    ~ sasso_denunciato = true
    _Individu de sexe masculin, environ 15 ans, sweat gris, a lancé un projectile ayant brisé le pare-brise._ È la verità. La verità, scritta, sembra una condanna.
* [Scrivi: « Individu non identifié. »]
    { sasso_denunciato:
        Scrivi _non identifié_ anche se l'hai detto al commissario. Una bugia a metà: sulla carta lo proteggi, a voce l'hai già consegnato.
    - else:
        _Individu non identifié._ Lo scrivi in fretta, prima di ripensarci. Hai visto la faccia. Hai visto anche la sorella, con le mani alzate.
    }
* [Scrivi che il camion era senza il quarto uomo.]
    ~ rapporto_mezzi = true
    ~ su(rabbia, 1)
    ~ su(fiducia, 1)
    _Engin engagé avec un effectif de trois au lieu de quatre. Conducteur blessé. Aucun renfort disponible._ Lo scrivi in maiuscolo, poi lo rimetti in minuscolo. Il rapporto andrà al sindacato. Ce l'hai deciso mentre scrivevi.
- -> maxime

= maxime
# img: jerome/05_telefono
# chat: Maxime (BSPP)
Maxime: paraît que t'as pris des cailloux à Bobigny
Maxime: bienvenue dans ma vie depuis 3 semaines
* [« Et toi, t'es où aujourd'hui ? »]
    Jérôme: et toi t'es où aujourd'hui ?
    Maxime: VSAV à Nation cet aprèm. dispositif manif
    Maxime: toi tu marches, moi je ramasse 😅
* [« On manifeste aussi pour vous, tu sais. »]
    ~ su(fiducia, 1)
    Jérôme: on manifeste aussi pour vous tu sais
    Maxime: je sais. merci
    Maxime: moi je suis militaire, je peux même pas mettre un badge
    Maxime: je serai à Nation avec le VSAV. si tu me vois, fais coucou 🙃
- Maxime: t'as de la chance de pouvoir faire grève, Jé. vraiment
-> armadietto

= armadietto
# /chat
# img: jerome/06_armadietto
# ora: 10:30
Nell'armadietto, sotto il casco di riserva, c'è una busta. _Lettre de démission. Caporal-chef Jérôme Ferrand._ Firmata il 2 settembre, dopo la Gironda.
Questa estate, in Gironda, una casa nel bosco. Una donna al piano di sopra. Siete arrivati sei minuti tardi perché la seconda autobotte era a cento chilometri. Sei minuti.
Sandrine non sa niente della lettera.
* [La rileggi.]
    ~ lettera = "riletta"
    ~ su(paura, 1)
    La rileggi tutta. È scritta bene, per essere una lettera di resa. _Je ne suis plus en mesure d'assurer ma mission dans les conditions actuelles._
    La rimetti nella busta. Le condizioni attuali, pensi. Oggi pomeriggio vai a manifestare proprio contro le condizioni attuali.
* [La strappi.]
    ~ lettera = "strappata"
    ~ su(fiducia, 1)
    ~ su(rabbia, 1)
    La strappi in quattro e la butti nel cestino della mensa. Ti senti forte per otto secondi. Poi ti senti stupido, poi di nuovo forte.
    Se te ne vai tu, resta Hugo. Da solo, in tre invece che in quattro.
* [La lasci lì.]
    ~ lettera = "lasciata"
    La lasci lì. Chiudi l'armadietto. È quello che fai da settembre: chiudere l'armadietto.
- -> mezzogiorno

// =====================================================================
=== mezzogiorno ===
# capitolo: mezzogiorno
# ora: 12:40
# img: jerome/07_rer
# amb: metro
RER E verso Parigi. Siete una decina di pompieri del 77, in divisa da intervento e bracciale arancione: POMPIERS EN GRÈVE. La gente vi sorride. Una signora vi offre una clementina.
Hugo è venuto lo stesso, zoppicando. « Je vais pas rater ça. »
Samia ha fatto un cartello: _3 au lieu de 4 = des morts au lieu de vivants_. È brutto e vero. Come tutti i cartelli giusti.

# incrocio: X05
Hugo ti mette il telefono sotto il naso, ridendo. « Regarde ça, Jé. Le flic qui se fait passer pour un lycéen. » Lo screenshot: _wesh la team bismillah c'est les ténèbres… jsui chaud de ouf frérot_.
È davvero ridicolo. Tutto il vagone ride.
* [Ridi anche tu.]
    ~ risata_meme = true
    ~ giu(paura, 1)
    Ridi fino alle lacrime. Ti fa bene. È la prima volta che ridi da settembre.
    Poi pensi al ragazzino con la felpa grigia, e ti chiedi se anche lui ride, adesso. Probabilmente sì. Probabilmente è giusto così.
* [« Montre ça au gamin du caillou. Je suis sûr qu'il rigole moins. »]
    ~ su(rabbia, 1)
    Hugo smette di ridere. « T'es dur, Jé. » Forse sì.
    Forse ce l'hai solo con te stesso, e un ragazzino di quindici anni è la cosa più vicina.
- -> sandrine

= sandrine
# img: jerome/05_telefono
# chat: Sandrine ❤️
Sandrine: Jade demande si tu vas "éteindre la manif" 😂
Sandrine: fais attention à toi. vraiment.
* [Le dici della lettera.]
    ~ detto_sandrine = true
    ~ su(fiducia, 1)
    Jérôme: faut que je te dise un truc. ce soir.
    Jérôme: j'ai écrit une lettre de démission en septembre. elle est dans mon casier
    Sandrine: …
    Sandrine: ok. ce soir. rentre entier et on en parle
    Sandrine: je t'aime, idiot
* [« Toujours. »]
    ~ su(paura, 1)
    Jérôme: toujours
    Sandrine: menteur ❤️
- -> pomeriggio

// =====================================================================
=== pomeriggio ===
# /chat
# capitolo: pomeriggio
# ora: 14:20
# img: shared/c4_republique
# amb: folla
République. Il vostro gruppo si infila nel corteo tra gli infermieri e i liceali. Ogni volta che qualcuno vede le vostre divise, applaude.
Non ci sei abituato. Di solito, quando la gente vi vede, è il giorno peggiore della loro vita.

# ---
# ora: 14:40
Sul camion del sindacato, un delegato con il megafono legge i numeri: estate record di incendi, cinquemila assunzioni chieste, camion vecchi di vent'anni.
{ rapporto_mezzi:
    Poi legge una frase che conosci: _Engin engagé avec un effectif de trois au lieu de quatre. Conducteur blessé._ È il tuo rapporto di stamattina. Duemila persone applaudono Hugo che zoppica, senza sapere che è lui.
    ~ su(fiducia, 1)
- else:
    Hugo ti dà una gomitata. « T'aurais dû mettre les trois au lieu de quatre dans le rapport. Ils l'auraient lu. » Ha ragione. Non ci hai pensato.
}

# img: shared/c4_applausi
# ora: 15:20
# incrocio: X07
Sul boulevard Voltaire l'applauso diventa un'onda. Un gruppo di liceali vi circonda gridando _les pompiers avec nous_. Hugo piange e fa finta che sia il fumo di stamattina.
In mezzo a loro, una ragazza con un cartello storto: BISMILLAH C'EST LES TÉNÈBRES (ET LE PLAFOND AUSSI). È lei. Quella con le mani alzate.
{ alba_scelta == "parlare":
    « La fille aux mains en l'air. Ça va ? » Lei annuisce. Arrossisce.
- else:
    Ti guarda come si guarda qualcuno che si è già visto senza ricordare dove. Tu invece te la ricordi.
}
Ridi del cartello. « Le plafond aussi, hein. Chez nous c'est les camions. Trois au lieu de quatre. »

# ---
Pochi metri dietro di lei, con quelli più grandi vestiti di nero, c'è il ragazzino con la felpa grigia. Il sasso. Ha in tasca qualcosa di nero.
* [Ti chini verso di lei: « Ton frère. Celui du caillou. Garde-le près de toi aujourd'hui. »]
    ~ avvisata_ines = true
    ~ su(responsabilita, 1)
    Lei sbianca. Allora l'avevi visto. Annuisce, e la vedi girarsi a cercarlo con gli occhi.
    Non hai detto niente al commissario, a lei sì. { sasso_denunciato: Anzi, no: l'hai detto anche al commissario. Lo sai solo tu. }
* [Non dici niente. Non è affar tuo.]
    ~ giu(responsabilita, 1)
    Non dici niente. Hai spento il loro fuoco, stamattina. Non puoi spegnere anche le loro famiglie.
- -> volantino

= volantino
# img: shared/c4_volantino
# ora: 15:40
# incrocio: X08
Una donna con la sciarpa verde risale il corteo distribuendo volantini fotocopiati. _17 OCTOBRE 1961 — 17 OCTOBRE 2026._ Te ne dà uno.
« Vous savez ce qui s'est passé, le 17 octobre 1961 ? » Lo sai a metà. I manifestanti algerini, la Senna. Alla Brigata non se ne parlava.
« Les pompiers, cette nuit-là, ont repêché des corps dans la Seine pendant des jours », dice lei. « Eux, ils savaient. »
* [Lo pieghi e lo metti nel taschino della giacca.]
    ~ volantino_preso = true
    ~ su(fiducia, 1)
    Lo metti nel taschino, accanto alla foto di Jade. Non sai bene perché. Forse perché qualcuno, nel '61, ha tirato fuori i corpi dall'acqua e non ha potuto dire niente.
* [Lo passi a Hugo.]
    Lo passi a Hugo. Hugo lo legge camminando, muovendo le labbra. « Putain », dice alla fine. Solo quello.
- -> cordone

= cordone
# img: jerome/08_cordone
# ora: 16:10
Il cordone ai lati del corteo, sul boulevard Voltaire. Un agente giovane, la visiera alzata per un momento, ti guarda il bracciale. POMPIERS EN GRÈVE.
Ha la tua età di quando sei entrato alla Brigata. Occhi stanchi, i tuoi.
La donna con la sciarpa verde gli tende un volantino. Lui non lo prende. O forse sì.
* [Gli fai un cenno con la testa.]
    ~ cenno_mehdi = true
    ~ su(fiducia, 1)
    Gli fai un cenno. Un secondo di esitazione, poi lui risponde, appena. Due uomini in divisa che si riconoscono come si riconoscono i cani dello stesso canile. # ricorda: L'agente si ricorderà di te.
* [Lo ignori.]
    Lo ignori. Oggi sei dall'altra parte, almeno fino a stasera. Poi tornerete tutti e due a fare lo stesso lavoro: raccogliere i pezzi.
- -> scontro

// =====================================================================
=== scontro ===
# capitolo: scontro
# ora: 17:20
# img: shared/c5_nation
# amb: sirene
Place de la Nation. Il vostro gruppo è arrivato in mezzo al corteo, quando la testa è già sulla piazza. Senti il rumore prima di vederla: quel rumore basso che fa una folla quando smette di cantare.
Dal lato del cours de Vincennes, il muro di scudi. Da qualche parte dietro gli scudi c'è Maxime con il VSAV. Non hai niente: né lancia, né autorespiratore, né radio. Solo la divisa.

# img: shared/c5_gas
# ora: 17:26
# sfx: lacrimogeno
# fx: gas
I lacrimogeni. Il gas ti entra in gola come una cosa viva. Sei stato addestrato a questo, ma con la maschera. Senza è un'altra storia.
Una ragazzina di tredici anni ti si aggrappa al braccio, piangendo, cieca. Hai in tasca due fiale di siero fisiologico, per abitudine.
* [Le lavi gli occhi, piano, tenendole la testa.]
    ~ siero_dato = true
    ~ su(responsabilita, 1)
    Le tieni la testa indietro come a una bambina dal parrucchiere. « Ça pique, mais ça passe. Respire par le nez. » Lei respira. Smette di piangere. Ti guarda come si guarda un supereroe. Non sei niente del genere.
* [La spingi verso un portone e le dici di restare lì.]
    ~ su(paura, 1)
    La spingi in un portone, al riparo. « Tu restes là. Tu bouges pas. » Lei annuisce. Te ne vai prima di vedere se ubbidisce.
- -> cassonetto

= cassonetto
# img: shared/c5_cassonetto
# ora: 17:37
# fx: fumo
# amb: fuoco
# incrocio: X09
All'angolo del cours de Vincennes, un cassonetto prende fuoco sotto un palazzo. Farmacia al piano terra. Al primo piano, alla finestra, una signora anziana in vestaglia.
Il fumo sale dritto verso di lei. È la Gironda in piccolo, tutta in un secondo.
{ getto_ok:
    Stamattina, alla grata, il fuoco l'hai battuto tu, con la lancia in mano e i sassi sul casco. Adesso non hai la lancia.
- else:
    Stamattina il fuoco ti ha battuto, e Hugo zoppica. Adesso non hai neanche la lancia.
}
Tra te e il palazzo c'è un pezzo di cordone che si sta muovendo per la carica. Nessuno dei poliziotti guarda la finestra. # timer: 9
* [Sfondi il cordone per arrivare al palazzo.]
    ~ decisiva(1, "V", "Hai sfondato il cordone di polizia per arrivare al palazzo.")
    ~ su(rabbia, 2)
    # sfx: colpo
    Ti butti contro gli scudi con la spalla, come si sfonda una porta. Un agente cade. Un altro ti colpisce al casco, che non hai.
    Passi. Sanguini dal sopracciglio. Dietro di te, il cordone carica sui ragazzi che ti hanno seguito.
* { fiducia >= 4 } [Chiedi all'agente più vicino di farti passare.]
    ~ decisiva(1, "P", "Hai chiesto alla polizia di lasciarti passare, invece di sfondare.")
    { cenno_mehdi:
        È lui. L'agente del boulevard Voltaire. « POMPIER ! Il y a quelqu'un au premier ! » Ti guarda, guarda la finestra. Si sposta di mezzo metro. Basta.
    - else:
        « POMPIER ! Il y a quelqu'un au premier ! » L'agente esita, chiama il suo capo alla radio. Trenta secondi. Poi si sposta.
    }
    Arrivi sotto il palazzo. Fai segno alla signora di chiudere la finestra e bagnare un asciugamano. Lei capisce. Chiude.
* { fiducia < 4 } [Chiedi all'agente più vicino di farti passare. # locked: non credi più che ti ascolterebbero]
    -> carica
* [Organizzi la folla per allontanarla dal palazzo.]
    ~ decisiva(1, "P", "Hai organizzato la folla per allontanarla dal palazzo in fiamme.")
    ~ su(responsabilita, 1)
    Sali su una panchina con la tua divisa e la tua voce da cortile: « RECULEZ ! Y A DES GENS LÀ-HAUT ! Dégagez le bâtiment ! »
    Una ragazza la riprende, poi altri. La folla si allarga. La signora al primo piano chiude le imposte.
* [Resti paralizzato. # timeout]
    ~ decisiva(1, "F", "Sei rimasto paralizzato davanti al fuoco sotto la finestra.")
    ~ su(paura, 2)
    Non ti muovi. Sei in Gironda, sei minuti tardi. La donna al piano di sopra. Il bosco. Le mani ti tremano e il resto di te è di pietra.
- -> carica

= carica
# img: shared/c5_carica
# ora: 17:39
# sfx: colpo
La carica. Il cordone avanza. La folla si rovescia all'indietro come un'onda che si ritira e trascina tutto.
Un mortaio d'artificio esplode contro gli scudi in scintille verdi. Poi un candelotto lacrimogeno ti rotola tra i piedi, sputando fumo bianco.
# sfx: granata
# flash

# img: shared/c5_granata
# ora: 17:42
# sfx: granata
# flash
# incrocio: X10
La granata di dispersione rotola tra le scarpe ed esplode a quattro metri da te. Il suono ti spegne il mondo per un secondo.
Quando torna, vicino al cassonetto in fiamme c'è un ragazzo a terra. Felpa grigia. Il ragazzino del sasso. Sopra di lui, un casco. Intorno, il gas più denso che tu abbia mai visto senza maschera.
{ avvisata_ines:
    Hai detto a sua sorella di tenerlo vicino. Non è bastato.
}
Il candelotto che ti fuma tra i piedi. Il ragazzo nel gas. Maxime, da qualche parte, con il VSAV. # timer: 8
* { responsabilita >= 6 } [Entri nel gas e lo trascini fuori.]
    ~ decisiva(2, "P", "Sei entrato nel gas senza maschera per trascinare fuori il ragazzo.")
    ~ su(responsabilita, 1)
    ~ su(paura, 1)
    Trattieni il respiro come all'addestramento, conti, entri. Il gas ti mangia gli occhi. Trovi la felpa a tentoni. Lo prendi sotto le ascelle, come si prende un ferito, e tiri.
* { responsabilita < 6 } [Entri nel gas e lo trascini fuori. # locked: oggi hai lasciato andare troppe cose]
    -> mano
* [Urli a Maxime di portare l'ambulanza.]
    ~ decisiva(2, "P", "Hai chiamato l'ambulanza della Brigata invece di entrare da solo.")
    ~ su(fiducia, 1)
    Ti arrampichi su un cassonetto rovesciato e agiti le braccia verso il lampeggiante blu del VSAV, dietro gli scudi. « MAXIME ! UN BLESSÉ ! ICI ! »
    Il VSAV si muove. Lentamente, troppo lentamente, tra la folla.
* [Afferri il candelotto e lo ributti verso gli scudi.]
    ~ decisiva(2, "V", "Hai ributtato il candelotto contro il cordone.")
    ~ su(rabbia, 2)
    Lo prendi con la manica e lo lanci verso gli scudi con tutta la rabbia di settembre. Ti bruci il palmo attraverso la stoffa.
    Torna da loro. Loro rispondono con altri tre. Il ragazzo è ancora lì, nel gas.
* [Non riesci a muoverti. # timeout]
    ~ decisiva(2, "F", "Sei rimasto paralizzato mentre il ragazzo era a terra nel gas.")
    ~ su(paura, 2)
    Le gambe non ti rispondono. La Gironda torna in testa, tutta insieme: la scala troppo corta, la finestra, il silenzio dopo.
- -> mano

= mano
# img: shared/c5_mano
# ora: 17:44
# fx: fumo
# incrocio: X11
Un agente afferra il ragazzo per il cappuccio e lo trascina verso il cordone. Il ragazzo ha la faccia piena di sangue. Respira male: lo senti da qui, quel fischio che conosci.
Corri. Gridi: « POMPIER ! LAISSEZ PASSER ! » { siero_dato: Dietro di te una voce di tredici anni lo ripete, più forte: « C'EST UN POMPIER ! LAISSEZ-LE ! » La ragazzina del siero. La folla si apre. } Un secondo agente si gira verso di te e alza il manganello. Dietro di lui, il ragazzo smette di divincolarsi. # timer: 8
* [Colpisci l'agente.]
    ~ decisiva(3, "V", "Hai colpito un agente per arrivare al ragazzo.")
    ~ su(rabbia, 2)
    # sfx: colpo
    Lo colpisci in faccia, sotto la visiera. Un pugno solo, da pompiere: pesante, stupido. L'agente cade. Mille telefoni lo filmano.
    Ti prendono in quattro. Mentre ti piegano a terra vedi il ragazzo, a tre metri, che non si muove più.
* [Ti metti in mezzo con il tuo corpo.]
    ~ decisiva(3, "P", "Ti sei messo in mezzo con il tuo corpo, a mani vuote.")
    ~ su(responsabilita, 1)
    Ti metti tra il manganello e il ragazzo. Il colpo ti arriva sulla spalla, quella del sasso di stamattina. Non ti sposti.
    « Il respire mal. Laissez-moi faire. Je suis pompier. » L'agente abbassa il braccio.
* [Urli « POMPIER ! » e alzi le mani.]
    ~ decisiva(3, "P", "Hai alzato le mani e gridato che eri un pompiere.")
    Alzi le mani, aperte, alte. « POMPIER ! Il étouffe ! Il étouffe ! » La divisa fa il resto. Il manganello si abbassa.
    L'agente che tiene il ragazzo si gira. Sotto la visiera è il ragazzo del boulevard Voltaire. Molla il cappuccio.
* [Ti blocchi. # timeout]
    ~ decisiva(3, "F", "Ti sei bloccato davanti al manganello.")
    ~ su(paura, 1)
    Ti blocchi. Il manganello resta alzato, tu resti fermo, e il ragazzo sparisce dietro gli scudi.
- -> dopo

= dopo
# img: shared/c5_vuota
# ora: 17:52
# fxoff: gas
# amb: sirene
Alle 17:52 la piazza si svuota. Scarpe, cartelli, un volantino calpestato. Il cassonetto nero fuma.
{ d1 == "P":
    Al primo piano le imposte sono chiuse. La signora è viva. Lo sai senza vederla: le imposte chiuse sono una frase.
- else:
    La finestra del primo piano è spalancata, nera. La Brigata sale con la scala. Riconosci il modo di salire: è il tuo.
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
# ora: 18:10
# img: jerome/09_vsav
# fxoff
# amb: sirene
Il VSAV di Maxime. Il ragazzo sulla barella, la maschera d'ossigeno, il polso piegato in un modo che non va bene. Respira. Respira meglio.
Maxime ti guarda e scuote la testa. « T'es fou, Jé. Sans masque. » Poi ti passa una bottiglia d'acqua per gli occhi. « Monte. »
Sali. È la prima volta da settembre che sali su un mezzo senza pensare alla lettera.
{ getto_ok:
    « Paraît que t'as éteint Bobigny sous les cailloux ce matin », dice Maxime. « T'as fait ta journée, toi. »
}

# img: shared/c6_avicenne
# ora: 21:00
# amb: interno
# incrocio: X13
Ospedale Avicenne. Il ragazzo si chiama Nassim, ha quindici anni, un polso rotto, un taglio in fronte, i polmoni pieni di gas. Vivrà.
Nel corridoio arriva di corsa la ragazza con le mani alzate. Inès. Sua sorella. Si ferma davanti a te, senza fiato.
{ alba_scelta == "parlare":
    « Deux fois dans la même journée, la fille aux mains en l'air. »
}
* [« Ton frère m'a lancé un caillou ce matin. Je l'ai vu. » E le dici del rapporto.]
    { sasso_denunciato:
        « Je l'ai dit au commissaire. Avec la description. » Lei ti guarda come se l'avessi colpita.
        Poi abbassa gli occhi. « Il l'a mérité, je crois. » Non ci crede nessuno dei due.
    - else:
        « Je l'ai pas mis dans le rapport. » Lei ti guarda a lungo. « Pourquoi ? »
        « Parce qu'à quinze ans j'ai fait pire. Et parce que ce soir, c'est moi qui l'ai porté. »
    }
* [Non le dici niente del sasso.]
    Non le dici niente. Le offri un caffè dalla macchinetta che ruba le monete. La macchinetta ruba la tua.
    Lei ride, per la prima volta. Una risata da diciassette anni, nel corridoio di un ospedale.
- -> casa

= casa
# capitolo: notte
# ora: 00:40
# img: jerome/10_cucina_notte
# amb: notte
A mezzanotte e quaranta sei a casa. Sandrine è sveglia in cucina. Ti guarda le mani bruciate, gli occhi rossi, la spalla.
{ detto_sandrine:
    « Alors. Cette lettre. » Non c'è rimprovero nella voce. C'è stanchezza, e qualcos'altro che somiglia al sollievo.
- else:
    Non sa della lettera. Ti versa un bicchiere d'acqua. « Raconte. » E tu, senza deciderlo, cominci dalla lettera.
}
{ lettera == "strappata":
    Le dici che l'hai strappata stamattina. Lei ti prende la mano bruciata, piano. « Tant mieux. Mais si tu la réécris, je la lirai avant. »
    -> epilogo_pace
}
* [« Lundi je la jette. »]
    « Lundi je la jette. Il reste Hugo. Il reste les petits. » Sandrine annuisce. « Et il reste nous. »
* [« Lundi je la donne. Sans honte. »]
    « Lundi je la donne. Mais pas à cause d'aujourd'hui. Malgré aujourd'hui. » Sandrine ti stringe la mano. « Alors sans honte. »
- -> epilogo_pace

= epilogo_pace
# img: jerome/11_cameretta
# ora: domenica
Il giorno dopo, Jade entra nel letto alle sette e ti guarda le mani fasciate.
« T'as éteint la manif, papa ? » Ci pensi.
« Un petit bout. »
{ volantino_preso:
    Nel taschino della giacca appesa alla sedia c'è ancora il volantino. _17 octobre 1961._ Gliene parlerai, un giorno. Dei pompieri che ripescavano i corpi e non potevano dire niente.
}
-> END

// =====================================================================
=== sera_violenza ===
# capitolo: sera
# ora: 20:30
# img: shared/c6_commissariato
# fxoff
# amb: interno
Commissariato del 12°. In divisa da pompiere, con le fascette ai polsi. Gli agenti che passano ti guardano come si guarda un traditore. Non hanno tutti i torti, non hanno tutte le ragioni.
_Violences volontaires sur personne dépositaire de l'autorité publique._ Lo dicono lentamente, perché tu capisca bene ogni parola.
{ d3 == "V":
    L'agente che hai colpito ha il naso rotto. Ha ventisei anni.
}
Nel corridoio, due agenti ridono. « Bismillah, c'est les ténèbres, hein ? » Uno ti guarda e smette.
{ risata_meme:
    Stamattina, sulla RER, ridevi anche tu della stessa battuta. Adesso ti sembra la cosa più triste che tu abbia mai sentito.
}

# img: jerome/05_telefono
# chat: Maxime (BSPP)
# ora: 22:15
Maxime: t'es sur toutes les chaînes Jé
Maxime: "un pompier frappe un policier". 2 millions de vues
Maxime: le gamin est en réa. trauma crânien. on l'a récupéré trop tard
Maxime: je dis pas que c'est toi. je dis qu'on était pas là où il fallait
* [« Je sais. »]
    Jérôme: je sais
    Maxime: tiens bon
* [« Ils l'ont tabassé devant moi. »]
    ~ su(rabbia, 1)
    Jérôme: ils l'ont tabassé devant moi
    Maxime: je sais. moi aussi j'ai vu
    Maxime: mais toi t'as frappé. et maintenant c'est toi la vidéo
- -> notte_violenza

= notte_violenza
# /chat
# capitolo: notte
# ora: 03:00
# img: jerome/12_tv
# amb: notte
Alle tre ti rilasciano. Sospeso in via cautelare. Procedimento disciplinare. Il sindacato ha già fatto due comunicati: uno ti difende, l'altro prende le distanze. Sono scritti dalla stessa persona.
Sandrine ti aspetta in macchina davanti al commissariato. Non dice niente per tutto il viaggio. { detto_sandrine: A un certo punto, a un semaforo rosso: « Et la lettre, maintenant, t'en as plus besoin. » }
{ lettera == "lasciata" || lettera == "riletta":
    La lettera è ancora nell'armadietto. Adesso non serve più. Decideranno loro.
}

# img: jerome/12_tv
# ora: domenica
Il giorno dopo, alle otto, Jade guarda i cartoni. Poi cambiano canale e passa il video. Un uomo in divisa da pompiere che colpisce un poliziotto, in loop.
Jade ti guarda. Guarda la tv.
« Papa. Pourquoi les gens à la télé disent des choses méchantes sur les pompiers ? »
-> END
