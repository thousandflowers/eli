---
description: Deactivate Eli mode and restore standard Claude Code output
---

# /eli off

Deactivate Eli mode. Restore standard Claude Code output.

## Behavior

1. Set `eli_active: false` in `~/.claude/eli-profile.md`
2. Write any pending session updates to profile before deactivating
3. Confirm to user in one line:

> ✅ Eli disattivato. Output standard ripristinato.

Profile and all memory are preserved. `/eli on` resumes from the same state.
