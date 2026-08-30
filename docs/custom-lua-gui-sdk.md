# Custom Lua GUI SDK

The headless Lua SDK lets your Roblox UI collect a key and show messages. **KeyForge still validates the key, binds the device, checks the executor, and delivers the protected script from the server.**

Available on **Creator, Scale, and Enterprise**. Compare plans: [https://www.keyforge.win](https://www.keyforge.win)

Live docs: [https://www.keyforge.win/docs/custom-lua-gui](https://www.keyforge.win/docs/custom-lua-gui)

This repository does **not** vendor `client.lua`. Always download the hosted file:

```text
https://www.keyforge.win/sdk/client.lua
```

## Enable it

1. Edit a keyed script → **Interface** → **Custom Lua GUI**.
2. Copy the dashboard snippet (project id, script id, signed integration token).
3. Wire your own buttons and TextBox to `getKeyUrl`, `verify`, and `loadScript`.

The integration token identifies a script. It is not a private server secret. Still: do not post it in a public gist with a live script id if you can avoid it.

## Three calls

| Method | What it does |
| --- | --- |
| `client:getKeyUrl()` | Returns the linked ad-gate URL and config. Returns `nil` when no gate is linked. |
| `client:verify(key)` | Validates the key server-side and stores a short-lived, signed access token inside the client. |
| `client:loadScript()` | Runs protected delivery, including executor fingerprint and HWID checks. The access token is single-use. |

Always branch on `result.ok`. Use `result.code` for behavior. Show `result.message` to users. Do not recreate authorization logic in Lua.

## Result codes your GUI can trust

| Code | Meaning |
| --- | --- |
| `KEY_VALID` | The key passed initial server checks. Call `loadScript` next. |
| `KEY_INVALID` | The key does not exist or the field is empty. |
| `KEY_EXPIRED` | The key is past its expiration date. |
| `KEY_REVOKED` | The creator or an automated policy revoked the key. |
| `KEY_SCRIPT_MISMATCH` | The key belongs to a different script. |
| `HWID_MISMATCH` | The key is locked to another device. |
| `RATE_LIMITED` | Too many attempts. Wait, then retry. |
| `SESSION_EXPIRED` | Short-lived verification expired. Ask for the key again. |
| `NETWORK_ERROR` | Could not reach KeyForge or the response was unreadable. |
| `PROJECT_DISABLED` | The project is disabled or delivery is paused. |
| `VERIFY_REQUIRED` | You called `loadScript` before a successful `verify`. |

## Usage sketch

See [examples/custom-gui-usage.lua](../examples/custom-gui-usage.lua). That file only shows how to **fetch** the official SDK and call the public methods. It is not the SDK implementation.

## Never put in the GUI

- Database credentials
- Dashboard passwords
- Raw script source
- Client-only key-validation rules

Related: [How the loader works](how-the-loader-works.md)
