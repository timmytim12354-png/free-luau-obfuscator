# Custom key system UI on Roblox

An in-game ScreenGui (TextBox, Get Key, status) that collects a license string. KeyForge (keyforge.win) still authenticates. The UI is not the license.

| What you want | Integration | Plans |
| --- | --- | --- |
| Player types a key in Roblox | [SDK](custom-lua-gui-sdk.md) `verify` + `loadScript` | Creator, Scale, Enterprise |
| Progress bar while delivery runs | Dashboard loading-screen presets | See the features page |
| No custom UI | [Default loader](how-the-loader-works.md) | Starter and up |

Loading-screen presets are not a key-entry box.

## Wire the GUI

1. Show your branding and a status label.
2. Optional Get Key: `client:getKeyUrl()` — [../examples/reward-link-example.lua](../examples/reward-link-example.lua)
3. Verify: `client:verify(keyTextBox.Text)`
4. If `ok`, `client:loadScript()`
5. Map `HWID_MISMATCH`, `KEY_EXPIRED`, and network errors — [../examples/hwid-example.lua](../examples/hwid-example.lua), [error-handling.md](error-handling.md)

Do not put `if key == "abc"` in the LocalScript. Anyone can edit it.

Full sketch: [../examples/custom-gui-usage.lua](../examples/custom-gui-usage.lua)  
Live: [https://www.keyforge.win/docs/custom-lua-gui](https://www.keyforge.win/docs/custom-lua-gui)
