// =====================================================================
//  EPILOGO CORALE — "Lunedì 2 novembre"
//  Si sblocca dopo aver finito i cinque personaggi.
//  Il motore imposta esito_<personaggio> = "PACE" | "VIOLENZA" prima di cominciare.
// =====================================================================

VAR esito_ines = "PACE"
VAR esito_sacha = "PACE"
VAR esito_jerome = "PACE"
VAR esito_odile = "PACE"
VAR esito_mehdi = "PACE"
VAR esito = "PACE"

-> lunedi

=== function quante_paci()
~ temp n = 0
{ esito_ines == "PACE":
    ~ n = n + 1
}
{ esito_sacha == "PACE":
    ~ n = n + 1
}
{ esito_jerome == "PACE":
    ~ n = n + 1
}
{ esito_odile == "PACE":
    ~ n = n + 1
}
{ esito_mehdi == "PACE":
    ~ n = n + 1
}
~ return n

=== lunedi ===
# capitolo: Lunedì 2 novembre
# ora: 07:55
# img: shared/c8_grata_lunedi
# amb: folla
Lunedì 2 novembre, 7:55. Il primo giorno dopo la Toussaint. Il Lycée Ernestine-Dumont riapre.
La grata è stata ridipinta di verde in fretta, durante le vacanze. Sotto la vernice, se ci si mette di sbieco, si legge ancora qualcosa.
Hai vissuto quel sabato cinque volte. Questo è il lunedì che ne viene fuori.

# img: shared/c8_grata_lunedi
{ esito_ines == "PACE":
    Inès arriva per prima, con la lista delle richieste stampata in trenta copie. Nassim le cammina accanto con il gesso al polso, firmato da mezza scuola.
- else:
    Inès arriva tardi, accompagnata dalla madre ancora in camice. Sul suo banco c'è una busta: convocazione al consiglio di disciplina. Nassim non c'è: è ancora ad Avicenne.
}
{ esito_sacha == "PACE":
    Sul marciapiede di fronte c'è Sacha, a viso scoperto. L'udienza è tra tre settimane. Non entra: non è più un allievo da cinque anni. Saluta Nassim con il pugno chiuso, e Nassim risponde.
- else:
    Di Sacha nessuno parla. Il suo numero non risponde da una settimana. Alla palestra di boxe il suo nome è stato cancellato dalla lavagna degli allenatori.
}

# ---
# ora: 08:10
{ esito_jerome == "PACE":
    Alle 8:10 passa davanti al liceo un camion dello SDIS 77, con un parabrezza nuovo. Il caporal-chef al finestrino suona il clacson due volte. I ragazzi in fila applaudono, come sul boulevard Voltaire.
- else:
    Alle 8:10 passa un camion dello SDIS 77. Al finestrino non c'è il caporal-chef con il casco graffiato: è sospeso. Hugo guida da solo, e non suona.
}
{ esito_mehdi == "PACE":
    In fondo alla strada, in borghese, Mehdi Saïdi accompagna sua madre all'autobus. Si ferma davanti alla grata ridipinta. Legge quello che si legge sotto la vernice. Poi se ne va, senza fretta.
- else:
    In fondo alla strada, sul muro del palazzo C, qualcuno ha coperto il nome SAÏDI con un'altra mano di vernice. Si legge lo stesso. Sua madre prende l'autobus da sola.
}

# img: shared/c8_aula_lunedi
# ora: 08:20
# amb: interno
Aula 204. Trentacinque sedie per trenta metri quadri. La macchia d'umido a forma di Africa, sul soffitto, è un po' più grande.
{ esito_odile == "PACE":
    La prof Garnier ha lasciato sulla lavagna le parole di sabato. Fa l'appello. Ascolta ogni nome come se fosse una notizia.
- else:
    C'è un supplente. La prof Garnier è sospesa in attesa del consiglio di disciplina. Il supplente cancella la lavagna senza leggerla, poi si scusa, senza sapere con chi.
}

# ---
{ quante_paci():
- 5:
    Tutti i banchi sono occupati. Per una volta nessuno si lamenta che sono troppi.
    Alla fine dell'ora Nassim si alza e legge una poesia, a voce alta, con il gesso che gli trema. _Ils disent c'est les ténèbres / mais c'est juste le plafond qui tombe._ Nessuno ride. Poi ridono tutti, ma non di lui.
- 4:
    Un banco è vuoto. Nessuno ci appoggia lo zaino. Nessuno lo dice, ma tutti lo guardano, ogni tanto, come si guarda una finestra.
- 3:
    Un banco è vuoto, poi un altro. Nessuno ci appoggia lo zaino. La lezione comincia lo stesso, perché è questo che si fa.
- 1:
    Metà classe. La lezione sul 17 ottobre la fa una ragazza, in piedi davanti alla lavagna, perché nessun adulto se la sente.
- 2:
    Metà classe. La lezione sul 17 ottobre la fa una ragazza, in piedi davanti alla lavagna, perché nessun adulto se la sente.
- else:
    I banchi vuoti sono più di quelli pieni. A metà mattina il preside passa a dire che da domani il liceo chiude di nuovo, "per ragioni di sicurezza".
    All'uscita, sulla grata ridipinta, qualcuno ha già scritto a spray: C'EST LES TÉNÈBRES. Non è più una battuta.
}

# img: titolo
# ora:
# amb: notte
Questa era una versione della giornata. Ce ne sono altre.
Dipendono da chi stava davanti e da chi è rimasto fermo, da chi ha acceso e da chi ha spento, da chi ha teso una mano e da chi l'ha presa.
La pace, nelle tue versioni: {quante_paci()} su 5.
_C'est les ténèbres._ Forse. Ma qualcuno, ogni volta, ha acceso una luce.
-> END
