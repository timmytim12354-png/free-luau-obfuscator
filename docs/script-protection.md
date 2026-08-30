# Roblox and Luau script protection

Hiding a loader URL is not protection. KeyForge authenticates the user, can bind HWID, and delivers a protected payload instead of the source you keep in the dashboard.

Live: [https://www.keyforge.win/lua-script-protection](https://www.keyforge.win/lua-script-protection)

## Layers that belong on a host

**Authentication.** The loader asks KeyForge whether a key (or another access mode) is valid right now. That decision happens on the server. A shared Discord file cannot revoke access after you change your mind.

**HWID protection.** After the first successful run, a key can bind to that device. A leaked key then fails on a second machine.

**Whitelisting.** Keys are a whitelist: only listed licenses receive the script. You can also tie redeem to Discord members.

**Protected delivery.** Players run a short loadstring aimed at keyforge.win. Combine that with execution limits and instant revoke.

**Obfuscation.** Dashboard obfuscation (wYnFuscate / ForgeVM, depending on plan) makes casual dumping harder. It is not a magic shield — pair it with keys and HWID.

**Execution controls.** Cap how many times a key can run, watch errors in analytics, and disable a script without hunting every copy that already leaked.

## Will this stop every dumper?

No honest host can promise that. The goal is to stop casual leaks and withdraw access quickly.

## Related

- [Free Luau obfuscator](free-luau-obfuscator.md)
- [How the loader works](how-the-loader-works.md)
- Live guide: [https://www.keyforge.win/docs/script-protection](https://www.keyforge.win/docs/script-protection)
