-- HWID bind is decided on KeyForge after the first successful run.
-- Enable bind on the key in the dashboard. This file only shows how a custom UI
-- should treat the result. Placeholders only.

local function handleVerifyResult(statusLabel, verified)
    if verified.ok then
        return true
    end
    if verified.code == "HWID_MISMATCH" then
        statusLabel.Text = "This key is locked to another device. Ask the owner for a reset."
        return false
    end
    statusLabel.Text = verified.message
    return false
end

-- After a good verify, loadScript can still fail closed on HWID:
local function handleLoadResult(statusLabel, loaded)
    if loaded.ok then
        return true
    end
    if loaded.code == "HWID_MISMATCH" then
        statusLabel.Text = "Device lock rejected delivery. Reset HWID from the dashboard or Discord."
        return false
    end
    statusLabel.Text = loaded.message
    return false
end

return {
    handleVerifyResult = handleVerifyResult,
    handleLoadResult = handleLoadResult,
}
