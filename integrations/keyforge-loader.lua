-- KeyForge default loader wrapper (integration example, MIT).
-- Replace placeholders from https://www.keyforge.win — this file is not the hosted loader.

local PROJECT_ID = "YOUR_PROJECT_ID"
local KEY = "YOUR-KEY"

assert(PROJECT_ID ~= "YOUR_PROJECT_ID", "[KeyForge] Set PROJECT_ID from your project page.")
assert(KEY ~= "YOUR-KEY", "[KeyForge] Set KEY from Dashboard → Keys.")

_G.script_key = KEY

local url = "https://www.keyforge.win/v1/load/" .. PROJECT_ID
local ok, body = pcall(function()
    return game:HttpGet(url, true)
end)

if not ok or type(body) ~= "string" or body == "" then
    error("[KeyForge] Could not reach the loader: " .. tostring(body))
end

local compiler = loadstring or load
assert(type(compiler) == "function", "[KeyForge] This executor does not provide loadstring.")

local compiled, chunk, compileError = pcall(compiler, body)
if not compiled or type(chunk) ~= "function" then
    error("[KeyForge] Loader response was not runnable Lua: " .. tostring(compiled and compileError or chunk))
end

local ran, runtimeError = pcall(chunk)
if not ran then
    error("[KeyForge] Script failed after delivery: " .. tostring(runtimeError))
end
