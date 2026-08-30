# How the loader integrates

Players run a short loadstring aimed at **keyforge.win**. This repo does not ship the hosted loader. Copy the snippet from your project page.

```lua
_G.script_key = "YOUR-KEY"
loadstring(game:HttpGet("https://www.keyforge.win/v1/load/YOUR_PROJECT_ID"))()
```

Wrapper with `pcall` around `HttpGet` and `loadstring`: [../integrations/keyforge-loader.lua](../integrations/keyforge-loader.lua)

## Handshake

1. The executor requests `https://www.keyforge.win/v1/load/{projectId}`.
2. KeyForge checks the key on the server (status, expiry, HWID if bound, script match, rate limits).
3. Success returns a protected payload. Failure returns an error, not dashboard source.

A client-only `if key ==` check is not this handshake.

## Custom UI

If you want a TextBox and status label, use the [SDK](custom-lua-gui-sdk.md) instead of only `_G.script_key`. It still verifies on KeyForge.

## Mistakes that break first tests

- Sending buyers the module you edit
- Debugging on paying users without a test key
- Assuming a hidden `/v1/load` URL is enough without keys

Live: [https://www.keyforge.win/docs/script-authentication](https://www.keyforge.win/docs/script-authentication)
