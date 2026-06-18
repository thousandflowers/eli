---
description: Remove a specific concept from Eli's memory; Eli starts fresh on it next time
argument-hint: "[concept]"
---

# /eli forget [concept]

Remove a specific concept from Eli's memory. Eli will start fresh on that topic next time.

Concept to forget: $ARGUMENTS

## Usage

```
/eli forget jwt
/eli forget database
/eli forget "node modules"
```

## Behavior

1. If no argument provided:
   > ❓ Dimmi cosa devo dimenticare. Esempio: `/eli forget jwt`

2. Delegate to `agents/eli-memory.md`: remove concept from concept map, remove all saved explanations (both worked and failed) for that concept, write immediately

3. Confirm to user:
   > 💾 Ho dimenticato tutto su "[concept]". Ripartirò da zero la prossima volta che se ne parla.

## Notes

- Only removes the specified concept — all other memory is preserved
- Cannot be undone (the concept will simply be re-learned naturally)
