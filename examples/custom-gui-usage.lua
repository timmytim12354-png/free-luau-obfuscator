-- KeyForge custom Lua GUI usage (MIT example).
-- Not the SDK. Fetches https://www.keyforge.win/sdk/client.lua
-- Creator / Scale / Enterprise. Docs: https://www.keyforge.win/docs/custom-lua-gui

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

-- Replace these with your ScreenGui instances.
local keyTextBox = { Text = "" }
local statusLabel = { Text = "" }

local function setStatus(text)
    statusLabel.Text = text
end

local function onGetKey()
    local url, response = client:getKeyUrl()
    if url then
        if type(setclipboard) == "function" then
            setclipboard(url)
        end
        setStatus("Key link copied")
        return
    end
    setStatus((response and response.message) or "No reward link is attached to this script.")
end

local function onVerify()
    setStatus("Checking key...")
    local verified = client:verify(keyTextBox.Text)
    if not verified.ok then
        setStatus(verified.message)
        return
    end
    setStatus("Loading securely...")
    local loaded = client:loadScript()
    if not loaded.ok then
        setStatus(loaded.message)
    end
end

-- getKeyButton.MouseButton1Click:Connect(onGetKey)
-- verifyButton.MouseButton1Click:Connect(onVerify)
return { client = client, onGetKey = onGetKey, onVerify = onVerify }
