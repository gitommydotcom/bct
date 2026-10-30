// =====================================================================
//  SACHA LEMAIRE — il black bloc
//  "Davanti"
// =====================================================================
INCLUDE comune.ink

VAR nassim_acceso = false     // ha lasciato che fosse Nassim ad accendere il fuoco
VAR sasso_bravo = false
VAR nassim_sgridato = false
VAR coperti_ragazzi = false
VAR tom = ""                  // difeso | interrogato | cacciato
VAR madre_risposto = false
VAR assemblea = ""            // votato | lavorato | andato
VAR maschera_data = ""        // data | negata | vicino
VAR vetrina = ""              // spaccata | fermato
VAR volantino_letto = false
VAR maschera_tolta = false
VAR nassim_invitato = ""      // casa | vieni

~ personaggio = "sacha"
~ rabbia = 7
~ paura = 5
~ fiducia = 2
~ responsabilita = 4
-> alba

// =====================================================================
=== alba ===
# capitolo: alba
# ora: 04:50
# img: sacha/01_magazzino
# amb: notte
Alle 4:50 il magazzino di Aulnay ti sputa fuori con altri duecento. Gilet catarifrangente, schiena a pezzi, otto ore a impilare pacchi di gente che dorme.
Nel parcheggio ti togli il gilet e lo pieghi nello zaino. Sotto il gilet c'è una felpa nera. Sotto la felpa, il passamontagna arrotolato sul collo.
Due vite in un parcheggio. Nessuna delle due ti chiede come stai.

# img: sacha/02_telefono
# chat: LYNX
Karim: cassonettes ok rue de la Folie
Lou: les petits sont déjà là. ils sont chauds
Karim: le petit Haddad aussi. il veut "aider" 😂
Lou: sacha tu ramènes quoi
* [« Rien. Mes mains. »]
    Sacha: rien. mes mains
    Lou: ok le moine
* [« Les lunettes et le sérum phy. Pour les petits. »]
    ~ su(responsabilita, 1)
    Sacha: lunettes + sérum phy. pour les petits
    Karim: maman sacha 🥹
- -> grata

= grata
# /chat
# img: shared/c1_grata
# ora: 06:02
# amb: folla
Davanti al Dumont. Il tuo vecchio liceo. Ci sei uscito con la maturità nel 2021 e una rabbia che non sapevi ancora dove mettere.
Spingete i cassonetti giù per la rue de la Folie. Le ruote urlano. Nassim spinge il suo da solo, a quindici anni, fiero come se portasse una bara.
I ragazzi del blocco vi guardano arrivare. Davanti a loro c'è la delegata, la sorella di Nassim. Inès.

# incrocio: X01
« Salut, la déléguée. On vous a ramené des meubles. »
Inès non ride. « Pas de feu. »
Karim ti guarda. Lou ti guarda. Nassim ti guarda di più.
* [« Pas de feu. C'est leur blocus. »]
    ~ su(fiducia, 1)
    ~ giu(rabbia, 1)
    Lo dici forte, perché lo sentano tutti. Karim alza gli occhi al cielo. Inès ti fa un cenno breve, sorpreso.
    Rispettare qualcuno costa poco. Costa solo quello che volevi fare.
    -> fuoco_altri
* [Accendi lo stesso, appena lei si gira.]
    ~ su(rabbia, 1)
    -> fuoco_tuo
* [Dai l'accendino a Nassim.]
    ~ nassim_acceso = true
    ~ giu(responsabilita, 2)
    -> fuoco_nassim

= fuoco_altri
# img: shared/c1_fuoco
# ora: 06:20
# fx: fumo
# amb: fuoco
Alle 6:20 il cassonetto prende fuoco lo stesso. Non sei stato tu. Uno dei piccoli, uno qualsiasi, con un accendino rosa.
Lo vedi e non dici niente. Le regole valgono finché nessuno le infrange, poi sono solo una cosa che avevi detto.
-> camion

= fuoco_tuo
# img: shared/c1_fuoco
# ora: 06:20
# fx: fumo
# amb: fuoco
Alle 6:20 accendi. È facile, è sempre facile: per questo è pericoloso.
L'arancio sale. Trenta telefoni si alzano. Inès si gira e ti guarda come si guarda un tradimento piccolo, di quelli che si ricordano.
-> camion

= fuoco_nassim
# img: shared/c1_fuoco
# ora: 06:20
# fx: fumo
# amb: fuoco
Gli metti l'accendino in mano. Nassim lo guarda come un regalo di compleanno.
Alle 6:20 il cassonetto prende fuoco e Nassim fa un passo indietro, poi un passo avanti, poi ride. Ha gli occhi pieni di arancio.
Gli hai insegnato a tenere la guardia alta. Adesso gli hai insegnato anche questo. # ricorda: Nassim se ne ricorderà.
-> camion

= camion
# img: shared/c1_camion
# ora: 06:45
# sfx: sirena
Alle 6:45 arriva un camion dei pompieri. SDIS 77: rinforzi da fuori, la Brigata di Parigi non ce la fa più.
Si ferma a venti metri. Scendono in due.

# img: shared/c1_camion
# ora: 06:48
# sfx: vetro
# incrocio: X02
Nassim ha un sasso in mano. Lo vedi un secondo prima. Avresti il tempo.
Il parabrezza si stella con un rumore secco. Nassim torna dietro il cassonetto e cerca i tuoi occhi.
Cerca un voto.
* [« Bien joué, petit. »]
    ~ sasso_bravo = true
    ~ su(rabbia, 1)
    ~ giu(responsabilita, 1)
    Gli batti una mano sulla spalla. Nassim cresce di dieci centimetri.
    Ti dici che il camion è dello Stato, che lo Stato vi tira addosso di peggio. Ti suona bene. Ti suona come una cosa che hai già detto troppe volte. # ricorda: Nassim se ne ricorderà.
* [« Pas les pompiers. Jamais les pompiers. »]
    ~ nassim_sgridato = true
    ~ su(responsabilita, 1)
    Lo prendi per il bavero, non forte. « T'as compris ? Jamais. Ils sont avec nous, eux. »
    Nassim abbassa gli occhi. Per un secondo sei di nuovo l'allenatore e lui l'allievo che ha fatto un errore di guardia.
* [Lo trascini via prima che arrivino i blu.]
    ~ su(paura, 1)
    Lo prendi per il cappuccio e lo porti dietro l'angolo. Non gli dici niente. Gli insegni solo a sparire.
    È la cosa che sai fare meglio.
- -> grido

= grido
# img: shared/c1_pompiere
# incrocio: X03
Il pompiere più grande scende senza casco. Ha un graffio bianco nuovo sulla vernice. Guarda i ragazzi, guarda te.
« ON EST PAS VOS ENNEMIS ! »
La voce rimbalza sulle facciate. Qualcuno ride. Qualcuno smette di ridere.
* [Abbassi lo sguardo.]
    ~ giu(rabbia, 1)
    Abbassi lo sguardo. Hai ventitré anni e ti senti sgridato da un uomo che non conosci.
    Non è vergogna. È peggio: è che ha ragione su una cosa, e tu ne avevi dette mille.
* [« Alors qu'est-ce que vous foutez là ? »]
    ~ su(rabbia, 1)
    Il pompiere ti guarda a lungo. « On éteint. C'est tout ce qu'on sait faire. »
    Poi rimette il casco. Non hai vinto niente.
- -> sgombero

= sgombero
# img: shared/c1_sgombero
# ora: 07:10
# fxoff: fumo
# fx: lampeggianti
# amb: sirene
Alle 7:10 i furgoni. Tre. Le luci blu sui muri del tuo vecchio liceo.
Gli agenti scendono in fila, scudi, caschi, ginocchiere. I piccoli si stringono gli uni agli altri. Karim ha già una pietra in mano.
È adesso. Quello per cui dici di esserci.
* [Tiri.]
    ~ su(rabbia, 2)
    ~ giu(fiducia, 1)
    # sfx: colpo
    La pietra va. Altre la seguono. Lo scudo la ferma con un rumore di tamburo.
    Il cordone accelera. Sono i piccoli, non voi, a prendere la carica: voi sapete correre, loro no.
* [Ti metti tra gli scudi e i ragazzi, a mani vuote.]
    ~ coperti_ragazzi = true
    ~ su(paura, 2)
    ~ su(responsabilita, 2)
    ~ su(fiducia, 1)
    Ti metti in mezzo. Mani aperte, all'altezza del petto. Il passamontagna ancora sul collo: ti vedono la faccia.
    Uno scudo ti spinge, ti fa arretrare di un metro. Non cadi. Dietro di te i piccoli arretrano piano, senza correre, senza cadere. # ricorda: Un agente si ricorderà la tua faccia.
* [Sparisci nel quartiere.]
    ~ su(paura, 1)
    ~ giu(responsabilita, 1)
    Ti alzi il cappuccio e sparisci tra i palazzi. Conosci ogni cortile, ogni porta con il codice rotto.
    Da una finestra del palazzo C guardi lo sgombero come un film. I piccoli corrono male.
- -> prof

= prof
# img: shared/c1_grata_vuota
# ora: 07:45
# fxoff
# amb: silenzio
Alle 7:45 la grata è libera. Dalla folla dei prof in sciopero senti una voce che conosci: la Garnier, la prof di storia, che chiama un agente per nome. « Mehdi ? »
Mehdi Saïdi. Il figlio del palazzo C, uno che giocava a calcio con te. Adesso porta il casco dall'altra parte.
Ti viene da ridere. Ti viene da vomitare. Fai tutte e due le cose in un cortile, da solo.
-> mattina

// =====================================================================
=== mattina ===
# capitolo: mattina
# ora: 09:30
# img: sacha/03_appartamento
# amb: interno
L'appartamento di Lou, a Pantin. Caffè solubile, ombrelli neri appoggiati al muro, occhialini da piscina in una scatola da scarpe.
Nessuno dorme. Tutti guardano i telefoni. I video dell'alba hanno già trentamila visualizzazioni.

# img: sacha/02_telefono
# chat: LYNX
# incrocio: X05
Karim: vous avez vu le truc "bismillah c'est les ténèbres"
Karim: un keuf qui se fait passer pour un lycéen sur snap 💀
Lou: ça veut dire qu'ils lisent les groupes
Lou: ça veut dire qu'ils lisent CE groupe peut-être
Karim: au fait c'est qui "Tom" ? il est arrivé lundi
Tom: …moi ? je suis en fac à Saint-Denis. c'est Lou qui m'a ajouté
* [« Lâchez-le. On devient quoi, si on se méfie de tout le monde ? »]
    ~ tom = "difeso"
    ~ su(fiducia, 2)
    Sacha: lâchez le. si on se méfie de tout le monde on devient eux
    Tom: merci
    Karim: ok mais si demain on se fait serrer c'est toi qu'on appelle 🙃
* [Lo interroghi: « T'es dans quelle fac ? Quel prof ? Quelle salle ? »]
    ~ tom = "interrogato"
    ~ su(rabbia, 1)
    Sacha: t'es en quelle année. quel prof. quelle salle.
    Tom: L2 socio. Mme Achour. salle B204. je peux t'envoyer ma carte étudiante si tu veux
    Tom: c'est chaud ce que vous faites là
* [« Dehors. Pas de risque. »]
    ~ tom = "cacciato"
    ~ giu(fiducia, 1)
    ~ su(paura, 1)
    Sacha: dehors. désolé. pas de risque
    Tom ha lasciato il gruppo.
    Lou: c'était mon cousin, connard
- -> ricordo

= ricordo
# /chat
# img: sacha/04_furgone
# ora: 10:15
# amb: notte
Lou dice _infiltrati_ e la stanza si restringe.
Hai diciassette anni. Il pavimento di un furgone, la guancia schiacciata sulla gomma che puzza di piedi. Un ginocchio sulla schiena, una voce sopra: _Les noms. Donne-nous les noms et tu rentres chez ta mère._
Li hai dati. Tre nomi. Sei tornato da tua madre. Uno dei tre ha fatto sei mesi.
Nessuno lo sa. È per questo che stai sempre davanti: perché davanti nessuno ti chiede niente.

# img: sacha/03_appartamento
# ora: 10:40
# amb: interno
Il telefono vibra. _Maman._ Non chiama mai di sabato. Lavora alle pulizie in un ospedale, il sabato fa le scale.
* [Rispondi.]
    ~ madre_risposto = true
    ~ giu(rabbia, 1)
    « Sacha. Je t'ai vu dans une vidéo. Le feu devant ton ancien lycée. C'était toi ? »
    « Non, maman. » Non sai se è una bugia. Davanti a lei, tutto è un po' una bugia.
    « Fais attention à toi. Et aux petits. » Lei sa. Lei sa sempre, senza nomi.
* [Lasci squillare.]
    ~ su(rabbia, 1)
    Lasci squillare. Una, due, sei volte. Poi un messaggio vocale che non ascolterai.
    Lou ti guarda. « Ta mère ? » « Le boulot. » Lou non ci crede, ma non chiede. È la regola.
- -> preparativi

= preparativi
# img: sacha/03_appartamento
# ora: 11:00
Lou distribuisce le cose sul tavolo come un'infermiera: siero fisiologico, occhialini, k-way, un rotolo di nastro, tre ombrelli.
Karim ha portato uno zaino che nessuno apre. Tutti sanno cosa c'è dentro. Nessuno lo dice, così non c'è.
Il telefono vibra. È Nassim. Nella foto del profilo ha i guantoni che gli hai regalato a Natale.

# img: sacha/02_telefono
# chat: Nassim 🥊
Nassim: t'es où ?
Nassim: je viens avec vous cet aprèm hein 💪
* [« Non. Toi tu restes avec ta sœur. »]
    ~ nassim_invitato = "casa"
    ~ su(responsabilita, 1)
    Sacha: non. toi tu restes avec ta sœur
    Nassim: t'es sérieux
    Nassim: tout le monde y va
    Sacha: tout le monde c'est pas toi
* [« Viens. Mais tu fais ce que je dis. »]
    ~ nassim_invitato = "vieni"
    ~ giu(responsabilita, 1)
    Sacha: viens. mais tu fais ce que je dis
    Nassim: WALLAH 🔥🔥🔥
    Nassim: je savais que t'étais un vrai
- -> mezzogiorno

// =====================================================================
=== mezzogiorno ===
# /chat
# capitolo: mezzogiorno
# ora: 11:50
# img: shared/c3_assemblea
# amb: folla
L'assemblea nel cortile del Dumont. Duecento ragazzi, una cassa, le _battles d'aura_ sul muretto. Tu sali sul muretto. Parli poco, come sempre.
« Le cortège officiel, c'est une balade. Les flics vous parquent, vous rentrez, et lundi, rien. Nous, on va devant. Qui veut être vu, vient avec nous. »
Nassim applaude più forte di tutti. { nassim_invitato == "casa": Applaude anche se gli hai detto di no. Soprattutto per quello. } Poi parla Inès.
Inès dice di restare nel corteo ufficiale. Dice _jusqu'au bout, tous_. Il cortile vota per lei.
* [Accetti il voto.]
    ~ assemblea = "votato"
    ~ su(fiducia, 1)
    ~ giu(rabbia, 1)
    « Comme tu veux. » E lo pensi, quasi.
    Scendi dal muretto. Davanti andrete in pochi, solo voi grandi. I piccoli resteranno dietro. Era quello che volevi, no?
* [Lavori i ragazzi uno per uno, dopo il voto.]
    ~ assemblea = "lavorato"
    ~ giu(responsabilita, 2)
    ~ su(rabbia, 1)
    Il voto è il voto. Poi però ci sono i corridoi, i telefoni, le pacche sulle spalle. « Toi t'as l'air solide. Viens devant. »
    Ne convinci undici. Il più giovane ha quattordici anni. # ricorda: Undici ragazzi ti seguiranno davanti.
* [Te ne vai senza dire niente.]
    ~ assemblea = "andato"
    ~ su(paura, 1)
    Te ne vai prima della fine. Non sei venuto per perdere un voto contro una ragazzina di diciassette anni che ha ragione.
- -> metro

= metro
# img: shared/c3_metro
# ora: 13:10
# amb: metro
# incrocio: X06
Linea 5. Il vagone è pieno di cartelli e di risate. Nassim si fa largo fino a te.
« Sacha. T'en as un pour moi ? » Indica il passamontagna in più che ti esce dalla tasca. Lo sa, che ne porti sempre due.
In fondo al vagone vedi la Garnier, la tua vecchia prof. E Inès, che vi guarda.
* [Glielo dai. « C'est pour le gaz. Juste pour le gaz. »]
    ~ maschera_data = "data"
    ~ giu(responsabilita, 1)
    Glielo passi come si passa una sigaretta. Nassim se lo ficca in tasca.
    Inès attraversa il vagone come un temporale. Non le dici niente. Guardi la galleria.
* [« Non. Rentre chez toi après Nation. »]
    ~ maschera_data = "negata"
    ~ su(responsabilita, 1)
    ~ giu(fiducia, 1)
    Nassim ti guarda come se l'avessi colpito. « T'es comme ma sœur. »
    Gli dici di sì, che sei come sua sorella. Ti dà una spinta e torna dai suoi. La Garnier ti fa un cenno da lontano, uno di quelli che a scuola volevano dire _bien_.
* [Glielo dai, ma gli fai promettere di restarti vicino.]
    ~ maschera_data = "vicino"
    ~ su(responsabilita, 1)
    « Tu restes collé à moi. Tu cours quand je cours. Tu t'arrêtes quand je m'arrête. Promis ? » « Wallah. »
    Lo tieni d'occhio fino a République. È più facile proteggere qualcuno che dirgli di no. # ricorda: Nassim ti resterà vicino.
- -> pomeriggio

// =====================================================================
=== pomeriggio ===
# capitolo: pomeriggio
# ora: 14:20
# img: shared/c4_republique
# amb: folla
République. Gilet gialli, sindacati, infermiere, nonni. Tutti quelli che ti hanno detto per anni che la violenza non serve a niente, oggi sono qui perché tre settimane di licei bloccati sono servite.
Non sai cosa pensarne. Ti fa piacere e ti fa rabbia insieme.
Lou ti passa una lattina. « Regarde. Même les profs. Même les pompiers. » Indica uno striscione: POMPIERS EN GRÈVE.

# ---
# ora: 14:50
Vi spostate in testa, a gomitate gentili. La gente si apre al vostro passaggio, un po' per rispetto e un po' per paura. È la stessa cosa, vista da fuori.
Ai lati del boulevard Voltaire, il cordone. Caschi, visiere abbassate. In uno dei caschi ti sembra di riconoscere Mehdi. Ti sembra di riconoscerlo in tutti.
{ coperti_ragazzi:
    Uno degli agenti ti fissa più a lungo degli altri. Ti ha visto stamattina, a mani vuote davanti alla grata. Non sai se è un bene.
}

# ora: 15:20
# img: shared/c4_testa
# fx: fumo
# amb: folla
In testa al corteo, sul boulevard Voltaire. Ombrelli neri aperti senza pioggia, k-way, occhialini. Ai lati, il cordone che vi accompagna come un recinto mobile.
# incrocio: X07
Dietro di voi parte un applauso enorme: stanno arrivando i pompieri in sciopero. I ragazzi gridano _les pompiers avec nous_. Tu non ti giri.
Ti metti il passamontagna. Il mondo diventa una fessura.

# img: sacha/05_vetrina
# ora: 15:55
Una banca, all'angolo con la rue de la Roquette. La vetrina riflette tutti voi: neri, uguali, enormi.
Un ragazzino col cappuccio raccoglie un pezzo di pavé. Avrà quattordici anni. { assemblea == "lavorato": È uno dei tuoi undici. }
* [Spacchi tu la vetrina, prima di lui.]
    ~ vetrina = "spaccata"
    ~ su(rabbia, 1)
    # sfx: vetro
    Il vetro viene giù in una cascata bianca. È bellissimo per un secondo, come tutte le cose rotte.
    Il cordone si gira verso di voi. Il ragazzino ti guarda come si guarda un eroe. Peggio.
* [Gli fermi il braccio.]
    ~ vetrina = "fermato"
    ~ su(responsabilita, 1)
    ~ giu(rabbia, 1)
    Gli fermi il braccio. « Pas toi. Pas pour une vitrine. »
    Lui ti guarda come se fossi pazzo. Forse lo sei: sei vestito di nero dalla testa ai piedi e stai salvando una banca.
- -> volantino

= volantino
# img: sacha/06_volantino_terra
# ora: 16:30
# incrocio: X08
Per terra, calpestato, un volantino fotocopiato. _17 OCTOBRE 1961 — 17 OCTOBRE 2026._ La calligrafia della Garnier sul margine: _Ni oubli, ni pardon_.
* [Lo raccogli e lo leggi.]
    ~ volantino_letto = true
    ~ su(fiducia, 1)
    Lo leggi camminando. Duecento morti, forse più. Buttati nella Senna dal ponte Saint-Michel. Una notte che per quarant'anni non è esistita.
    Pensi ai nomi. A quelli che nessuno ha detto, a quelli che tu hai detto. Lo pieghi in quattro e lo metti nella tasca del passamontagna.
* [Lo lasci lì.]
    Lo lasci lì. La storia la fanno i vivi, ti dici. Poi pensi che anche quelli del '61 erano vivi, la mattina.
- -> scontro

// =====================================================================
=== scontro ===
# capitolo: scontro
# ora: 17:20
# img: shared/c5_nation
# amb: sirene
Place de la Nation. La colonna, le statue di bronzo, e dal lato del cours de Vincennes il muro di scudi.
Tu sei davanti. È quello che volevi. Da qui si vedono le loro visiere e non si vede più niente di quello che c'è dietro di te.
{ maschera_data == "vicino":
    Nassim è attaccato al tuo gomito, come promesso.
- else:
    Cerchi Nassim con gli occhi. Lo trovi: dieci metri più in là, con quelli della boxe.
}

# img: shared/c5_gas
# ora: 17:26
# sfx: lacrimogeno
# fx: gas
Il primo lacrimogeno. Gli occhialini da piscina tengono. Il passamontagna no: il gas ci passa attraverso come se non ci fosse.
I piccoli tossiscono, ridono, tossiscono. { maschera_data == "negata": Nassim tossisce più forte di tutti: non ha niente sulla faccia. }
Lou ti grida qualcosa. Karim ti fa segno: il cassonetto.

# img: shared/c5_cassonetto
# ora: 17:34
# fx: fumo
# amb: fuoco
# incrocio: X09
Il piano è semplice e l'hai fatto tu, ieri sera, al telefono: un cassonetto in fiamme davanti al cordone, per fermare la carica e proteggere i piccoli.
Karim e Lou lo trascinano all'angolo del cours de Vincennes. Sotto un palazzo. Al piano terra c'è una farmacia. Al primo piano, alla finestra, una signora anziana in vestaglia.
L'accendino è nella tua mano. { nassim_acceso: Lo stesso che hai dato a Nassim stamattina. } Il cordone si muove. # timer: 8
* [Lo accendi.]
    ~ decisiva(1, "V", "Hai acceso il cassonetto sotto il palazzo abitato.")
    ~ su(rabbia, 1)
    Lo accendi. Il fuoco sale con un soffio, più veloce di quanto pensavi. Il fumo sale dritto verso il primo piano.
    La signora non si muove dalla finestra. Forse non capisce. Forse capisce troppo bene.
* { responsabilita >= 4 } [Lo spingi in mezzo alla strada, lontano dalle finestre.]
    ~ decisiva(1, "P", "Hai spinto il cassonetto lontano dal palazzo prima che bruciasse.")
    ~ su(responsabilita, 1)
    « Pas là ! Y a des gens ! » Spingi. Karim ti guarda come se fossi impazzito, poi spinge anche lui.
    Il cassonetto rotola fino al centro dell'incrocio, lontano dalle finestre. Qualcun altro lo accende lì. Il fumo sale nel vuoto.
* { responsabilita < 4 } [Lo spingi in mezzo alla strada, lontano dalle finestre. # locked: oggi hai smesso di pensare agli altri]
    -> carica
* [Te ne vai. # timeout]
    ~ decisiva(1, "F", "Te ne sei andato mentre accendevano il cassonetto.")
    ~ su(paura, 1)
    Ti giri e te ne vai. Dietro di te, qualcun altro accende. Il fumo sale verso il primo piano.
    Non sei stato tu. È la frase che ti dirai stanotte, e non funzionerà.
- -> carica

= carica
# img: shared/c5_carica
# ora: 17:39
# sfx: colpo
La carica. Gli scudi avanzano di trenta metri in pochi secondi. La folla si rovescia all'indietro.
Qualcuno ti mette in mano una cosa pesante, cilindrica, con la miccia: un mortaio d'artificio. « Vas-y, Sacha. Toi t'as le bras. »
# sfx: granata
# flash
Uno parte da qualche parte alla tua destra ed esplode contro gli scudi in scintille verdi. Il tuo è ancora nella tua mano.

# img: shared/c5_granata
# ora: 17:42
# sfx: granata
# flash
# incrocio: X10
Poi la granata. Rotola sull'asfalto tra le scarpe, esplode con uno schiaffo d'aria che ti rimbomba nei denti.
Quando ti rialzi, Nassim è a terra accanto al cassonetto in fiamme. { maschera_data == "data" || maschera_data == "vicino": Ha il tuo passamontagna sulla faccia. } Sopra di lui, un casco.
Il mortaio è nella tua mano. Il cordone è a quindici metri. # timer: 8
* [Lo punti verso il cordone.]
    ~ decisiva(2, "V", "Hai puntato il mortaio contro il cordone, con Nassim a terra lì in mezzo.")
    ~ su(rabbia, 2)
    # sfx: granata
    # flash
    Parte. Esplode a un metro dagli scudi, tra gli scudi e Nassim. Le scintille piovono anche su di lui.
    Il cordone risponde come risponde sempre: più forte.
* [Lo lasci cadere e corri da Nassim.]
    ~ decisiva(2, "P", "Hai lasciato cadere il mortaio e sei corso da Nassim.")
    ~ su(responsabilita, 1)
    ~ su(paura, 1)
    Lo lasci cadere. Rotola via, spento, inutile. Corri.
    Per la prima volta in vita tua corri verso gli scudi senza niente in mano.
* [Resti dove sei. # timeout]
    ~ decisiva(2, "F", "Sei rimasto fermo con il mortaio in mano.")
    ~ su(paura, 1)
    Resti lì con il mortaio in mano come un idiota con un mazzo di fiori. Qualcuno te lo strappa e corre via.
- -> mano

= mano
# img: shared/c5_mano
# ora: 17:44
# fx: fumo
# incrocio: X11
Un agente tiene Nassim per il cappuccio e lo trascina verso il cordone. Si gira: è Mehdi Saïdi. Il palazzo C.
{ coperti_ragazzi:
    Mehdi ti guarda. Ti riconosce: stamattina eri quello con le mani vuote davanti alla grata.
}
{ sasso_bravo:
    Nassim grida: « Sacha ! Sacha, aide-moi ! » Lo dice come stamattina diceva _t'as vu ?_ dopo il sasso.
}
{ nassim_sgridato:
    Nel fumo, un pompiere in divisa da sciopero si fa largo urlando « POMPIER ! ». Nassim lo vede e smette di scalciare. _Jamais les pompiers._ Gliel'hai detto tu.
- else:
    Nel fumo, un pompiere in divisa da sciopero si fa largo urlando « POMPIER ! ».
}
Il pompiere non arriverà in tempo. Tu sì. # timer: 8
* [Ti butti su Mehdi per strappargli Nassim.]
    ~ decisiva(3, "V", "Ti sei buttato su Mehdi per strappargli Nassim.")
    ~ su(rabbia, 2)
    # sfx: colpo
    Lo colpisci alla schiena con tutto il peso. Mehdi cade su Nassim. Il casco di Mehdi colpisce la testa di Nassim sull'asfalto, un rumore che non dimenticherai.
    Poi le mani, gli scudi, i manganelli. Ti divincoli. Scappi. Lasci Nassim lì sotto.
    -> dopo
* { fiducia >= 3 } [Ti togli il passamontagna. « Prends-moi. Lui, c'est un gosse. »]
    ~ decisiva(3, "P", "Ti sei tolto la maschera e ti sei consegnato al posto di Nassim.")
    ~ maschera_tolta = true
    -> maschera
* { fiducia < 3 } [Ti togli il passamontagna. « Prends-moi. Lui, c'est un gosse. » # locked: non ti fidi abbastanza di nessuno per mostrarti]
    -> dopo
* [Scappi. # timeout]
    ~ decisiva(3, "F", "Sei scappato lasciando Nassim all'agente.")
    ~ su(paura, 1)
    Scappi. Lo sai fare meglio di tutti. Le gambe decidono prima di te, come a diciassette anni.
    Dietro di te Nassim chiama il tuo nome, una volta. Poi non lo chiama più.
    -> dopo

= maschera
Le dita sul bordo del passamontagna. Tutti i telefoni della piazza. Tutte le telecamere. La tua faccia. # mini: maschera
* [ok # ok]
    Lo tiri via. La faccia nuda nel gas, gli occhi che bruciano. Mehdi ti vede. Tu vedi lui.
    « Prends-moi. Lui, c'est un gosse. » { volantino_letto: Nella tasca del passamontagna, piegato in quattro, c'è ancora il volantino. _Ni oubli._ }
    Mehdi esita un secondo che dura un anno. Poi molla il cappuccio di Nassim e prende il tuo braccio. Il pompiere arriva e si china su Nassim.
* [ko # ko]
    Le dita non ti obbediscono. Il passamontagna resta a metà, sulla bocca, come un bavaglio.
    Ti metti in ginocchio davanti a Mehdi lo stesso, le mani dietro la testa. « Prends-moi. » Mehdi ti guarda, guarda Nassim. Molla il ragazzo e ti prende. Il pompiere arriva e si china su Nassim.
- -> dopo

= dopo
# img: shared/c5_vuota
# ora: 17:52
# fxoff: gas
# amb: sirene
Alle 17:52 la piazza si svuota. Scarpe spaiate, cartelli, il volantino del 1961 calpestato. Il cassonetto è nero e fuma.
{ d1 == "P":
    Il palazzo all'angolo è intatto. Al primo piano, le imposte sono chiuse.
- else:
    Al primo piano la finestra è spalancata e nera di fumo. Due pompieri della Brigata salgono con la scala.
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
# img: shared/c6_commissariato
# fxoff
# amb: interno
{ maschera_tolta:
    Commissariato del 12°. Hai i polsi legati con le fascette e la faccia nuda. Ti hanno fotografato da tre lati.
- else:
    Ti hanno preso in rue des Pyrénées, cento metri dopo. Commissariato del 12°. Hai i polsi legati con le fascette.
}
_Garde à vue._ Partecipazione a un raggruppamento in vista di violenze. Lo dicono come si dice il meteo.
Ti chiedono i nomi. Lou, Karim, gli altri. Il gruppo Signal. Chi ha portato cosa.

# incrocio: X12
Sei di nuovo sul pavimento del furgone, a diciassette anni. La voce è un'altra, la domanda è la stessa.
« Les noms, et tu rentres chez ta mère. »
* [Non dici niente.]
    ~ su(responsabilita, 1)
    Non dici niente. Per sei ore. Per dodici. Ti chiedono i nomi in tutti i modi possibili, gentili e no.
    Non dici niente. Non è coraggio. È solo che stavolta sai quanto pesa l'altra cosa.
* [Dici solo il tuo nome. Due volte.]
    « Sacha Lemaire. » « On sait. Les autres. » « Sacha Lemaire. »
    L'agente sospira e chiude il fascicolo. Fuori, al bancone, senti la voce della Garnier che chiede dei suoi alunni, uno per uno, come all'appello.
- -> avvocata

= avvocata
# img: shared/c6_commissariato
# ora: 22:30
Alle 22:30 arriva l'avvocata del collettivo, Maître Benarbia, con un trench bagnato e un sacchetto di biscotti che le guardie le fanno lasciare all'ingresso.
« T'as rien dit ? » « Rien. » « Bien. » Si siede. « Le petit Haddad a dit à sa sœur que tu l'as sorti de là. Elle va témoigner. »
Non sai cosa rispondere. Nessuno ha mai testimoniato per te. Hai sempre pensato che fosse il contrario: tu che non testimoni per nessuno.
-> cella

= cella
# img: sacha/07_cella
# ora: 23:40
# amb: notte
Nel corridoio due agenti ridono. « Bismillah, c'est les ténèbres, hein ? » Uno imita l'accento. L'altro ride più forte.
Un terzo non ride. Riconosci la sua voce: è Mehdi. Dice soltanto: « Le gamin. Il est à Avicenne. Poignet cassé. Il va bien. »
Non sai se lo dice a te. Lo dice abbastanza forte perché tu lo senta.
{ tom == "difeso":
    In tasca, nel telefono sequestrato, c'è ancora il messaggio di Tom: _merci_. Domani ti farà ridere che fosse proprio Tom l'unico a scriverti.
}
{ madre_risposto:
    Pensi a tua madre che ha detto _fais attention aux petits_. Ci hai fatto attenzione. Una volta, almeno.
}
-> notte_pace

= notte_pace
# capitolo: notte
# ora: 03:00
# img: sacha/07_cella
Alle tre di notte, sulla panca della cella, ti addormenti per la prima volta da due giorni.
Ti processeranno. Forse sei mesi con la condizionale, forse di più. L'avvocata del collettivo dice che la faccia nuda nel video ti salverà o ti fotterà, dipende dal giudice.
Per la prima volta non hai fatto nomi. Per la prima volta non sei scappato.

# img: sacha/08_palestra
# ora: domenica
Il giorno dopo, alla palestra di boxe del quartiere, la porta è aperta.
Nassim è seduto sul bordo del ring con il gesso al polso. Non dice niente.
Ti tende i guantoni.
-> END

// =====================================================================
=== sera_violenza ===
# capitolo: sera
# ora: 19:30
# img: sacha/09_portone
# fxoff
# amb: sirene
Rue des Pyrénées. Un portone con il codice rotto, come quelli del quartiere. Ti togli tutto: k-way, passamontagna, occhialini. Sotto hai la felpa di un'altra vita.
Esci con le mani in tasca. Un ragazzo qualunque che torna a casa. Lo sai fare benissimo.

# img: sacha/10_kebab
# ora: 21:10
# amb: interno
In un kebab di Ménilmontant, il televisore sopra il frigo delle bibite. Il video gira in loop: Nation, il fumo, la finestra del primo piano.
{ d1 == "V":
    La signora del primo piano è stata portata via dalla Brigata. Intossicata. Settantanove anni. Il tuo accendino.
- else:
    La signora del primo piano è stata portata via dalla Brigata. Intossicata. Settantanove anni. Il piano era tuo.
}
Poi il ragazzo a terra. { maschera_data == "data" || maschera_data == "vicino": Con un passamontagna nero sulla faccia. Il tuo. } Trauma cranico, dice la giornalista. Quindici anni.
{ vetrina == "spaccata":
    Poi una vetrina di banca che esplode in una cascata bianca. Il ragazzo nero che la spacca sei tu. Nessuno potrebbe riconoscerti. Tu sì.
}

# img: sacha/02_telefono
# chat: LYNX
Lou: vous êtes où
Karim: chez moi. sacha t'es vivant ?
Karim: le petit Haddad est en réa
Lou: c'est le feu qui a tout fait partir. c'était le plan de qui le feu ?
* [« C'était mon plan. »]
    Sacha: c'était mon plan
    Lou: ok
    Nessun altro scrive. Il silenzio di una chat è il rumore più forte che conosci.
* [Esci dal gruppo.]
    Hai lasciato il gruppo.
    Lo fai in un secondo. È più facile di un sasso, più facile di un accendino. Sparire è sempre stato facile.
- -> notte_violenza

= notte_violenza
# /chat
# capitolo: notte
# ora: 02:20
# img: sacha/02_telefono
# amb: notte
Alle due di notte cancelli tutto. Le foto, i video, le chat, il gruppo, le note vocali di tua madre che non hai mai ascoltato.
{ tom == "cacciato":
    Ti chiedi se fosse Tom, l'infiltrato. Poi ti ricordi che era il cugino di Lou, e che il piano del fuoco l'hai scritto tu, in quella chat. Non serviva nessun infiltrato.
}
{ nassim_acceso:
    L'ultima foto prima di cancellare: Nassim all'alba, con l'accendino in mano, gli occhi pieni di arancio. La guardi a lungo. La cancelli.
}

# img: sacha/11_canale
# ora: domenica
Il giorno dopo, all'alba, sei sul canale dell'Ourcq. Non hai dormito.
In tasca c'è ancora il passamontagna in più, quello che porti sempre per i piccoli. { maschera_data == "data" || maschera_data == "vicino": No. Quello ce l'ha Nassim. In tasca hai il tuo. }
Lo butti nell'acqua. Galleggia per un po', nero sull'acqua grigia, come una cosa che non vuole andarsene.
-> END
