// =====================================================================
//  C'EST LES TÉNÈBRES — variabili e funzioni comuni a tutti i personaggi
//  Questo file viene incluso (INCLUDE) da ogni percorso.
// =====================================================================
//
//  CONVENZIONI (tag letti dal motore):
//   # img: cartella/nome      immagine (art/cartella/nome.png o segnaposto)
//   # capitolo: alba          capitolo nell'HUD (alba, mattina, mezzogiorno, pomeriggio, scontro, sera, notte)
//   # ora: 06:48              ora nell'HUD
//   # fx: fumo gas notte lampeggianti   effetti sull'immagine   |  # fxoff: gas  (o vuoto = tutti)
//   # flash                   lampo bianco (granata)
//   # sfx: sirena vetro colpo granata lacrimogeno notifica cuore getto
//   # amb: folla sirene fuoco metro notte interno silenzio
//   # chat: Titolo  ...  # /chat     schermata chat ("Nome: testo" = messaggio)
//   # ---                     nuova pagina
//   # timer: 8                scelte a tempo (serve una scelta con # timeout)
//   # mini: getto|respiro|maschera   mini-interazione (scelte # ok / # ko)
//   # locked: motivo          (sulla scelta) scelta visibile ma barrata
//   # ricorda: testo          nota "se ne ricorderà"
//   # incrocio: X02           incrocio con altri personaggi (mappa della giornata)
//   # lavagna: parola         scrive sulla lavagna della scena
//   _testo_                   corsivo
//   ‹francese=italiano›       testo francese con la traduzione accanto (solo per slogan, scritte, citazioni:
//                             i dialoghi si scrivono in italiano)
//   Nelle chat i messaggi sono "Nome: testo"; le altre righe diventano note di sistema.
// =====================================================================

VAR personaggio = ""

// stato emotivo, 0-10
VAR rabbia = 0
VAR paura = 0
VAR fiducia = 0
VAR responsabilita = 0

// scelte decisive dello scontro: "V" violenta, "P" pacifica, "F" ferma (timeout)
VAR d1 = "F"
VAR d2 = "F"
VAR d3 = "F"
VAR d1_testo = ""
VAR d2_testo = ""
VAR d3_testo = ""

VAR esito = ""

=== function su(ref x, n)
~ x = MIN(x + n, 10)

=== function giu(ref x, n)
~ x = MAX(x - n, 0)

=== function decisiva(n, tipo, testo)
{ n:
- 1:
    ~ d1 = tipo
    ~ d1_testo = testo
- 2:
    ~ d2 = tipo
    ~ d2_testo = testo
- 3:
    ~ d3 = tipo
    ~ d3_testo = testo
}

=== function violente()
~ temp n = 0
{ d1 == "V":
    ~ n = n + 1
}
{ d2 == "V":
    ~ n = n + 1
}
{ d3 == "V":
    ~ n = n + 1
}
~ return n

// La regola dei finali (vedi STORY_BIBLE.md, §7)
=== function calcola_esito()
~ temp punti = 2 * violente()
{ rabbia >= 7:
    ~ punti = punti + 1
}
{ fiducia <= 2:
    ~ punti = punti + 1
}
{ responsabilita >= 7:
    ~ punti = punti - 1
}
{ punti >= 3:
    ~ esito = "VIOLENZA"
- else:
    ~ esito = "PACE"
}
~ return esito
