---
description: Change the global baseline explanation level (5 / dog / donkey / human)
argument-hint: "[5|dog|donkey|human]"
---

# /eli level [5|dog|donkey|human]

Change the global baseline explanation level.

Requested level: $ARGUMENTS

## Usage

```
/eli level 5
/eli level dog
/eli level donkey
/eli level human
```

## Behavior

1. Validate the argument — if missing or invalid, respond:
   > ❓ Scegli un livello: `/eli level 5`, `/eli level dog`, `/eli level donkey`, o `/eli level human`

2. Delegate to `agents/eli-memory.md`: update `baseline_level` in profile, write immediately

3. Confirm to user:
   > 💾 Livello aggiornato a [level]. Parto da lì per tutto, tranne i concetti che conosci già.

## Notes

- Changing baseline level does not erase per-concept overrides
- Per-concept levels learned through interaction are preserved
- The new baseline applies to all new and unknown concepts going forward
