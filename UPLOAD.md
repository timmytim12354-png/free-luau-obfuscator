# Upload this folder as a public GitHub repo

This directory is already its own git repository. It is **not** inside the KeyForge application repo. Nothing here is product source.

Suggested GitHub name (good search targeting):

```text
free-luau-obfuscator
```

Suggested description (paste into GitHub):

```text
Free Luau / wYnFuscate obfuscator workflow and KeyForge (keyforge.win) docs. Roblox key system, loader, and custom Lua GUI SDK. Explanations and official links only — no product source.
```

Suggested topics (GitHub → About → Topics):

```text
luau
roblox
obfuscator
wynfuscate
lua
key-system
script-protection
keyforge
roblox-scripts
luarmor-alternative
licensing
whitelist
roblox-gui
```

## One command (GitHub CLI)

From this folder, signed into `gh`:

```powershell
cd $HOME\Downloads\free-luau-obfuscator
gh repo create free-luau-obfuscator --public --source=. --remote=origin --description "Free Luau / wYnFuscate obfuscator workflow and KeyForge (keyforge.win) docs. Roblox key system, loader, and custom Lua GUI SDK. No product source." --push
gh repo edit --add-topic luau,roblox,obfuscator,wynfuscate,lua,key-system,script-protection,keyforge,roblox-scripts,luarmor-alternative
```

Or run:

```powershell
.\scripts\publish-github.ps1
```

## Without GitHub CLI

1. Create an empty **public** repo on github.com named `free-luau-obfuscator` (do not add a README there).
2. In this folder:

```powershell
git remote add origin https://github.com/YOUR_USER/free-luau-obfuscator.git
git push -u origin main
```

## Optional: GitHub Pages

Settings → Pages → Deploy from branch `main` → folder `/docs`.

That serves the markdown docs as a simple site. The product itself stays on [keyforge.win](https://www.keyforge.win).

## Do not upload

- Anything from the KeyForge application repo
- `.env`, tokens, dashboard screenshots with keys
- A copy of `/sdk/client.lua` (link it; do not vendor it)
