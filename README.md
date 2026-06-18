# Eli 🐕

> Claude Code parla come un ingegnere. Eli traduce per il resto del mondo.

---

## Cos'è Eli

**Versione tecnica**
Eli è un plugin per Claude Code che sovrascrive il layer di output dell'agente con un sistema di comunicazione adattivo. Legge un profilo utente persistente (`~/.claude/eli-profile.md`), calibra il livello di astrazione per ogni concetto, e aggiorna il profilo in base al feedback implicito ed esplicito dell'utente nel tempo.

**Versione Eli/dog 🐕**
Claude Code è bravo a scrivere codice ma spiega le cose come se tu avessi studiato informatica per cinque anni. Eli è un traduttore: ascolta quello che fa Claude Code e te lo dice in italiano normale. E più lo usi, più impara come spiegarti le cose — perché non tutti capiscono meglio con una metafora, e non tutti capiscono peggio con un termine tecnico.

**Versione Eli/5 🧒**
Immagina che Claude Code sia un meccanico bravissimo ma che parla solo in giapponese. Eli è l'interprete che ti dice "ha sistemato i freni, puoi guidare" invece di spiegarti come funziona il sistema frenante.

---

## Installazione

**Versione tecnica**
Eli è distribuito tramite il marketplace `thousandflowers` per Claude Code. Richiede Claude Code con supporto plugin (versione ≥ 1.0.0). Il plugin installa: una skill principale, un memory agent, sette comandi slash, e un session-end hook.

```bash
/plugin marketplace add thousandflowers
/plugin install eli
```

**Versione Eli/dog 🐕**
Apri Claude Code e incolla questi due comandi, uno alla volta. Il primo dice a Claude Code dove trovare Eli. Il secondo lo installa. Fine.

```
/plugin marketplace add thousandflowers
/plugin install eli
```

**Versione Eli/5 🧒**
Scrivi queste due cose nel programma, premi invio dopo ognuna:

```
/plugin marketplace add thousandflowers
```
```
/plugin install eli
```

Fatto. Eli è installato.

---

## Come funziona la prima volta

**Versione tecnica**
Al primo avvio, Eli scansiona la cronologia delle sessioni Claude Code in `~/.claude/` per inferire il livello tecnico baseline dell'utente. Nessun input richiesto. Il livello inferito viene scritto nel profilo e usato silenziosamente da quel momento in poi. L'utente può sovrascriverlo in qualsiasi momento con `/eli level`.

**Versione Eli/dog 🐕**
La prima volta che apri Claude Code con Eli installato, Eli guarda le conversazioni che hai avuto in passato e capisce più o meno come parli di tecnologia. Non ti chiede niente — parte e basta, al livello giusto per te. Se sbaglia, puoi correggerlo.

**Versione Eli/5 🧒**
La prima volta Eli legge i tuoi vecchi messaggi per capire quanto sai. Come quando un nuovo insegnante legge i tuoi compiti prima di iniziare a spiegarti le cose.

---

## Come impara nel tempo

**Versione tecnica**
Eli mantiene una concept map persistente in `~/.claude/eli-profile.md`. Per ogni concetto tecnico, traccia: livello di astrazione usato, metodo di spiegazione (metafora, ASCII, causa-effetto, diretto), stato (unknown / learning / understood), e storico dei tentativi falliti. Il profilo viene aggiornato sia da segnali espliciti (comandi slash) che da segnali impliciti nel linguaggio naturale dell'utente.

**Versione Eli/dog 🐕**
Ogni volta che capisci qualcosa al volo, Eli lo annota: "questa persona sa già cos'è una build, non serve rispiegarlo". Ogni volta che non capisci, annota anche quello: "la metafora del magazzino non ha funzionato per i database, proviamo con un disegno". Nel tempo diventa sempre più preciso — non sul codice, su come parli tu.

**Versione Eli/5 🧒**
Eli tiene un taccuino. Ogni volta che capisci subito, scrive "questa cosa la sa". Ogni volta che chiedi di rispiegare, scrive "questa cosa va spiegata in modo diverso". La prossima volta che se ne parla, guarda il taccuino prima di aprire bocca.

---

## Cosa puoi dirgli

**Versione tecnica**
Eli intercetta segnali linguistici naturali e li converte in aggiornamenti del profilo senza richiedere comandi espliciti. Supporta anche comandi slash per controllo granulare.

**Versione Eli/dog 🐕**
Puoi parlare con Eli come parleresti con una persona. Se qualcosa è chiaro, dì "ok" o "capito" — lo segna. Se non è chiaro, dì "non ho capito" o anche solo "?" — riprova in modo diverso. Se sai già una cosa, dì "questo lo so già" — non te la rispiegherà più.

Hai anche dei comandi se preferisci essere preciso:

| Comando | Cosa fa |
|---|---|
| `/eli status` | Ti mostra cosa ha imparato su di te |
| `/eli level dog` | Cambia il livello generale (5 / dog / donkey / human) |
| `/eli forget jwt` | Dimentica tutto su un argomento specifico |
| `/eli upgrade css` | Segna che conosci già un argomento |
| `/eli reset` | Ricomincia da zero |
| `/eli off` | Spegni Eli temporaneamente |
| `/eli on` | Riaccendi Eli |

**Versione Eli/5 🧒**
Puoi dirgli:
- "non ho capito" → te lo spiega diversamente
- "lo so già" → non te lo spiega più
- "ok" → annota che hai capito

Oppure puoi usare i comandi qui sopra se vuoi essere più preciso.

---

## I 4 livelli

**Versione tecnica**
Eli supporta quattro livelli di astrazione configurabili globalmente o per singolo concetto. Il livello globale è il punto di partenza; i livelli per-concetto vengono appresi automaticamente e sovrascrivono il globale per quel concetto specifico.

**Versione Eli/dog 🐕**

| Livello | Come spiega |
|---|---|
| `/eli level 5` | Come a un bambino di 5 anni. Solo oggetti fisici, niente astratto. |
| `/eli level dog` | Esempi di vita quotidiana. Zero gergo. Una metafora alla volta. |
| `/eli level donkey` | Spiegazioni semplici. Un termine tecnico alla volta, spiegato subito. |
| `/eli level human` | Linguaggio normale. Termini tecnici ok se spiegati la prima volta. |

Eli parte dal livello che ha dedotto su di te. Puoi cambiarlo quando vuoi.

**Versione Eli/5 🧒**
Eli può spiegarti le cose in modi diversi. Dal più semplice al meno semplice:
- **5** — come a un bambino piccolo
- **dog** — come a qualcuno che non lavora con i computer
- **donkey** — qualche parola tecnica, spiegata subito
- **human** — parole normali, termini tecnici ok

---

## I tuoi dati

**Versione tecnica**
Tutto il profilo è salvato localmente in `~/.claude/eli-profile.md`. Nessun dato viene inviato a server esterni. Il file è leggibile e modificabile manualmente. `/eli status` ne mostra una versione human-readable. `/eli reset` lo azzera previa conferma, con backup automatico in `eli-profile.backup.md`.

**Versione Eli/dog 🐕**
Tutto quello che Eli impara su di te è salvato sul tuo computer, in un file di testo normale. Non va da nessuna parte. Puoi vederlo con `/eli status`, modificarlo con i comandi, o cancellarlo con `/eli reset`. È tuo.

**Versione Eli/5 🧒**
Il taccuino di Eli è sul tuo computer. Solo tu ce l'hai. Puoi leggerlo, cambiarlo, o buttarlo via quando vuoi.

---

## Crediti

Eli è un plugin open source distribuito da [thousandflowers](https://github.com/thousandflowers).
Ispirato al plugin `caveman` — ma nella direzione opposta.
Licenza MIT.
