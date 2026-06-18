---
description: Show what Eli has learned about you, in plain language
---

# /eli status

Show the user what Eli has learned about them, in plain language.

## Behavior

Delegate to `agents/eli-memory.md` with instruction: "Generate a plain-language status summary of the current eli-profile.md. Follow the /eli status format defined in your instructions."

## Rules

- Never show raw file content
- Never show scores, metadata, or internal field names
- Always written at the user's current baseline level
- End with "Vuoi cambiare qualcosa?" to invite corrections
