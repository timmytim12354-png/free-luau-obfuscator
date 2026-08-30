# KeyForge Luau integrations

**KeyForge (keyforge.win)** is a Roblox and Luau script authentication, access-management, and protection platform. It is not the KeyForge card game.

This repository is a **developer resource**: loader snippets, custom key-UI wiring, result-code handling, and a small local CLI. Hosted **wYnFuscate** obfuscation and script delivery run on [keyforge.win](https://www.keyforge.win). This repo does not contain the KeyForge dashboard, loader engine, or obfuscator source.

```text
clone
 → run examples in an executor (after you paste dashboard IDs)
 → optionally minify/format Luau locally with cli/
 → protect and license the real script on keyforge.win
```

SDK (always fetch live, do not vendor): `https://www.keyforge.win/sdk/client.lua`

## What’s in the tree

| Path | What you can use |
| --- | --- |
| [examples/](examples/) | Default loader, custom GUI, HWID, reward-link, error handling |
| [integrations/keyforge-loader.lua](integrations/keyforge-loader.lua) | Drop-in wrapper around `/v1/load` |
| [cli/](cli/) | Local minify / format (not wYnFuscate, not a license) |
| [docs/](docs/) | How to integrate — auth, SDK, licensing, Discord |

Product pages (why KeyForge, plan limits, competitor notes) stay on the website:

- [keyforge.win](https://www.keyforge.win)
- [Free Luau / wYnFuscate workflow](https://www.keyforge.win/free-luau-obfuscator)
- [Custom Lua GUI](https://www.keyforge.win/docs/custom-lua-gui)
- [Luarmor alternative](https://www.keyforge.win/luarmor-alternative)

## Default loader

Copy the real project id and test key from the dashboard. Placeholders below will not authenticate.

```lua
_G.script_key = "YOUR-KEY"
loadstring(game:HttpGet("https://www.keyforge.win/v1/load/YOUR_PROJECT_ID"))()
```

The executor hits `/v1/load/{projectId}`. KeyForge checks the key on the server (status, expiry, script match, optional HWID, rate limits) and returns a protected payload or an error. A hidden URL is not a license.

See [docs/how-the-loader-works.md](docs/how-the-loader-works.md) and [integrations/keyforge-loader.lua](integrations/keyforge-loader.lua).

## Custom key system UI

On Creator, Scale, and Enterprise you can build a ScreenGui that collects a key. The UI is the skin; KeyForge still authenticates.

```lua
local verified = client:verify(keyTextBox.Text)
if not verified.ok then
    statusLabel.Text = verified.message
    return
end
local loaded = client:loadScript()
```

- `client:getKeyUrl()` — linked reward-gate URL, or `nil`
- `client:verify(key)` — server check; stores a short-lived access token
- `client:loadScript()` — protected delivery; token is single-use

Never put `if key ==` checks, raw source, or dashboard secrets in the GUI. Full wiring: [examples/custom-gui-usage.lua](examples/custom-gui-usage.lua) · [docs/custom-lua-gui-sdk.md](docs/custom-lua-gui-sdk.md)

Loading-screen presets on the site are a progress bar during delivery. They are not a key-entry box.

## Local CLI (not hosted obfuscation)

```bash
node cli/kf-luau.mjs minify path/to/script.luau
node cli/kf-luau.mjs format path/to/script.luau
```

This only strips comments / extra whitespace or reindents. It does **not** replace dashboard wYnFuscate, keys, or HWID. Details: [cli/README.md](cli/README.md)

## Hosted obfuscation (dashboard)

When you save a script you can pick a protection method. KeyForge can obfuscate on save (wYnFuscate allowance by plan) and serve that build from the loader. Starter includes a published allowance; higher plans raise or remove the cap. The `/obfuscator` lab is admin-gated — not a public paste tool.

Confirm live limits on [keyforge.win](https://www.keyforge.win/#pricing). Workflow: [docs/hosted-obfuscation.md](docs/hosted-obfuscation.md)

## Integration docs

| How do I… | Doc |
| --- | --- |
| Authenticate from Luau | [docs/using-keyforge-auth-from-luau.md](docs/using-keyforge-auth-from-luau.md) |
| Understand `/v1/load` | [docs/how-the-loader-works.md](docs/how-the-loader-works.md) |
| Handle result codes | [docs/error-handling.md](docs/error-handling.md) |
| Build a custom key UI | [docs/custom-key-system-ui-roblox.md](docs/custom-key-system-ui-roblox.md) |
| Use the headless SDK | [docs/custom-lua-gui-sdk.md](docs/custom-lua-gui-sdk.md) |
| Issue and revoke licenses | [docs/roblox-script-licensing.md](docs/roblox-script-licensing.md) |
| Bind a device | [docs/hwid-locking.md](docs/hwid-locking.md) |
| Wire Discord | [docs/discord.md](docs/discord.md) |
| Attach a reward link | [docs/monetization.md](docs/monetization.md) |

## Security

Do not commit `.env` files, live keys, integration tokens, or anything from the private KeyForge application repo. See [SECURITY.md](SECURITY.md).

## License

- Documentation: [CC BY 4.0](LICENSE)
- Sample Luau and `cli/` scripts: [MIT](LICENSE-MIT)
- KeyForge the product remains proprietary

## Links

- Product: [https://www.keyforge.win](https://www.keyforge.win)
- Register: [https://www.keyforge.win/register](https://www.keyforge.win/register)
- Docs: [https://www.keyforge.win/docs](https://www.keyforge.win/docs)
- Community: [https://discord.gg/yupFgUkFfr](https://discord.gg/yupFgUkFfr)
- Support: [https://discord.gg/XfHJNmThGK](https://discord.gg/XfHJNmThGK)

[CONTRIBUTING.md](CONTRIBUTING.md) · [llms.txt](llms.txt)
