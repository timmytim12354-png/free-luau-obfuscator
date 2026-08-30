# How the KeyForge loader works

Players run a short loadstring aimed at **keyforge.win**. The raw project source stays in your account. This page is a public explanation. It does not document anti-tamper internals, and this repo does not ship the loader source.

Live: [Script authentication](https://www.keyforge.win/docs/script-authentication) · [Getting started](https://www.keyforge.win/docs)

## Default loader (what you copy)

From the project page, the usual shape is:

```lua
_G.script_key = "YOUR-KEY"
loadstring(game:HttpGet("https://www.keyforge.win/v1/load/YOUR_PROJECT_ID"))()
```

Copy the real snippet from the dashboard. Do not invent a project id.

File in this repo: [examples/default-loader.lua](../examples/default-loader.lua)

## Handshake (high level)

1. **Loader calls KeyForge.** The executor requests `/v1/load/{projectId}` on `https://www.keyforge.win`.
2. **Server checks the key.** Status, expiry, HWID (if bound), script match, and rate limits are evaluated server-side.
3. **Payload is delivered.** On success the protected script is returned. On failure the user sees an error, not the source.

A client-only `if key == "secret" then` check is not authentication. Anyone can edit that file.

## Why a hidden URL is not enough

A secret path is just another secret. It gets posted, proxied, and cached. Authentication plus a server-side payload is the minimum for a script you do not want to give away.

## What users should never receive

- Dashboard source / the module you edit
- Database credentials
- Integration tokens meant for a custom GUI (those identify a script; still do not paste them in public Discord)

## Custom UI instead of the default loader

If you want your own key box and status label, use the [custom Lua GUI SDK](custom-lua-gui-sdk.md) (Creator / Scale / Enterprise). It still verifies on KeyForge.

## Common mistakes

- Sending buyers the dashboard source instead of the loader
- Skipping a test key and debugging on paying users
- Assuming a hidden `/v1/load` URL is enough without keys
