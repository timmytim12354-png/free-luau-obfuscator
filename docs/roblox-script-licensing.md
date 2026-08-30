# Roblox script licensing (Lua / Luau license keys)

**Roblox script licensing** is a server check before a Luau script is delivered. The license is the key: valid, expired, revoked, or bound to a device. KeyForge (keyforge.win) hosts that check so you are not maintaining your own auth box.

Live: [Roblox key system](https://www.keyforge.win/roblox-key-system) · [Create a key system](https://www.keyforge.win/docs/create-your-first-key-system) · [Key expiration](https://www.keyforge.win/docs/key-expiration)

Related words people search: Lua script license, Luau licensing, Roblox license key, script whitelist, HWID license, paid script access.

## What a license is (and is not)

A license on KeyForge is an entry in your project’s key list. The executor sends the string; KeyForge decides. A renamed file, a hidden Discord attachment, or a client-only `if key ==` check is **not** licensing.

Obfuscation (including [wYnFuscate](free-luau-obfuscator.md)) is not a license. It can slow casual reading. It cannot expire a buyer tomorrow.

## License types you can issue

| License style | What KeyForge does |
| --- | --- |
| Lifetime key | Valid until you revoke it |
| Timed key | Daily, weekly, custom days, or a calendar date |
| Batch keys | Many licenses with the same duration |
| HWID-bound license | After first successful run, other devices get `HWID_MISMATCH` |
| Discord-redeemed license | Panel / redeem role instead of DMing strings |
| Reward-link license | Linkvertise, LootLabs, or Work.ink checkpoint, then a key |

Validity is decided **on the server** when the loader authenticates. The client clock is not the source of truth.

## Licensing vs whitelisting

A **whitelist** is the list of licenses allowed to receive the script. On KeyForge, each active key is an entry. Discord mapping and ad-link issuance add entries through those channels. An unlisted user should fail closed. A secret filename is not a whitelist.

See [Roblox script whitelisting](roblox-script-whitelisting.md).

## Typical licensing setup

1. Create a project and save the script you want to license.
2. Choose key duration (lifetime vs time-limited).
3. Create one test license, copy the [loader](how-the-loader-works.md), confirm a run.
4. Optional: bind HWID if sharing is the risk.
5. Issue buyer keys, Discord redeem, or a reward-link gate.
6. Revoke or extend from the dashboard when a chargeback or leak happens.

Do not reuse one shared key for every buyer. Treat leftover batch keys like gift cards.

## Custom license UI in Roblox

If you want an in-game **key system UI** (TextBox, Get Key, status label) instead of only `_G.script_key`, use the [custom key system UI](custom-key-system-ui-roblox.md) on Creator / Scale / Enterprise. The GUI collects the license string. KeyForge still licenses the run.

## Honest limits

You cannot un-copy a file that already leaked. Licensing lets you stop **new** machines and revoke the license. It does not make dumps impossible.

Start: [https://www.keyforge.win/register](https://www.keyforge.win/register)
