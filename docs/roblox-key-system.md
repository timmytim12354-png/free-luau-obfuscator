# Free Roblox key system for script developers

A Roblox key system checks a license before your Luau script is delivered. The player provides a key; your host verifies it, optionally binds HWID, then returns the protected script.

**KeyForge Starter is free** with published project, script, and key limits. You can create a project, add a script, and generate keys without a paid plan.

Live: [https://www.keyforge.win/roblox-key-system](https://www.keyforge.win/roblox-key-system)

## What a Roblox key system is

Script owners cannot rely on “do not share this file.” A key system moves the decision to a server: the executor requests access, KeyForge validates the key, then the protected payload is delivered. That is the difference between a pastebin loader and a license.

## How KeyForge works

1. **Create a project.** It holds the script, keys, and Discord or ad-link settings.
2. **Add a script.** Paste Luau, pick protection, and save. Players receive the loader, not the file you uploaded.
3. **Create keys.** Issue one key or a batch. Choose lifetime or an expiry.
4. **HWID locking.** After the first successful run you can bind the key to that device so the same license cannot wander.
5. **Expire or revoke.** Cut access from the dashboard when a buyer refunds or a key leaks.
6. **Manage users.** Map keys to Discord members, reset HWID from the bot, and watch execution counts.
7. **Monetize access.** Sell keys, or let players earn one through Linkvertise, LootLabs, or Work.ink.
8. **Protect delivery.** The loader talks to keyforge.win. Combine that with [script protection](script-protection.md) and [dashboard obfuscation](free-luau-obfuscator.md).

## FAQ

**Does this work with Linkvertise, Work.ink, or LootLabs?**  
Yes. Reward links can send a player through those networks and issue a KeyForge key when the checkpoint completes.

**Do I need Discord for the first test?**  
No. Project → script → key → loader is enough. Discord and panels are optional.

Start: [https://www.keyforge.win/register](https://www.keyforge.win/register) · Guide: [https://www.keyforge.win/docs/create-your-first-key-system](https://www.keyforge.win/docs/create-your-first-key-system)
