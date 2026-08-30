-- KeyForge custom Lua GUI usage (documentation only).
-- This is not the SDK. Download the official client from keyforge.win.
-- Creator / Scale / Enterprise: https://www.keyforge.win/docs/custom-lua-gui

local sdkUrl = "https://www.keyforge.win/sdk/client.lua"
local downloaded, sdkSource = pcall(function()
    return game:HttpGet(sdkUrl, true)
end)
assert(downloaded and type(sdkSource) == "string",
    "[KeyForge] Could not download the SDK: " .. tostring(sdkSource))

local compiler = loadstring or load
assert(type(compiler) == "function",
    "[KeyForge] This executor does not provide loadstring.")

local compiled, sdkChunk, compileError = pcall(compiler, sdkSource)
assert(compiled and type(sdkChunk) == "function",
    "[KeyForge] SDK response was not valid Lua: "
        .. tostring(compiled and compileError or sdkChunk))

local initialized, KeyForge = pcall(sdkChunk)
assert(initialized and type(KeyForge) == "table" and type(KeyForge.new) == "function",
    "[KeyForge] SDK initialization failed: " .. tostring(KeyForge))

local client = KeyForge.new({
    projectId = "YOUR_PROJECT_ID",
    scriptId = "YOUR_SCRIPT_ID",
    integrationToken = "SIGNED_TOKEN_FROM_DASHBOARD",
})

-- Optional: copy the linked reward-gate URL
-- local url, response = client:getKeyUrl()

-- Wire these to your own ScreenGui controls:
-- local verified = client:verify(keyTextBox.Text)
-- if not verified.ok then
--     statusLabel.Text = verified.message
--     return
-- end
-- local loaded = client:loadScript()
