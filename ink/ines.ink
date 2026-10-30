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
Sul tavolo, un post-it giallo: _Mange quelque chose. Je t'aime. Maman._
La porta della camera di Nassim è aperta. Il letto è fatto, cioè disfatto come sempre, ma vuoto.
Tuo fratello ha quindici anni e da tre settimane si sveglia prima di te.

# img: ines/02_telefono
# chat: BLOCUS DUMONT ⚡
Yasmine: wesh vous êtes où
Bilal: devant la grille dans 10 min
Yasmine: y a déjà du monde
Bilal: y a les grands du quartier aussi askip 👀
* [« Qui a appelé les grands ? »]
    Inès: qui a appelé les grands ??
    Bilal: ton frère jcrois 💀
    ~ su(paura, 1)
* [« J'arrive. Pas de feu, on a dit. »]
    Inès: j'arrive. pas de feu on a dit.
    Yasmine: oui cheffe 🫡
    ~ su(fiducia, 1)
- Inès: Nassim t'es où
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
« Salut, la déléguée. On vous a ramené des meubles. »
Dietro di lui, con un cassonetto tutto per sé, c'è Nassim. Ti fa un sorriso enorme, lo stesso di quando a sei anni rubava i biscotti dall'armadio alto.
I cassonetti sono lì. Tutti aspettano che tu dica qualcosa.
* [« Mettez-les devant la grille. Mais pas de feu. »]
    ~ barricata = "accettata"
    ~ su(rabbia, 1)
    ~ giu(fiducia, 1)
    Sacha annuisce. « Pas de feu. » Lo dice come si dice _a dopo_.
    I cassonetti si allineano davanti alla grata, uno accanto all'altro, come denti.
* [« Non. Des banderoles et nos corps. C'est tout. »]
    ~ barricata = "striscioni"
    ~ su(fiducia, 1)
    Sacha alza le spalle. « Comme tu veux, cheffe. »
    Ma i cassonetti restano lì, a dieci metri, parcheggiati sul marciapiede. Come un'idea che nessuno ha ancora avuto il coraggio di avere.
* [Ti giri verso il gruppo: « On vote ? »]
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
« Les flammes, ça fait des vues », ride qualcuno dietro di te.
Il fumo sale verso le finestre del palazzo di fronte, dove si accende una luce, poi un'altra.
* [Svuoti le bottiglie d'acqua degli zaini sul fuoco.]
    ~ fiamme_spente = true
    ~ su(responsabilita, 1)
    Tu e Yasmine svuotate sei bottiglie. Il fuoco sfrigola, si abbassa, non si spegne.
    Ma adesso è più fumo che fuoco, e nessuno lo filma più. Qualcuno ti chiama _la pompière_. Non è un complimento.
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
    « Lâche-moi, t'es pas ma daronne ! » Lo tieni. Ti dà una spinta. Lo tieni lo stesso, fino al muro della palestra.
    « C'est des pompiers, Nassim. Des POMPIERS. »
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
« Pardon. C'est… c'est pas nous. Enfin si. Pardon. »
Lui si gira verso i ragazzi e alza la voce, quella che si usa nei cortili: « ON EST PAS VOS ENNEMIS ! »
Poi a te, piano: « Allez. Éloigne les petits du feu. »
-> sgombero

= pompiere_lontano
# img: shared/c1_pompiere
# incrocio: X03
Dal camion, il pompiere grande urla qualcosa verso i ragazzi. Lo senti a metà, tra le risate: « …PAS VOS ENNEMIS ! »
Qualcuno risponde con un insulto. Lui rimette il casco e apre la manichetta.
-> sgombero

= sgombero
# img: shared/c1_sgombero
# ora: 07:10
# fxoff: fumo
# fx: lampeggianti
# amb: sirene
Alle 7:10 arrivano i blu. Tre furgoni, le luci che girano sui muri come in discoteca. Nessuno balla.
Un commissario con la fascia tricolore legge qualcosa al megafono. Le parole arrivano storte: _…dispersion… sommations…_
Yasmine ti stringe il braccio. « Inès. On fait quoi ? »
* [« On s'assoit. Tout le monde. Bras dessus, bras dessous. »]
    ~ scelta_sgombero = "seduta"
    ~ su(paura, 1)
    ~ su(fiducia, 1)
    Vi sedete sull'asfalto gelato, intrecciati. Gli agenti vi sollevano uno a uno, come sacchi di patate.
    Fa male ai polsi e alla dignità. Ma nessuno tira niente: la vostra immobilità tiene fermi anche gli altri.
* [Vai dal commissario a trattare.]
    ~ scelta_sgombero = "trattativa"
    ~ su(fiducia, 1)
    « On libère la grille à huit heures. Sans histoires. »
    Il commissario ti guarda come si guarda un cane che parla. Poi, sorprendentemente, guarda l'orologio.
    « Sept heures quarante-cinq. Pas une minute de plus. » Hai ottenuto mezz'ora. Ti sembra un secolo e niente.
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
Si ferma davanti a un agente col casco. Lo guarda a lungo. Poi dice, forte: « Mehdi ? Mehdi Saïdi ? »
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
Maëlys: t'as vu les vidéos de ce matin
Maëlys: le feu devant le bahut ça tourne partout 🔥
Maëlys: moi j'ai encore la mâchoire en compote
Maëlys: le médecin dit que je pourrai remanger des chips dans 3 semaines. LA HESS
* [Le dici la verità: hai paura per oggi pomeriggio.]
    ~ maelys_verita = true
    ~ su(fiducia, 1)
    Inès: j'ai peur pour cet aprèm. pour nassim surtout
    Maëlys: moi aussi j'avais peur
    Maëlys: et j'y suis allée quand même
    Maëlys: reste devant. reste visible. et lâche pas ton frère
* [Fai la forte.]
    ~ su(rabbia, 1)
    Inès: t'inquiète on va tout casser. enfin… façon de parler 😅
    Maëlys: inès.
    Maëlys: moi aussi je disais "façon de parler"
- -> chiamata

= chiamata
# /chat
# img: ines/05_cucina_giorno
# ora: 10:30
Alle 10:30 chiama la mamma, dalla pausa. Ha la voce di chi ha fatto dodici ore e ne farà altre dodici.
« Ma chérie. J'ai vu le feu au lycée sur Facebook. Tu y étais ? »
Non aspetta la risposta. « Et cet après-midi ? Vous allez à Paris ? »
* [« Oui. On va à Nation. Je garde Nassim avec moi. »]
    ~ su(responsabilita, 1)
    Silenzio. Si sente un bip di macchinario, lontano.
    « Tu gardes ton frère. Tu me promets. »
    Prometti. La promessa ti resta in gola come una lisca.
* [« Non, on reste au quartier. Je te jure. »]
    ~ ha_mentito = true
    ~ su(paura, 1)
    « D'accord. Je te fais confiance. »
    Riattacca. La fiducia della mamma ti pesa più di un cassonetto. # ricorda: La mamma se ne ricorderà.
- -> divano

= divano
# img: ines/04_camera
# ora: 11:00
Nassim apre un occhio quando gli togli le scarpe. « T'as balancé ? »
{ nassim_sgridato:
    Stamattina l'hai trascinato per il cappuccio davanti a tutti. Non te l'ha perdonato, si vede da come si gira verso il muro.
- else:
    Non sa se l'hai visto, stamattina. Lo sta chiedendo senza chiederlo.
}
* [« Je sais pour mardi. Le caillou. Et pour ce matin. »]
    ~ confronto_martedi = true
    ~ su(fiducia, 1)
    Si mette seduto. Per un momento ha di nuovo sei anni e l'armadio alto alle spalle.
    « Tout le monde le fait. » Poi, più piano: « Le mec, il a crié qu'on était pas ses ennemis. Je l'ai entendu. »
    Non dice altro. Ma non si rigira verso il muro. # ricorda: Nassim se ne ricorderà.
* [« Non. J'ai rien dit à personne. »]
    ~ su(paura, 1)
    « Wallah ? » « Wallah. »
    È la verità, ed è proprio questo il problema. Nassim si rimette a dormire, tranquillo. Tu no.
- -> mezzogiorno

// =====================================================================
=== mezzogiorno ===
# capitolo: mezzogiorno
# ora: 11:50
# img: shared/c3_assemblea
# amb: folla
A mezzogiorno siete in duecento nel cortiletto dietro la palestra, quella col tetto puntellato. Il preside ha lasciato aperto il cancello piccolo: _pour éviter les débordements_.
Bilal ha portato una cassa. Sul muretto c'è una _battle d'aura_: « Aura +1000 pour la grille ! Aura moins six-sept pour le ministre ! »
Ridono tutti. Per un minuto sembra una festa.

# ---
Poi Sacha sale sul muretto. Parla poco, come sempre.
« Le cortège officiel, c'est une balade. Les flics vous parquent, vous rentrez chez vous, et lundi, rien. Nous, on va devant. Qui veut être vu, vient avec nous. »
Nassim è in prima fila. Applaude più forte di tutti.
Adesso guardano te. Sei la delegata.
* [Parli di numeri e di pace.]
    ~ discorso = "pace"
    ~ su(fiducia, 1)
    « Si on est cent mille, on n'a pas besoin de casser. On a juste besoin d'être là. Tous. Jusqu'au bout. »
    Qualcuno fischia, molti applaudono. Il cortile vota il corteo ufficiale.
    Sacha scende dal muretto senza rancore apparente. « Comme tu veux. » Nassim non ti guarda.
* [Parli di rabbia e di dignità.]
    ~ discorso = "rabbia"
    ~ su(rabbia, 2)
    « On a été polis pendant trois semaines. Polis ! Et Maëlys a la mâchoire cassée. Ça sert à quoi, d'être polis ? »
    Il cortile esplode. Ti senti alta tre metri. Sacha ti fa un cenno, da pari a pari.
    Solo scendendo ti accorgi che non hai detto cosa fare. Hai solo acceso.
* [Passi la parola a Nassim, che vuole parlare.]
    ~ discorso = "nassim"
    ~ su(fiducia, 1)
    ~ giu(responsabilita, 1)
    Nassim sale sul muretto. Balbetta, poi trova la voce.
    « Moi j'ai quinze ans et dans ma classe y a pas de prof de maths depuis septembre. Voilà. C'est tout. »
    Un silenzio. Poi un applauso enorme. Per la prima volta in tre settimane, il cortile sta zitto per ascoltare un ragazzino.
- -> screenshot_chat

= screenshot_chat
# img: ines/02_telefono
# chat: BLOCUS DUMONT ⚡
# incrocio: X05
Bilal: MDRRR regardez ce que quelqu'un a reçu sur snap
_« wesh la team bismillah c'est les ténèbres demain on bloque a kel heure svp 🙏 jsui chaud de ouf frérot 😎 67 »_
Yasmine: c'est un keuf à 100%. aucun jeune écrit "chaud de ouf frérot" 💀
Bilal: aura -10000 pour le keuf infiltré
* [Lo inoltri ad altri tre gruppi, piangendo dal ridere.]
    ~ screenshot = "inoltrato"
    Inès: JE SUIS MORTE 💀💀 je transfère
    In quattro minuti lo screenshot ha fatto il giro di tre gruppi, poi di trenta.
* [« Faites gaffe à ce que vous écrivez ici. »]
    ~ screenshot = "avvertito"
    ~ su(paura, 1)
    Inès: rigolez mais faites gaffe. si y a des keufs dans les groupes, on dit rien de cet aprèm ici
    Bilal: ok maman 🙄
    Yasmine: non elle a raison
* [« Je le mets sur ma pancarte. »]
    ~ screenshot = "cartello"
    ~ su(fiducia, 1)
    Inès: je le mets sur ma pancarte. avec le plafond
    Yasmine: LÉGENDAIRE
- -> cartello

= cartello
# /chat
# img: ines/06_cartello
Sul cartone di una pizza scrivi in nero, a lettere storte: BISMILLAH C'EST LES TÉNÈBRES.
E sotto, più piccolo: (ET LE PLAFOND AUSSI).
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
    « T'es sérieuse, là ? » Davanti a tutti. Lo fai lo stesso.
    Sacha alza le mani. « C'est pour le gaz, la déléguée. Juste pour le gaz. »
    Ti metti il passamontagna in tasca. Nassim scende a République senza parlarti. # ricorda: Nassim se ne ricorderà.
* [Lasci fare. Ha quindici anni, non cinque.]
    ~ giu(responsabilita, 1)
    Ti ripeti che è giusto, che non sei sua madre.
    Guardi fuori dal finestrino il buio della galleria e ci vedi la tua faccia, che non ci crede.
* [Cerchi la Garnier nel vagone accanto.]
    ~ garnier_avvisata = true
    ~ su(fiducia, 1)
    La Garnier ascolta, annuisce, non fa scenate.
    « Je vais lui parler, à Sacha. C'était mon élève, tu sais. »
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
Davanti a voi qualcuno ha un megafono e una voce da stadio: « BIS-MIL-LAH ! » E duecento liceali rispondono: « C'EST LES TÉ-NÈ-BRES ! »
Un signore con il gilet giallo ride fino alle lacrime. Una signora con il cartello della CGT chiede a Yasmine cosa vuol dire. Yasmine ci pensa. « Rien. C'est ça qui est drôle. »
{ discorso == "nassim":
    Nassim cammina accanto a te. Da stamattina, dopo il cortile, ogni tanto qualcuno lo riconosce: « T'es le petit des maths ! » Lui fa finta di niente ed è felice.
- else:
    Nassim cammina dieci metri davanti a te, con quelli della boxe. Ogni tanto si gira per controllare che tu ci sia. O che tu non ci sia.
}

# img: shared/c4_applausi
# ora: 15:20
# incrocio: X07
Sul boulevard Voltaire, all'improvviso, un applauso parte da dietro e vi passa sopra come un'onda.
Sono i pompieri. Una cinquantina, in divisa, con i bracciali POMPIERS EN GRÈVE. Camminano in mezzo a voi. I ragazzi gridano: « Les pompiers avec nous ! »
Uno ha un graffio bianco sul casco. Ti riconosce. Si avvicina.

# ---
{ scuse_pompiere:
    « La fille aux mains en l'air. Ça va ? »
- else:
    Ti guarda come si guarda qualcuno che si è già visto senza ricordare dove.
}
Poi legge il tuo cartello e ride. « Le plafond aussi, hein. Chez nous c'est les camions. Trois au lieu de quatre. »
Prima di tornare tra i suoi, si china verso di te: « Ton frère. Celui du caillou. Garde-le près de toi, aujourd'hui. »
Allora l'aveva visto.

# img: ines/07_microfono
# ora: 15:35
Una giornalista con il microfono di una radio ti si para davanti. « Vous êtes lycéenne ? Vous voulez dire quelque chose ? »
* [Parli.]
    ~ microfono = true
    ~ su(fiducia, 1)
    Parli di Maëlys e della sua mascella, della palestra col tetto puntellato, del prof di matematica che non arriva da settembre.
    Non dici parolacce. Lei ti ringrazia. Per un minuto ti senti ascoltata da tutto il paese.
* [« Demandez aux autres. Moi je surveille mon frère. »]
    ~ su(responsabilita, 1)
    Lei passa a Bilal, che dice _aura moins mille pour le gouvernement_ e diventerà virale entro sera.
    Tu intanto conti le teste. Nassim c'è. Nassim c'è ancora.
- -> volantino

= volantino
# img: shared/c4_volantino
# ora: 15:40
# incrocio: X08
La Garnier risale il corteo con una pila di volantini fotocopiati. _17 OCTOBRE 1961 — 17 OCTOBRE 2026._
« Tu te souviens, Inès ? » Te lo ricordi: l'avete fatto in classe. I manifestanti algerini, la polizia, la Senna. I nomi che per quarant'anni nessuno ha voluto dire.
Ne dà uno a te, uno al pompiere, uno a chiunque. Poi lo allunga anche verso il cordone di polizia ai lati del corteo. Un agente lo guarda. Non vedi se lo prende.
{ garnier_avvisata:
    « J'ai parlé à Sacha », ti dice piano. « Il m'a dit que c'était pour le gaz. Je l'ai cru à moitié. »
}

# img: shared/c4_testa
# ora: 16:50
Verso le cinque, la testa del corteo accelera. Vedi i k-way neri, gli ombrelli aperti senza pioggia.
Vedi il cappuccio di Nassim che si allontana in mezzo a loro. { maschera_presa: Senza passamontagna. Ma con loro. }
Il telefono vibra. Nassim: _jsuis devant tkt_.
* [Lasci la classe e lo segui verso la testa.]
    ~ seguito_testa = true
    ~ su(paura, 1)
    Lasci a Yasmine il tuo pezzo di striscione. Corri controcorrente, poi con la corrente.
    Più avanzi, più la gente è vestita di nero, più l'aria sa di gas vecchio.
* [Resti con la classe e gli scrivi.]
    ~ su(fiducia, 1)
    Gli scrivi: _reviens. maintenant._ Visualizzato. Nessuna risposta.
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
    Qualcuno vicino a te grida: « Ça sert à quoi, d'être polis ? » Sono le tue parole di mezzogiorno. Adesso non sono più tue.
    ~ su(rabbia, 1)
}
{ discorso == "pace":
    « Jusqu'au bout ! Tous ! » grida qualcuno della tua classe. Sono le tue parole di mezzogiorno. Ti tengono in piedi.
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
    Ti tornano in mente le sei bottiglie di stamattina. _La pompière._
}
Hai in mano una bottiglia di plastica, quella dell'acqua per il gas. E il cordone, dall'altra parte, si muove. # timer: 9
* { paura < 8 } [« RECULEZ ! Y A DES GENS LÀ-HAUT ! »]
    ~ decisiva(1, "P", "Hai urlato alla folla di allontanarsi dal palazzo in fiamme.")
    ~ su(responsabilita, 1)
    La tua voce è una cosa piccola nel rumore. Ma Yasmine la riprende, e poi Bilal, e poi venti persone: « RECULEZ ! »
    La folla si allarga, si stacca dal palazzo. La signora alla finestra chiude le imposte.
* { paura >= 8 } [« RECULEZ ! Y A DES GENS LÀ-HAUT ! » # locked: la paura ti chiude la gola]
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
    Nassim ti vede. Smette di divincolarsi. Ti guarda come stamattina sul divano, quando ha detto _il a crié qu'on était pas ses ennemis_.
- else:
    Nassim si divincola, scalcia, urla parole che peggiorano tutto.
}
Nel fumo, accanto a te, si fa largo un uomo in divisa da pompiere, con il casco graffiato. Urla: « POMPIER ! LAISSEZ PASSER ! » # timer: 8
* { fiducia >= 4 } [Ti pianti davanti a Mehdi: « T'es du bâtiment C. Je te connais. Laisse-le. »]
    ~ decisiva(3, "P", "Hai chiamato Mehdi per nome, invece di colpirlo.")
    Mehdi si blocca. Sotto la visiera ci sono gli occhi di un ragazzo di ventisei anni che ha paura quanto te.
    « Inès ? » Solo il tuo nome. Poi la radio gracchia qualcosa che non capisci.
    Allenta la presa. Nassim scivola giù, sull'asfalto, e il pompiere è già lì.
* { fiducia < 4 } [Ti pianti davanti a Mehdi: « T'es du bâtiment C. Je te connais. Laisse-le. » # locked: non credi più che qualcuno qui possa ascoltarti]
    -> dopo
* [Ti lanci su Mehdi e lo colpisci per strappargli Nassim.]
    ~ decisiva(3, "V", "Hai colpito Mehdi per strappargli tuo fratello.")
    ~ su(rabbia, 2)
    ~ colpito_mehdi = true
    # sfx: colpo
    Lo colpisci con tutta la forza che hai: la faccia, il casco, il petto, non sai. Qualcosa ti si rompe nella mano.
    Mehdi barcolla e molla Nassim. Poi altre mani ti prendono, ti piegano, ti schiacciano la guancia sull'asfalto caldo di fuoco.
* [Corri dal pompiere: « Mon frère ! Là-bas ! »]
    ~ decisiva(3, "P", "Hai chiamato il pompiere, invece di lottare.")
    ~ su(fiducia, 1)
    Il pompiere ti guarda, guarda Nassim, e corre. Si mette tra Mehdi e il ragazzo con le mani alzate.
    « POMPIER ! Il respire mal ! Laissez-moi faire ! » Mehdi esita. Poi lo lascia.
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
    A un certo punto, senza guardarti, dice: « Les pompiers. T'avais raison. » Poi chiede altre patatine, per non dover dire altro.
}

# ---
In fondo al corridoio, con la divisa sporca di fumo, c'è il pompiere. Si chiama Jérôme, ti dice. Ha accompagnato Nassim in ambulanza.
{ scuse_pompiere:
    « Deux fois dans la même journée, la fille aux mains en l'air. »
}
« Ton frère m'a lancé un caillou ce matin. Je l'ai vu, tu sais. » Una pausa. « Je l'ai pas mis dans le rapport. »
* [« Merci. Pour lui. Et pour ce matin. »]
    Lui alza le spalle. « C'est le métier. »
    Poi, guardando il soffitto: « Enfin. C'est ce que je me dis. »
* [« Pourquoi vous l'avez pas dénoncé ? »]
    Ci pensa davvero, prima di rispondere.
    « Parce qu'à quinze ans j'ai fait pire. Et parce que ce soir, c'est moi qui l'ai porté. »
- -> maelys

= maelys
# img: shared/c6_avicenne
# ora: 22:00
Due piani più su c'è ancora Maëlys. Le infermiere ti lasciano salire cinque minuti, perché ti conoscono.
Ha la mascella fasciata e il telefono in mano. Ha visto tutto in diretta.
{ maelys_verita:
    Scrive sul telefono, perché parlare le fa male, e te lo gira: _t'es restée visible. je t'ai vue._
- else:
    Scrive sul telefono e te lo gira: _"façon de parler" hein._ Poi ti stringe la mano, forte, con la mano sana.
}
-> mamma

= mamma
# img: ines/08_mamma
# ora: 22:30
Alle 22:30 arriva la mamma, ancora in camice. Ha attraversato tutto l'ospedale correndo.
{ ha_mentito:
    Ti guarda. Non dice niente della bugia. Non serve.
    Ti abbraccia così forte che il gomito ti fa male, e ti dice all'orecchio: « Tu l'as gardé. Tu l'as gardé quand même. »
- else:
    « Tu me l'avais promis », dice. Poi vede Nassim, il gesso, la faccia gonfia ma viva.
    « Tu l'as gardé. » E piange, finalmente, lei che non piange mai.
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
Inès: lundi on revient. sans feu.
Inès: 1. des profs remplacés 2. le toit du gymnase 3. trente par classe max
Yasmine: et 4. justice pour maëlys
Inès: et 4. justice pour maëlys
Bilal: aura +infini pour la déléguée
-> epilogo_pace

= epilogo_pace
# /chat
# img: shared/c7_grata_scritta
# ora: domenica
Il giorno dopo, domenica, passi davanti al Dumont. La grata è ancora nera di fumo.
Qualcuno, nella notte, ci ha scritto sopra con lo spray bianco, a lettere enormi:
ON EST PAS VOS ENNEMIS.
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
_Garde à vue._ Ventiquattro ore, forse quarantotto. Hai diciassette anni e ti hanno tolto i lacci delle scarpe.

# incrocio: X12
Attraverso la porta senti una voce che conosci, al bancone. È la prof Garnier. Chiede di te, chiede di Nassim, scandisce i vostri nomi come all'appello. Nessuno le risponde.
Un agente passa con un caffè e dice al collega: « Bismillah, c'est les ténèbres, hein ? » Ridono.
{ colpito_mehdi:
    Un terzo agente, più giovane, non ride. Ha un cerotto sul sopracciglio. È Mehdi. Ti guarda attraverso il vetro e non dice niente.
- else:
    Un terzo agente, più giovane, non ride. Guarda il pavimento.
}

# img: ines/10_telefono_commissariato
# ora: 23:00
Alle 23 ti lasciano parlare con la mamma. Due minuti, al telefono del commissariato.
« Nassim est en réanimation. Traumatisme crânien. Ils disent qu'il va s'en sortir. Ils disent _probablement_. »
{ ha_mentito:
    Poi: « Tu m'avais dit que vous restiez au quartier. » Non è una domanda. Non c'è una risposta.
- else:
    Poi: « Tu m'avais promis de le garder. » Non urla. Sarebbe meglio se urlasse.
}
* [« Pardon, maman. »]
    « Je sais », dice. E riattacca, perché un'infermiera la sta chiamando.
* [« C'est eux qui ont commencé ! »]
    ~ su(rabbia, 1)
    Silenzio.
    « Je m'en fous de qui a commencé, Inès. Je veux savoir qui va finir. »
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
Il titolo dice: _La jeunesse en colère_. Del plafond, non dice niente.
-> END
