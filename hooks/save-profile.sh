#!/bin/sh
# Eli session-end hook.
#
# The semantic memory — concepts, metaphors, levels, status — is written during
# the session by the `eli-memory` agent (it writes immediately on /eli commands
# and batches concept updates). This hook only stamps the profile's
# `last_updated` date so the file reflects the most recent session.
#
# ponytail: cosmetic date bump only; real memory writes are the agent's job.
# Uses perl -i (consistent across macOS and Linux) instead of sed -i, whose
# flags differ between BSD and GNU.
set -e

profile="$HOME/.claude/eli-profile.md"
[ -f "$profile" ] || exit 0

today=$(date +%Y-%m-%d)
D="$today" perl -0pi -e 's/^last_updated:.*$/last_updated: $ENV{D}/m' "$profile" 2>/dev/null || true

exit 0
