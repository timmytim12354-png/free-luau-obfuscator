# Custom key system UI on Roblox

A **custom key system UI** is an in-game Roblox interface (ScreenGui, TextBox, buttons, status text) that collects a license key and shows success or error. KeyForge (keyforge.win) still authenticates on the server. The UI is the skin. The license is not decided in Lua.

Search terms this page answers: custom key system UI Roblox, Roblox key GUI, custom key interface, in-game key system, Lua key UI, Luau key prompt, whitelist UI, custom loader GUI.

Live SDK: [https://www.keyforge.win/docs/custom-lua-gui](https://www.keyforge.win/docs/custom-lua-gui)  
Loading bars (not a key box): [https://www.keyforge.win/features/key-system-gui](https://www.keyforge.win/features/key-system-gui)

## Two different UIs on KeyForge

| What you want | What to use | Plans |
| --- | --- | --- |
| **Custom key system UI** — player types or pastes a key in Roblox | [Custom Lua GUI SDK](custom-lua-gui-sdk.md) (`verify` + `loadScript`) | Creator, Scale, Enterprise |
| **Loading screen** — wide bar while the loader authenticates | Dashboard loading-screen presets | Documented on the features page |
| **No custom UI** — default loadstring + `_G.script_key` | [Default loader](how-the-loader-works.md) | Starter and up |

The loading-screen feature is **not** a key-entry box. Keys stay in the loader flow from your dashboard. The custom GUI **is** the key-entry box you design.

## What a custom key system UI should do

1. Show your branding (title, colors, Get Key / Verify buttons).
2. Optional: copy the reward-gate URL with `client:getKeyUrl()`.
3. Read the TextBox and call `client:verify(key)`.
4. If `result.ok`, call `client:loadScript()`.
5. Show `result.message` for `KEY_INVALID`, `KEY_EXPIRED`, `KEY_REVOKED`, `HWID_MISMATCH`, and network errors.

Do **not** put license rules in the GUI (`if key == "abc"`). Anyone can edit a LocalScript. [Licensing](roblox-script-licensing.md) belongs on keyforge.win.

## How to enable the custom key UI

1. Use a Creator, Scale, or Enterprise plan ([pricing](https://www.keyforge.win/#pricing)).
2. Edit a keyed script → **Interface** → **Custom Lua GUI**.
3. Copy project id, script id, and the signed integration token from the dashboard.
4. Download the hosted SDK — do not vendor a copy from this repo:

```text
https://www.keyforge.win/sdk/client.lua
```

5. Wire your ScreenGui. Usage sketch: [examples/custom-gui-usage.lua](../examples/custom-gui-usage.lua)

## API the UI is allowed to call

| Call | Role in the key system UI |
| --- | --- |
| `KeyForge.new({ projectId, scriptId, integrationToken })` | Bind the GUI to one script |
| `client:getKeyUrl()` | “Get Key” button → clipboard / browser |
| `client:verify(key)` | “Redeem” / “Unlock” — server license check |
| `client:loadScript()` | After `KEY_VALID` — protected delivery |

Full result codes: [custom-lua-gui-sdk.md](custom-lua-gui-sdk.md)

## What never belongs in the key GUI

- Dashboard passwords or database URLs
- Raw script source
- A local whitelist table you treat as security
- Forged HWID logic

The integration token identifies a script. It is not a private server secret, but do not paste a live token in a public gist next to a production script id.

## Related

- [Roblox script licensing](roblox-script-licensing.md)
- [How the loader works](how-the-loader-works.md)
- [Roblox key system](roblox-key-system.md)
- Live getting started: [https://www.keyforge.win/docs](https://www.keyforge.win/docs)
