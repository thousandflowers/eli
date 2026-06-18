# Eli 🐕

> Claude Code talks like an engineer. Eli translates for the rest of the world.

---

## Why I built this

My girlfriend and I both use Claude Code, but we have very different technical backgrounds. Claude Code's default output is great if you already know what a build pipeline or a diff is — less great if you don't.

I wanted something that would adapt to who's sitting at the keyboard, not assume everyone speaks the same language. Eli is that: a translation layer that learns how you think, not just what you know.

---

## What is Eli

**Technical version**
Eli is a Claude Code plugin that overrides the agent's output layer with an adaptive communication system. It reads a persistent user profile (`~/.claude/eli-profile.md`), calibrates the abstraction level for each concept, and updates the profile based on implicit and explicit user feedback over time.

**Eli/dog version 🐕**
Claude Code is great at writing code but explains things like you've studied computer science for five years. Eli is a translator: it listens to what Claude Code does and tells you in plain language. And the more you use it, the more it learns how to explain things to *you* — because not everyone understands better with a metaphor, and not everyone understands worse with a technical term.

**Eli/5 version 🧒**
Imagine Claude Code is a really skilled mechanic who only speaks Japanese. Eli is the interpreter who tells you "they fixed the brakes, you can drive" instead of explaining how the braking system works.

---

## Install

**Technical version**
Eli is distributed via the `thousandflowers` marketplace for Claude Code. Requires Claude Code with plugin support (version ≥ 1.0.0). The plugin installs: a main skill, a memory agent, seven slash commands, and a session-end hook.

```bash
/plugin marketplace add thousandflowers
/plugin install eli
```

**Eli/dog version 🐕**
Open Claude Code and paste these two commands, one at a time. The first tells Claude Code where to find Eli. The second installs it. Done.

```
/plugin marketplace add thousandflowers
/plugin install eli
```

**Eli/5 version 🧒**
Type these two things into the program, press enter after each:

```
/plugin marketplace add thousandflowers
```
```
/plugin install eli
```

Done. Eli is installed.

---

## First run

**Technical version**
On first launch, Eli scans the Claude Code session history in `~/.claude/` to infer the user's baseline technical level. No input required. The inferred level is written to the profile and used silently from that point on. The user can override it at any time with `/eli level`.

**Eli/dog version 🐕**
The first time you open Claude Code with Eli installed, Eli looks at the conversations you've had in the past and figures out roughly how you talk about technology. It doesn't ask you anything — it just starts, at the right level for you. If it gets it wrong, you can correct it.

**Eli/5 version 🧒**
The first time, Eli reads your old messages to understand how much you know. Like when a new teacher reads your homework before they start explaining things.

---

## How it learns

**Technical version**
Eli maintains a persistent concept map in `~/.claude/eli-profile.md`. For each technical concept, it tracks: abstraction level used, explanation method (metaphor, ASCII, cause-effect, direct), state (unknown / learning / understood), and history of failed attempts. The profile is updated by both explicit signals (slash commands) and implicit signals in the user's natural language.

**Eli/dog version 🐕**
Every time you understand something immediately, Eli notes it: "this person already knows what a build is, no need to re-explain." Every time you don't understand, it notes that too: "the warehouse metaphor didn't work for databases, let's try a drawing." Over time it gets more precise — not about the code, about how *you* talk.

**Eli/5 version 🧒**
Eli keeps a notebook. Every time you understand right away, it writes "this one they know." Every time you ask it to re-explain, it writes "this one needs explaining differently." Next time the topic comes up, it checks the notebook before saying anything.

---

## What you can say

**Technical version**
Eli intercepts natural language signals and converts them into profile updates without requiring explicit commands. Also supports slash commands for granular control.

**Eli/dog version 🐕**
You can talk to Eli like you'd talk to a person. If something is clear, say "ok" or "got it" — it notes it. If it's not clear, say "I didn't get that" or even just "?" — it'll try differently. If you already know something, say "I already know this" — it won't explain it again.

You also have commands if you prefer to be precise:

| Command | What it does |
|---|---|
| `/eli status` | Shows what it has learned about you |
| `/eli level dog` | Changes the global level (5 / dog / donkey / human) |
| `/eli forget jwt` | Forgets everything about a specific topic |
| `/eli upgrade css` | Marks a topic as already known |
| `/eli reset` | Start from scratch |
| `/eli off` | Temporarily disable Eli |
| `/eli on` | Re-enable Eli |

**Eli/5 version 🧒**
You can tell it:
- "I didn't get that" → it explains differently
- "I already know this" → it won't explain it again
- "ok" → it notes that you understood

Or use the commands above if you want to be more precise.

---

## The 4 levels

**Technical version**
Eli supports four abstraction levels configurable globally or per concept. The global level is the starting point; per-concept levels are learned automatically and override the global for that specific concept.

**Eli/dog version 🐕**

| Level | How it explains |
|---|---|
| `/eli level 5` | Like a 5-year-old. Only physical objects, nothing abstract. |
| `/eli level dog` | Everyday life examples. Zero jargon. One metaphor at a time. |
| `/eli level donkey` | Simple explanations. One technical term at a time, explained immediately. |
| `/eli level human` | Normal language. Technical terms ok if explained the first time. |

Eli starts from the level it inferred about you. You can change it whenever you want.

**Eli/5 version 🧒**
Eli can explain things in different ways. From simplest to least simple:
- **5** — like a small child
- **dog** — like someone who doesn't work with computers
- **donkey** — some technical words, explained right away
- **human** — normal words, technical terms ok

---

## Your data

**Technical version**
The entire profile is saved locally in `~/.claude/eli-profile.md`. No data is sent to external servers. The file is readable and manually editable. `/eli status` shows a human-readable version. `/eli reset` clears it after confirmation, with automatic backup to `eli-profile.backup.md`.

**Eli/dog version 🐕**
Everything Eli learns about you is saved on your computer, in a plain text file. It goes nowhere. You can see it with `/eli status`, change it with commands, or delete it with `/eli reset`. It's yours.

**Eli/5 version 🧒**
Eli's notebook is on your computer. Only you have it. You can read it, change it, or throw it away whenever you want.

---

## Credits

Eli is an open source plugin distributed by [thousandflowers](https://github.com/thousandflowers).
Inspired by the `caveman` plugin — but in the opposite direction.
MIT License.
