#!/usr/bin/env node
"use strict";

const fs = require("fs");
const os = require("os");
const path = require("path");

const args = process.argv.slice(2);

if (args.includes("--help") || args.includes("-h")) {
  console.log(`tighten-skill — install the /tighten Claude Code slash command

Usage:
  npx tighten-skill            Install for your user (~/.claude/commands)
  npx tighten-skill --project  Install into the current project (.claude/commands)
  npx tighten-skill --help     Show this message

After installing, restart Claude Code and run /tighten.`);
  process.exit(0);
}

const projectScope = args.includes("--project") || args.includes("-p");

const source = path.join(__dirname, "..", "tighten.md");
const targetDir = projectScope
  ? path.join(process.cwd(), ".claude", "commands")
  : path.join(os.homedir(), ".claude", "commands");
const target = path.join(targetDir, "tighten.md");

try {
  if (!fs.existsSync(source)) {
    console.error(`Could not find tighten.md next to the installer at ${source}`);
    process.exit(1);
  }

  fs.mkdirSync(targetDir, { recursive: true });

  const existed = fs.existsSync(target);
  fs.copyFileSync(source, target);

  const scope = projectScope ? "project" : "user";
  console.log(`${existed ? "Updated" : "Installed"} /tighten (${scope} scope)`);
  console.log(`  -> ${target}`);
  console.log("");
  console.log("Restart Claude Code (or run /help), then use:  /tighten <target> [intent]");
} catch (err) {
  console.error(`Install failed: ${err.message}`);
  process.exit(1);
}
