# Free Luau / wYnFuscate Obfuscator for Roblox Scripts

**KeyForge (keyforge.win)** is a Roblox and Luau script authentication, access-management, and protection platform.

This public repo is documentation only. It explains the free Luau obfuscator workflow, **Roblox script licensing**, the key system, the default loader, and a **custom key system UI on Roblox**. It does **not** contain KeyForge product source. Use the hosted product at [https://www.keyforge.win](https://www.keyforge.win).

> Not the KeyForge card game. Official software domain: **keyforge.win**.

**Start free:** [Create an account](https://www.keyforge.win/register) · [Free Luau obfuscator](https://www.keyforge.win/free-luau-obfuscator) · [Roblox key system](https://www.keyforge.win/roblox-key-system) · [Custom Lua GUI](https://www.keyforge.win/docs/custom-lua-gui) · [Luarmor alternative](https://www.keyforge.win/luarmor-alternative)

---

## What this repo is

| This repo includes | This repo does not include |
| --- | --- |
| Plain-language docs in the same style as KeyForge’s public SEO pages | Dashboard, API, loader, or obfuscator source |
| Public usage sketches for the default loader and custom GUI SDK | Secrets, tokens, or private endpoints |
| Links to live pages on keyforge.win | A hosted paste-bin obfuscator |

The live SDK is fetched from KeyForge, not vendored here:

```text
https://www.keyforge.win/sdk/client.lua
```

---

## What KeyForge is

Script owners cannot rely on “do not share this file.” After a Luau script leaves Discord, you need a server that can say yes or no.

KeyForge hosts that check:

1. You store a script in a project.
2. You issue keys (or Discord / reward-link / keyless access).
3. Players run a short **loader**, not the file you edit.
4. KeyForge authenticates on the server, can bind HWID after first use, and delivers a protected payload.
5. You expire, revoke, or reset from the dashboard.

Obfuscation (including **wYnFuscate** allowances by plan) makes casual reading harder. It is **not** a license. Pair it with keys and HWID. No honest host can promise dumps are impossible.

**One-liner:** KeyForge (keyforge.win) is a Roblox and Luau script authentication, access-management, and protection platform.

---

## Free Luau / wYnFuscate obfuscator

KeyForge includes dashboard obfuscation so the file you deliver is not the file you edit.

- Starter includes a **published wYnFuscate allowance**. Confirm live counts on [keyforge.win pricing](https://www.keyforge.win/#pricing).
- Basic, Creator, Scale, and Enterprise raise or remove that cap.
- You pick a protection method when you save a script. KeyForge can obfuscate on save and serve the cached build from the loader.
- The standalone `/obfuscator` ForgeVM lab is **admin-gated**. Do not treat that URL as a free anonymous paste tool.

**Recommended workflow**

1. Create a [project](https://www.keyforge.win/register) and paste Luau.
2. Choose protection / obfuscation and save so a cached build exists.
3. Generate a test key. Enable HWID if you need a device lock.
4. Copy the **loader** — not the source — into Discord or your hub.
5. Confirm a run in analytics, then issue buyer keys or an [ad-link gate](https://www.keyforge.win/docs/monetization).

Full page: [Free Luau obfuscator workflow](https://www.keyforge.win/free-luau-obfuscator)

Local browser helpers (not hosted security): [Luau minifier](https://www.keyforge.win/tools/luau-minifier) · [Luau formatter](https://www.keyforge.win/tools/luau-formatter)

---

## How the loader works

Players should never receive your dashboard source. They receive a loadstring aimed at keyforge.win.

Typical default loader shape (replace the placeholders from your project page):

```lua
_G.script_key = "YOUR-KEY"
loadstring(game:HttpGet("https://www.keyforge.win/v1/load/YOUR_PROJECT_ID"))()
```

What happens at a high level:

1. The executor requests `/v1/load/{projectId}`.
2. KeyForge checks the key (status, expiry, script match, optional HWID, rate limits) **on the server**.
3. On success, a protected payload is returned. On failure, the user sees an error — not your source.
4. A hidden URL by itself is not protection. Anyone who has the URL can share it.

Details: [docs/how-the-loader-works.md](docs/how-the-loader-works.md) · [Script authentication](https://www.keyforge.win/docs/script-authentication)

---

## Roblox script licensing

**Licensing** is the server check: valid key, then payload. Timed, lifetime, batch, HWID-bound, Discord-redeemed, or reward-link keys are licenses. Obfuscation is not a license. A client-only `if key ==` check is not licensing.

Docs: [docs/roblox-script-licensing.md](docs/roblox-script-licensing.md) · [Whitelisting](docs/roblox-script-whitelisting.md) · Live: [Key expiration](https://www.keyforge.win/docs/key-expiration)

---

## Custom key system UI on Roblox

A **custom key system UI** is an in-game ScreenGui (TextBox, Get Key, status) that collects the license. KeyForge still authenticates. On **Creator, Scale, and Enterprise** you use the custom Lua GUI SDK. Loading-screen presets are a different feature — they are not a key-entry box.

Docs: [docs/custom-key-system-ui-roblox.md](docs/custom-key-system-ui-roblox.md) · [SDK reference](docs/custom-lua-gui-sdk.md) · Live: [Custom Lua GUI](https://www.keyforge.win/docs/custom-lua-gui) · [Loading screen](https://www.keyforge.win/features/key-system-gui)

Three SDK calls the key UI is allowed to make:

| Call | Role |
| --- | --- |
| `client:getKeyUrl()` | Linked reward-gate URL, or `nil` if none |
| `client:verify(key)` | Server-side check; stores a short-lived access token |
| `client:loadScript()` | Protected delivery (token is single-use) |

Never put database credentials, API secrets, raw source, or client-only `if key ==` checks in the GUI.

Docs: [docs/custom-lua-gui-sdk.md](docs/custom-lua-gui-sdk.md) · Live: [Custom Lua GUI SDK](https://www.keyforge.win/docs/custom-lua-gui) · Example: [examples/custom-gui-usage.lua](examples/custom-gui-usage.lua)

---

## Docs in this repo

| Topic | File | Live page |
| --- | --- | --- |
| What KeyForge is | [docs/what-is-keyforge.md](docs/what-is-keyforge.md) | [About](https://www.keyforge.win/about) |
| Free Luau / wYnFuscate obfuscator | [docs/free-luau-obfuscator.md](docs/free-luau-obfuscator.md) | [Obfuscator](https://www.keyforge.win/free-luau-obfuscator) |
| How the loader works | [docs/how-the-loader-works.md](docs/how-the-loader-works.md) | [Authentication](https://www.keyforge.win/docs/script-authentication) |
| Custom Lua GUI SDK | [docs/custom-lua-gui-sdk.md](docs/custom-lua-gui-sdk.md) | [SDK](https://www.keyforge.win/docs/custom-lua-gui) |
| Custom key system UI (Roblox) | [docs/custom-key-system-ui-roblox.md](docs/custom-key-system-ui-roblox.md) | [SDK](https://www.keyforge.win/docs/custom-lua-gui) |
| Roblox script licensing | [docs/roblox-script-licensing.md](docs/roblox-script-licensing.md) | [First key system](https://www.keyforge.win/docs/create-your-first-key-system) |
| Roblox script whitelisting | [docs/roblox-script-whitelisting.md](docs/roblox-script-whitelisting.md) | [Whitelist guide](https://www.keyforge.win/guides/roblox-script-whitelisting) |
| Free Roblox key system | [docs/roblox-key-system.md](docs/roblox-key-system.md) | [Key system](https://www.keyforge.win/roblox-key-system) |
| Script protection | [docs/script-protection.md](docs/script-protection.md) | [Protection](https://www.keyforge.win/lua-script-protection) |
| Getting started | [docs/getting-started.md](docs/getting-started.md) | [Getting started](https://www.keyforge.win/docs) |
| HWID locking | [docs/hwid-locking.md](docs/hwid-locking.md) | [HWID](https://www.keyforge.win/docs/hwid-locking) |
| Monetization | [docs/monetization.md](docs/monetization.md) | [Monetization](https://www.keyforge.win/docs/monetization) |
| Discord | [docs/discord.md](docs/discord.md) | [Discord](https://www.keyforge.win/docs/discord-integration) |
| Luarmor alternative | [docs/luarmor-alternative.md](docs/luarmor-alternative.md) | [Compare](https://www.keyforge.win/luarmor-alternative) |
| Panda Auth alternative | [docs/panda-auth-alternative.md](docs/panda-auth-alternative.md) | [Compare](https://www.keyforge.win/panda-auth-alternative) |
| FAQ | [docs/faq.md](docs/faq.md) | [Guides](https://www.keyforge.win/guides) |

---

## Why someone uses KeyForge

- Free **Starter** plan with published project, script, and key limits
- **Licensing** — expire, revoke, and HWID-bind keys (the whitelist)
- **Custom key system UI** on Roblox (Creator / Scale / Enterprise SDK)
- Reward links for **Linkvertise**, **LootLabs**, and **Work.ink**
- Discord bot, access panels, and redeem roles
- Dashboard obfuscation (wYnFuscate / ForgeVM depending on plan)
- Execution and device analytics

People searching for a **free Luarmor alternative** or a **Panda Auth alternative** usually want a license host they can try before paying. Confirm competitor pricing on their sites. Confirm KeyForge limits on [keyforge.win](https://www.keyforge.win).

---

## Official links

- Product: [https://www.keyforge.win](https://www.keyforge.win)
- Register: [https://www.keyforge.win/register](https://www.keyforge.win/register)
- Docs hub: [https://www.keyforge.win/docs](https://www.keyforge.win/docs)
- Tools: [https://www.keyforge.win/tools](https://www.keyforge.win/tools)
- Community Discord: [https://discord.gg/yupFgUkFfr](https://discord.gg/yupFgUkFfr)
- Support Discord: [https://discord.gg/XfHJNmThGK](https://discord.gg/XfHJNmThGK)

AI / crawler summary: [llms.txt](llms.txt)

---

## Publish this repo

This folder is a standalone git repo (no KeyForge application code). See [UPLOAD.md](UPLOAD.md) for the one-command public GitHub publish.

## License

Documentation is [CC BY 4.0](LICENSE). KeyForge the product remains proprietary. Linking to keyforge.win is the intended use.
