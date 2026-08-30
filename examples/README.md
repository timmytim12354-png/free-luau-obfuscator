# Examples

Placeholder IDs only. Paste real values from [https://www.keyforge.win](https://www.keyforge.win). These files are not the hosted loader or SDK.

| File | Use |
| --- | --- |
| [default-loader.lua](default-loader.lua) | Two-line `/v1/load` snippet |
| [../integrations/keyforge-loader.lua](../integrations/keyforge-loader.lua) | Same flow with HttpGet error checks |
| [custom-gui-usage.lua](custom-gui-usage.lua) | Fetch SDK, `verify`, `loadScript` |
| [hwid-example.lua](hwid-example.lua) | Map `HWID_MISMATCH` in a custom UI |
| [reward-link-example.lua](reward-link-example.lua) | `getKeyUrl()` for Get Key |
| [error-handling.lua](error-handling.lua) | Branch on `result.code` |
| [discord-integration.md](discord-integration.md) | Bot / panel order (no secrets) |

Always fetch the SDK from `https://www.keyforge.win/sdk/client.lua`.
