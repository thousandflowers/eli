---
description: Reactivate Eli mode after it has been turned off
---

# /eli on

Reactivate Eli mode after it has been turned off.

## Behavior

1. Set `eli_active: true` in `~/.claude/eli-profile.md`
2. Load profile silently
3. Confirm to user in one line:

> ✅ Eli attivo. Parlo come prima.

Do not re-run the startup sequence. Do not re-scan history. Resume from existing profile.
