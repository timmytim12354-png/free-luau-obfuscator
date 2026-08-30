# Custom Lua GUI SDK

Headless client for Creator, Scale, and Enterprise. Your ScreenGui collects a key and shows messages. KeyForge still validates the key, binds the device, and delivers the script.

Always download:

```text
https://www.keyforge.win/sdk/client.lua
```

Do not vendor that file here. Live contract: [https://www.keyforge.win/docs/custom-lua-gui](https://www.keyforge.win/docs/custom-lua-gui)

## Enable

1. Edit a keyed script → Interface → Custom Lua GUI.
2. Copy `projectId`, `scriptId`, and the signed integration token.
3. Wire buttons to `getKeyUrl`, `verify`, and `loadScript`.

The token identifies a script. It is not a database password. Still do not paste a live token next to a production script id in a public gist.

## Methods

| Method | Role |
| --- | --- |
| `KeyForge.new({ projectId, scriptId, integrationToken })` | Bind one script |
| `client:getKeyUrl()` | Linked reward-gate URL, or `nil` |
| `client:verify(key)` | Server check; stores a short-lived access token |
| `client:loadScript()` | Protected delivery; token is single-use |

Branch on `result.ok`. Codes: [error-handling.md](error-handling.md). Example: [../examples/custom-gui-usage.lua](../examples/custom-gui-usage.lua)

## Never put in the GUI

Database credentials, dashboard passwords, raw script source, or client-only key checks.
