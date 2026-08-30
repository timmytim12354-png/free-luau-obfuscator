-- Reward-link "Get Key" button for a custom UI.
-- Attach a real Linkvertise, LootLabs, or Work.ink URL in the KeyForge dashboard
-- and set the return path to your /a/… gate. Then getKeyUrl() can return that URL.

local function copyRewardLink(client, statusLabel)
    local url, response = client:getKeyUrl()
    if not url then
        statusLabel.Text = (response and response.message) or "No gate is linked. Use a dashboard key instead."
        return nil
    end
    if type(setclipboard) == "function" then
        setclipboard(url)
        statusLabel.Text = "Opened / copied the key link. Finish the checkpoint, then paste the key."
    else
        statusLabel.Text = url
    end
    return url
end

return { copyRewardLink = copyRewardLink }
