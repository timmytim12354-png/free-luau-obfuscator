# Roblox script whitelisting

A **whitelist** is the list of licenses allowed to receive the script. On KeyForge, **keys are that list**. An unlisted user should fail closed. A secret filename, a hidden loader URL, or a “don’t leak this” Discord message is not a whitelist.

Live: [https://www.keyforge.win/guides/roblox-script-whitelisting](https://www.keyforge.win/guides/roblox-script-whitelisting) · [Script authentication](https://www.keyforge.win/docs/script-authentication)

Related searches: Roblox whitelist system, Lua whitelist, Luau whitelist, script whitelist host, HWID whitelist, Discord whitelist panel.

## Whitelist vs security through obscurity

If someone has the loadstring, they can share it. Whitelisting means KeyForge still refuses delivery unless the key (the whitelist entry) is active, not expired, not revoked, and optionally bound to the first device.

## How entries get on the list

- You create keys or a batch in the dashboard
- A buyer redeems in Discord (`/panel`, roles)
- A player finishes a Linkvertise / LootLabs / Work.ink gate
- You revoke or expire an entry when it should leave the list

That is [Roblox script licensing](roblox-script-licensing.md) with a different search word.

## Custom whitelist UI

If you want an in-game whitelist / key prompt, build a [custom key system UI on Roblox](custom-key-system-ui-roblox.md). The GUI is not the whitelist. KeyForge is.

## Honest limits

Whitelisting does not make a dumped file vanish. It stops **new** authorized runs. Pair it with HWID and [obfuscation](free-luau-obfuscator.md) if casual sharing is the problem.
