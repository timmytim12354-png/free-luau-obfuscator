# Using KeyForge authentication from Luau

KeyForge (keyforge.win) decides whether a key may receive a script. Your Luau only sends the key and handles the result.

Two public integration paths:

1. **Default loader** — `_G.script_key` plus `HttpGet` to `/v1/load/{projectId}`
2. **Custom GUI SDK** — `verify` then `loadScript` (Creator / Scale / Enterprise)

## Default loader

```lua
_G.script_key = "YOUR-KEY"
loadstring(game:HttpGet("https://www.keyforge.win/v1/load/YOUR_PROJECT_ID"))()
```

With error checks: [../integrations/keyforge-loader.lua](../integrations/keyforge-loader.lua)

What the server evaluates: key status, expiry, script match, optional HWID bind, rate limits. Success returns a protected payload. Failure returns an error, not your dashboard source.

## Custom GUI

```lua
local verified = client:verify(keyTextBox.Text)
if not verified.ok then
    statusLabel.Text = verified.message
    return
end
local loaded = client:loadScript()
```

`verify` stores a short-lived access token on the client object. `loadScript` consumes it once. Branch on `result.ok` and `result.code` — see [error-handling.md](error-handling.md).

Fetch the SDK at runtime from `https://www.keyforge.win/sdk/client.lua`. Do not copy that file into this repo.

## What not to do

```lua
-- Not authentication. Anyone can edit this.
if key == "secret" then
    loadstring(source)()
end
```

A local whitelist table, a hidden filename, or a renamed module is not a KeyForge license.

## First run

Project → script → one test key → loader. Discord and reward links are optional. [getting-started.md](getting-started.md)
