---
description: Erase all Eli memory and start from scratch (destructive, asks to confirm)
---

# /eli reset

Erase all Eli memory and start from scratch.

## Behavior

1. Always ask for confirmation first — this is a destructive action:
   > 🛑 Sto per cancellare tutto quello che ho imparato su di te. Concetti, metafore, livelli — tutto. Non si può annullare. Procedo?

2. Only proceed on explicit confirmation ("sì", "ok", "vai", "procedi", "reset")

3. Delegate to `agents/eli-memory.md`: back up current profile to `~/.claude/eli-profile.backup.md`, then recreate `~/.claude/eli-profile.md` with defaults:
   ```
   eli_active: true
   baseline_level: dog
   baseline_confidence: low
   history_source: none
   ```

4. Confirm to user:
   > 💾 Memoria azzerata. Ricomincio da capo — livello dog di default.

## Notes

- Backup is saved automatically before reset
- To restore backup manually: rename `eli-profile.backup.md` to `eli-profile.md`
- Eli will re-learn naturally from the first interaction after reset
