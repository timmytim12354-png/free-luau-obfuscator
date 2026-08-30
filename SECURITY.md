# Security

KeyForge (keyforge.win) authenticates and delivers scripts on the server. This repository only contains examples and a local minify/format CLI.

## Do not file product vulnerabilities here

If you found an issue in the hosted product, the dashboard, `/v1/load`, or the official SDK, contact support through [https://discord.gg/XfHJNmThGK](https://discord.gg/XfHJNmThGK) or the contact options on [https://www.keyforge.win](https://www.keyforge.win). Do not open a public GitHub issue with a working exploit, a customer key, or a dump of someone else’s script.

## This repo

- Examples use `YOUR-KEY`, `YOUR_PROJECT_ID`, `YOUR_SCRIPT_ID`, and `SIGNED_TOKEN_FROM_DASHBOARD`.
- Never commit a live integration token or a buyer key.
- Do not vendor `client.lua`. Fetch `https://www.keyforge.win/sdk/client.lua` at runtime.

If a secret was committed by mistake, rotate it in the KeyForge dashboard and open a private support ticket. Git history on a public fork may still contain the old value.
