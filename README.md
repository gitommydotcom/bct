# C'est les ténèbres

Gioco narrativo web: una giornata di proteste a Parigi (sabato 17 ottobre 2026), uno scontro, cinque punti di vista.
Pixel art a 4 colori per personaggio, scelte morali, due finali (PACE / VIOLENZA) per ognuno.

**Contenuto:** cinque percorsi completi (Inès, Sacha, Jérôme, Odile, Mehdi), ognuno di 15–25 minuti con 14–18 scelte e due finali,
13 incroci tra i personaggi, e l'epilogo corale *Lunedì 2 novembre* che si sblocca dopo averli finiti tutti.

- Storia, personaggi e regole: [`STORY_BIBLE.md`](STORY_BIBLE.md)
- Illustrazioni da disegnare: [`ART_LIST.md`](ART_LIST.md)

## Provarlo in locale

```bash
npm install      # solo la prima volta (serve per compilare le storie)
npm run serve    # poi apri http://localhost:8080
```

Aprire `index.html` con un doppio clic non funziona: i browser bloccano i moduli JavaScript da `file://`.
Scorciatoia per gli sviluppatori: `http://localhost:8080/?gioca=ines` apre direttamente un personaggio.

## Struttura

| Cartella | Contenuto |
|---|---|
| `ink/` | **La storia.** Un file `.ink` per personaggio + `comune.ink` (variabili, regola dei finali, elenco dei tag) |
| `story/` | Le storie compilate (`npm run build`). Non modificarle a mano |
| `lang/it.js` | Tutti i testi dell'interfaccia (menu, opzioni, schede dei personaggi) |
| `art/` | Le illustrazioni definitive (vedi sotto). Se un file manca, il gioco usa il segnaposto |
| `js/` | Il motore: `engine.js` (Ink, pagine, scelte), `render.js` (palette e dither), `scenes.js` + `scenedefs.js` (segnaposto), `characters.js` (i personaggi disegnati: sagome, vestiti, espressioni), `audio.js`, `mini.js` |
| `tools/` | Compilatore, verifica, convertitore di immagini, galleria, server locale |

## Modificare i testi

1. Apri il file del personaggio in `ink/` (per esempio `ink/ines.ink`). È testo semplice in [Ink](https://github.com/inkle/ink/blob/master/Documentation/WritingWithInk.md): ogni riga è un paragrafo, `*` è una scelta, `->` un salto.
   Si può usare anche [Inky](https://github.com/inkle/inky), l'editor gratuito di inkle, per leggere e provare i rami.
2. `npm run build` compila le storie in `story/`.
3. `npm run verify` gioca migliaia di partite a caso e segnala vicoli ciechi, finali irraggiungibili, scelte mai prese, variabili inutili, immagini mancanti e pagine troppo lunghe.

I comandi tra `#` (immagine, ora, effetti, suoni, chat, timer…) sono spiegati in cima a `ink/comune.ink`.

**Lingua.** Dialoghi e chat si scrivono in italiano (anche quando i personaggi, nella finzione, parlano francese). Il francese resta solo per slogan, scritte e citazioni, sempre con la traduzione: `‹ON EST PAS VOS ENNEMIS=non siamo vostri nemici›` mostra il testo francese con la traduzione accanto.

## Sostituire le illustrazioni

Ogni scena ha un nome, per esempio `shared/c5_granata`, che corrisponde al file `art/shared/c5_granata.png`.

- **Formato:** 320×200 (o più grande, ma sempre in 16:10), **in scala di grigi**. Il gioco la converte da solo nei 4 colori del personaggio che sta guardando: le scene in `art/shared/` si disegnano una volta sola e cambiano colore per ognuno.
- **Convertitore:** apri `http://localhost:8080/tools/convertitore.html`, trascina un disegno, una foto o un collage, regola contrasto, gamma, soglia e tipo di dither, guarda l'anteprima nelle cinque palette e scarica il PNG.
- **Galleria:** `http://localhost:8080/tools/galleria.html` mostra tutte le scene (segnaposto o tavola) con la loro descrizione e il percorso del file.
- Dopo aver aggiunto delle tavole, `npm run artlist` aggiorna `ART_LIST.md` con lo stato di avanzamento.

## Comandi in gioco

Tocco o clic sul testo per avanzare (o Invio/Spazio), tasti 1–9 per scegliere, Esc per il menu.
Le opzioni permettono di cambiare la velocità del testo, togliere le scanline CRT, disattivare le scelte a tempo, ridurre i lampeggi e spegnere l'audio.
I progressi si salvano da soli nel browser (localStorage): si può chiudere e riprendere dall'ultima scelta.

## Pubblicare su Netlify

Il sito è statico: si pubblica la cartella così com'è (`netlify.toml` è già configurato, nessuna build necessaria:
le storie compilate in `story/` sono già nel repository).

**Consigliato — aggiornamento automatico da GitHub:** su Netlify, apri il sito → *Site configuration → Build & deploy →
Continuous deployment → Link repository*, scegli `gitommydotcom/bct`, branch `master`, *Publish directory* `.` e lascia vuoto il *Build command*.
Da quel momento ogni push su `master` aggiorna il sito.

**In alternativa:** scarica il repository come ZIP da GitHub, scompattalo e trascina la cartella nella pagina *Deploys* del sito su Netlify.

Se modifichi i file `.ink`, esegui `npm run build` (e possibilmente `npm run verify`) prima di pubblicare.
