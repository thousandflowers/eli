---
description: Control Eli - status, level, forget, upgrade, recap, reset, on, off
argument-hint: "[status | level <5|dog|donkey|human> | forget <x> | upgrade <x> | recap | reset | on | off]"
---

# /eli

Single entry point for every Eli command. Read `$ARGUMENTS`, take the first word
as the subcommand, route as below. **Reply in the user's language** - the Italian
strings below are templates, translate them.

Subcommand requested: **$ARGUMENTS**

If `$ARGUMENTS` is empty, show this menu and stop:

> 🐕 Eli. Cosa vuoi fare?
> • `/eli status` - cosa ho imparato su di te
> • `/eli level 5|dog|donkey|human` - cambia il livello
> • `/eli forget <argomento>` - dimentica un argomento
> • `/eli upgrade <argomento>` - dimmi che lo sai già
> • `/eli recap` - riassunto di cosa è successo nella sessione
> • `/eli reset` - ricomincia da zero
> • `/eli on` / `/eli off` - accendi / spegni

---

## status
Delegate to `agents/eli-memory.md`: generate the plain-language status summary
(its `status` section). Never show raw file content, scores, or field names.
Write it at the user's level and in their language.

## level `<5|dog|donkey|human>`
1. Validate the second word. If missing or not one of `5 | dog | donkey | human`:
   > ❓ Scegli un livello: `/eli level 5`, `/eli level dog`, `/eli level donkey`, o `/eli level human`
2. Delegate to `agents/eli-memory.md`: update `baseline_level`, write immediately.
3. Confirm: 💾 Livello aggiornato a [level]. Parto da lì per tutto, tranne i concetti che conosci già.

Per-concept overrides are preserved; the new baseline applies to new/unknown concepts.

## forget `<concept>`
1. If no concept: ❓ Dimmi cosa devo dimenticare. Esempio: `/eli forget jwt`
2. Delegate to `agents/eli-memory.md`: remove the concept and all its saved
   explanations (worked + failed), write immediately.
3. Confirm: 💾 Ho dimenticato tutto su "[concept]". Ripartirò da zero la prossima volta che se ne parla.

## upgrade `<concept>`
1. If no concept: ❓ Dimmi cosa sai già. Esempio: `/eli upgrade jwt`
2. Delegate to `agents/eli-memory.md`: mark `understood`, level one notch above
   baseline, method `user_declared`, write immediately.
3. Confirm: 💾 Annotato - "[concept]" lo sai già. Non ti spiego più la base.

Reversible with `/eli forget <concept>`. Also triggers naturally: "lo so già",
"questo lo conosco", "vai avanti".

## recap
Summarize, in plain language at the user's level and in their language, what was
done **this session** - action-first, no file paths or hashes. Follow the
`/eli recap` format in `skills/eli/SKILL.md`.

## reset
1. Confirm first - destructive:
   > 🛑 Sto per cancellare tutto quello che ho imparato su di te. Concetti, metafore, livelli - tutto. Non si può annullare. Procedo?
2. Only proceed on explicit "sì", "ok", "vai", "procedi", or "reset".
3. Delegate to `agents/eli-memory.md`: back up the profile to
   `~/.claude/eli-profile.backup.md`, then recreate `~/.claude/eli-profile.md`
   with defaults (`eli_active: true`, `baseline_level: dog`,
   `baseline_confidence: low`, `history_source: none`, `language: auto`,
   `created: <today>`, `last_updated: <today>`, `first_run_greeting: done`).
4. Confirm: 💾 Memoria azzerata. Ricomincio da capo - livello dog di default.

Restore manually by renaming `eli-profile.backup.md` back to `eli-profile.md`.

## on
Set `eli_active: true` in `~/.claude/eli-profile.md`, load the profile silently,
confirm in one line:
> ✅ Eli attivo. Parlo come prima.

Do not re-run the startup sequence or re-scan history.

## off
Write any pending updates, then set `eli_active: false`. Confirm in one line:
> ✅ Eli disattivato. Output standard ripristinato.

Profile and memory are preserved; `/eli on` resumes from the same state.

## (unknown subcommand)
> ❓ Non conosco "[word]". Prova: status, level, forget, upgrade, recap, reset, on, off.
