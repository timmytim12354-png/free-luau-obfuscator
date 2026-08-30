# HWID locking on KeyForge

HWID lock means the key remembers the first client that redeemed it. Later machines get `HWID_MISMATCH` instead of the script.

Live: [https://www.keyforge.win/docs/hwid-locking](https://www.keyforge.win/docs/hwid-locking) · Guide: [https://www.keyforge.win/guides/how-hwid-authentication-works](https://www.keyforge.win/guides/how-hwid-authentication-works)

## How to use it

1. Create or edit a key. Bind happens **after the first good run**, not at generation time.
2. Test on one device. Confirm the key shows a bound device.
3. Reset when you must. Buyers change PCs. Reset HWID from the dashboard or Discord when your policy allows it.

## Honest limits

- Do not promise unlimited HWID resets — that becomes a sharing desk.
- Do not treat HWID as unbreakable DRM. It stops casual sharing, not a determined dumper.

The custom Lua GUI SDK surfaces `HWID_MISMATCH`. The default loader shows a bound-device error.

Local helper (format only, does not forge binds): [https://www.keyforge.win/tools/hwid-auth-tester](https://www.keyforge.win/tools/hwid-auth-tester)
