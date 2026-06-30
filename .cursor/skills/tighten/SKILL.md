---
name: tighten
description: >
  Rewrite long or padded prose tight and clear: same meaning, fewer words, every
  fact kept. Cuts filler, hedging, buzzwords, restated context, and empty adjectives
  while keeping numbers, paths, signatures, enums, error strings, code blocks, and
  caveats verbatim. Not a summarizer. Use when the user says "tighten", "make this
  tighter", "cut the fluff", "make it more concise without losing anything", or
  invokes /tighten. Takes an optional intent (how hard, target length, audience,
  what to protect).
---

Goal: make the prose shorter and clearer without losing anything that matters. Cut filler, hedging, buzzwords, restated context, empty adjectives. Keep every fact verbatim: numbers, paths, signatures, enums, constants, error strings, decisions, caveats, code blocks, tables.

The user gives a **target** (a file path, a section name, or pasted text) plus an optional **intent**. Edit files and sections in place; otherwise return the rewrite. If no target is given, ask which, then go.

The few things worth stating:

- **Not a summarizer.** Keep every fact, shorten the words around it. If the ask is to make it shorter by leaving things out, that is a different job: say so and confirm first.
- **Honor the intent.** "lightly" or "hard", "to ~120 words", "for execs", "keep section 3". Follow it, but never drop a fact to hit a length.
- **Short, not crammed.** Do not jam clauses to save a word. When a cut turns a sentence awkward, split it in two. Read each one aloud; if you stumble, fix it.
- **Match the project's style.** Punctuation, headings, references: follow what the file already does, do not impose your own.

After: confirm every fact survived and meaning is unchanged. For a file, report rough before/after size.
