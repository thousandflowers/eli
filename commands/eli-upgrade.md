---
description: Tell Eli you already understand a concept; it stops explaining it from scratch
argument-hint: "[concept]"
---

# /eli upgrade [concept]

Tell Eli you already understand a concept. Eli will stop explaining it from scratch.

Concept you already know: $ARGUMENTS

## Usage

```
/eli upgrade jwt
/eli upgrade css
/eli upgrade "come funziona un server"
```

## Behavior

1. If no argument provided:
   > ❓ Dimmi cosa sai già. Esempio: `/eli upgrade jwt`

2. Delegate to `agents/eli-memory.md`: mark concept as `understood`, set level to one notch above current baseline, note method as `user_declared`, write immediately

3. Confirm to user:
   > 💾 Annotato — "[concept]" lo sai già. Non ti spiego più la base.

## Notes

- Can also be triggered naturally mid-conversation: "lo so già", "questo lo conosco", "vai avanti"
- Does not affect other concepts
- User can reverse with `/eli forget [concept]` if they want Eli to re-explain it
