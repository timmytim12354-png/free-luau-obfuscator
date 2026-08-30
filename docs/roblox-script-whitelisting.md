# Treating keys as a whitelist

A whitelist is the list of licenses allowed to receive the script. On KeyForge, each active key is an entry. Discord redeem and reward-link issuance add entries through those channels. An unlisted user should fail closed.

A secret filename or a hidden `/v1/load` URL is not a whitelist. Anyone who has the loadstring can share it; KeyForge still refuses delivery unless the key is active, not expired, not revoked, and optionally bound to the first device.

In-game prompt: [custom-key-system-ui-roblox.md](custom-key-system-ui-roblox.md). The GUI is not the whitelist.

Whitelisting does not erase a dumped file. It stops new authorized runs. Pair with HWID and [hosted obfuscation](hosted-obfuscation.md) if casual sharing is the problem.

Live: [https://www.keyforge.win/guides/roblox-script-whitelisting](https://www.keyforge.win/guides/roblox-script-whitelisting)
