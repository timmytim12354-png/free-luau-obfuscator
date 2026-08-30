# Roblox script licensing from the integrator’s side

A license on KeyForge is a key the server will accept. Timed, lifetime, batch, HWID-bound, Discord-redeemed, and reward-link keys are all licenses. The executor sends the string; KeyForge decides.

A renamed file, a hidden Discord attachment, or `if key ==` in Luau is not licensing. [Hosted obfuscation](hosted-obfuscation.md) is not a license either — it cannot expire a buyer tomorrow.

## What to configure

| You want | Dashboard action | Client integration |
| --- | --- | --- |
| Lifetime or timed access | Create key / batch with a duration | Default loader or `verify` |
| Device lock | Enable bind; bind happens after first good run | Handle `HWID_MISMATCH` |
| Discord redeem | Invite bot, `/panel` | No extra Luau |
| Ad-earned key | Attach Linkvertise / LootLabs / Work.ink | `getKeyUrl()` in a custom UI |

Validity is decided on the server. The client clock is not the source of truth.

Keys are also the [whitelist](roblox-script-whitelisting.md): unlisted users fail closed.

## Setup that avoids support tickets

1. Save the script, create one test license, run the [loader](how-the-loader-works.md).
2. Then attach HWID, Discord, or a reward gate.
3. Do not reuse one shared key for every buyer.
4. Revoke from the dashboard on chargeback or leak.

You cannot un-copy a file that already leaked. Licensing stops new authorized runs.

Live: [https://www.keyforge.win/docs/create-your-first-key-system](https://www.keyforge.win/docs/create-your-first-key-system) · [Key expiration](https://www.keyforge.win/docs/key-expiration)
