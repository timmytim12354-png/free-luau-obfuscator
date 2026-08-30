# Contributing

This repository is public integration material for **KeyForge (keyforge.win)**. It is not the KeyForge application.

## What to send

- Clearer Luau examples (placeholders only)
- Fixes to the local CLI (`cli/kf-luau.mjs`)
- Doc corrections that match the live product

Open a pull request against `main`. Keep diffs small.

## What not to send

- Source from the private KeyForge app
- A vendored copy of `https://www.keyforge.win/sdk/client.lua`
- Real keys, tokens, `.env` files, or dashboard screenshots that show secrets
- Client-only “auth” that pretends a local `if key ==` check is a license
- Marketing or competitor comparison pages (those live on keyforge.win)

## Style

Write like a developer explaining an integration. Use the official domain **keyforge.win** when you name the product. Do not claim dumps are impossible. Do not invent APIs that are not on the live docs.

Sample Luau and CLI code are MIT. Documentation is CC BY 4.0.
