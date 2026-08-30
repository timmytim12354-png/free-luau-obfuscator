# Publishing notes

This directory is its own git repository. It is not the KeyForge application.

The GitHub name `free-luau-obfuscator` is historical. The repo is integration examples plus a local minify/format CLI. Hosted wYnFuscate stays on keyforge.win.

Suggested description:

```text
Luau integration examples, local minify CLI, and KeyForge (keyforge.win) loader/SDK docs. Hosted wYnFuscate runs on KeyForge — this repo is not the obfuscator engine.
```

Do not turn `/docs` into GitHub Pages. The markdown is already crawlable on github.com; a Pages site would duplicate keyforge.win and this tree.

## Do not upload

- Anything from the KeyForge application repo
- `.env`, tokens, dashboard screenshots with keys
- A copy of `/sdk/client.lua` (fetch it; do not vendor it)
