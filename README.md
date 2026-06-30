# Eli 🐕

**Adaptive human-mode for Claude Code.** Eli translates technical output into
plain language calibrated to *you* — and learns how you understand things over
time, in your own language.

Inspired by the caveman plugin, but pointing the other way: caveman makes Claude
terse; Eli makes Claude *understandable* to someone who doesn't code.

> Built it for my girlfriend, who watches me build things in a terminal full of
> red text she can't read. Now Claude tells her, in plain words, what just
> happened.

## What it does

- **Translates, doesn't dumb down.** The code stays professional; only the
  communication *to you* becomes human.
- **Learns you.** Remembers which concepts you already get and which need a
  metaphor — and stops re-explaining what you know.
- **Four levels**, from "explain like I'm 5" up to plain-language technical.
- **Your language.** Replies in whatever language you write in.
- **Local & private.** Everything lives in one file on your machine
  (`~/.claude/eli-profile.md`). No account, no network, no telemetry.

## Install

```
/plugin marketplace add thousandflowers/eli
/plugin install eli@thousandflowers
```

Restart Claude Code. Eli says hello once, then gets out of the way.

## Levels

| Level | For |
|---|---|
| `5` 🧒 | explain like I'm five — only everyday physical things |
| `dog` 🐕 | everyday situations, one metaphor, no jargon (default) |
| `donkey` 🫏 | simple cause-and-effect, one explained term allowed |
| `human` 🧑 | plain language, technical terms explained on first use |

## Commands

| Command | What it does |
|---|---|
| `/eli status` | what Eli has learned about you |
| `/eli level <5\|dog\|donkey\|human>` | set the baseline level |
| `/eli forget <topic>` | forget a topic; start fresh on it |
| `/eli upgrade <topic>` | tell Eli you already know it |
| `/eli recap` | plain-language summary of what happened this session |
| `/eli reset` | erase everything Eli learned (asks first; backs up) |
| `/eli on` / `/eli off` | turn Eli on or off (memory is kept) |

You don't need commands for the basics — just talk. Say "non ho capito" and Eli
explains differently; say "lo so già" and it stops explaining that thing.

## How it learns

1. **First run** — Eli estimates a starting level from a small, bounded sample of
   your recent local Claude Code sessions (newest few transcripts only; it counts
   technical signals, keeps no content, and stores only a level). Nothing to go
   on → it starts at `dog`.
2. **As you react** ("got it", "?", "explain that differently"), Eli updates a
   tiny profile *immediately* — `~/.claude/eli-profile.md` — recording which
   concepts you understand and which metaphors landed.
3. **Each session** starts by loading that profile, so it picks up where it left
   off.

The profile is plain text you can read and edit by hand. `/eli reset` backs it up
to `eli-profile.backup.md` before wiping.

## Uninstall

```
/plugin uninstall eli@thousandflowers
```

Your profile stays until you delete `~/.claude/eli-profile.md` yourself.

## License

MIT
