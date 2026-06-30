# Tighten

A [Claude Code](https://claude.com/claude-code) slash command that rewrites long or padded prose to be tight and clear: **same meaning, fewer words, every fact kept.**

It is *not* a summarizer. It cuts filler, hedging, buzzwords, and empty adjectives while keeping every number, path, code block, and caveat verbatim.

![Before and after example](assets/before-after.svg)

## Install

Tighten is a single Markdown file. Drop it into your Claude Code commands folder.

**For just you (all projects):**

```bash
mkdir -p ~/.claude/commands
curl -o ~/.claude/commands/tighten.md \
  https://raw.githubusercontent.com/raj-khan/tighten/main/tighten.md
```

**For one project (shared with your team via git):**

```bash
mkdir -p .claude/commands
curl -o .claude/commands/tighten.md \
  https://raw.githubusercontent.com/raj-khan/tighten/main/tighten.md
```

Or just clone this repo and copy the file:

```bash
git clone https://github.com/raj-khan/tighten.git
cp tighten/tighten.md ~/.claude/commands/
```

Restart Claude Code (or run `/help`) and `/tighten` will appear in the list.

## Usage

```
/tighten <target> [intent]
```

- **target** : a file path, a section name, or pasted text.
- **intent** *(optional)* : how hard to cut, a target length, the audience, or what to protect.

If you give it a file or section, it edits in place and reports the rough before/after size. If you paste text, it returns the rewrite.

### Examples

```
/tighten README.md
/tighten the "Background" section, lightly
/tighten this paragraph, to ~120 words
/tighten our launch email, for execs, keep the pricing table
```

## What happens when you use it

You run:

```
/tighten Set up the database connection notes, keep the connection string
```

**Before (58 words):**

> In order to be able to actually go ahead and deploy, it is basically necessary
> that you should first make sure that you have set the `API_KEY` environment
> variable, due to the fact that the build step will end up failing without it
> at this point in time.

**After (16 words):**

> Set the `API_KEY` environment variable before deploying; the build step fails without it.

The fact (`API_KEY`, the build failing) survives. The padding ("in order to be able to actually," "due to the fact that," "at this point in time") is gone. Claude then confirms every fact survived and reports `~72% shorter`.

## How it behaves

- **Keeps every fact.** Numbers, paths, signatures, enums, constants, error strings, decisions, caveats, code blocks, and tables stay verbatim.
- **Honors your intent.** "lightly" vs "hard", "to ~120 words", "for execs", "keep section 3" — but it never drops a fact just to hit a length.
- **Short, not crammed.** It splits awkward sentences instead of jamming clauses together.
- **Matches your style.** It follows the punctuation, headings, and reference style the file already uses.
- **Asks first if you mean *summarize*.** Leaving facts out is a different job; it will confirm before doing that.

## Contributing

Issues and pull requests are welcome. The whole skill is `tighten.md` — edit the prompt, open a PR.

## License

[MIT](LICENSE) © raj-khan
