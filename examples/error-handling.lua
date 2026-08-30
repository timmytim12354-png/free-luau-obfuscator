-- Branch on result.ok and result.code. Show result.message to the player.
-- Do not rebuild authorization in Lua.

local MESSAGES = {
    KEY_INVALID = "That key is missing or empty.",
    KEY_EXPIRED = "That key has expired.",
    KEY_REVOKED = "That key was revoked.",
    KEY_SCRIPT_MISMATCH = "That key belongs to a different script.",
    HWID_MISMATCH = "That key is locked to another device.",
    RATE_LIMITED = "Too many tries. Wait, then retry.",
    SESSION_EXPIRED = "Session expired. Enter the key again.",
    NETWORK_ERROR = "Could not reach KeyForge (keyforge.win).",
    PROJECT_DISABLED = "This project is paused.",
    VERIFY_REQUIRED = "Verify the key before loading.",
    KEY_VALID = "Key accepted. Loading…",
    SCRIPT_LOADED = "Loaded.",
}

local function applyResult(statusLabel, result)
    if type(result) ~= "table" then
        statusLabel.Text = "Unexpected response."
        return false
    end
    local fallback = result.message or "Request failed."
    statusLabel.Text = MESSAGES[result.code] or fallback
    return result.ok == true
end

return { applyResult = applyResult, MESSAGES = MESSAGES }
