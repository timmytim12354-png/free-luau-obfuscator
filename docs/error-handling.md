# Result codes

The custom Lua GUI SDK returns a table. Always check `result.ok` first. Use `result.code` for behavior. Show `result.message` (or a mapped string) to the player.

Example: [../examples/error-handling.lua](../examples/error-handling.lua)

| Code | Typical cause | What the UI should do |
| --- | --- | --- |
| `KEY_VALID` | Server accepted the key | Call `loadScript` |
| `SCRIPT_LOADED` | Delivery ran | Continue your script |
| `KEY_INVALID` | Empty or unknown key | Ask again |
| `KEY_EXPIRED` | Past expiry | Direct them to renew |
| `KEY_REVOKED` | Owner or policy revoked | Stop retrying that string |
| `KEY_SCRIPT_MISMATCH` | Key is for another script | Check script id |
| `HWID_MISMATCH` | Bound to another device | Point to an owner reset |
| `RATE_LIMITED` | Too many attempts | Wait, then retry |
| `SESSION_EXPIRED` | Token timed out | Call `verify` again |
| `NETWORK_ERROR` | HttpGet / JSON failed | Retry; check keyforge.win |
| `PROJECT_DISABLED` | Project paused | Stop |
| `VERIFY_REQUIRED` | `loadScript` before `verify` | Call `verify` first |

Default `/v1/load` users see executor errors instead of this table. Test with a short-lived key before you sell licenses.

Live contract: [https://www.keyforge.win/docs/custom-lua-gui](https://www.keyforge.win/docs/custom-lua-gui)
