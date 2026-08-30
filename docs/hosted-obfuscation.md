# Hosted Luau obfuscation (wYnFuscate)

KeyForge can obfuscate on save in the dashboard so the file you deliver is not the file you edit. Starter includes a published **wYnFuscate** allowance; Basic, Creator, Scale, and Enterprise raise or remove that cap. Confirm numbers on [keyforge.win](https://www.keyforge.win/#pricing).

This repository’s [cli/](../cli) only minifies or formats locally. It is not the hosted pipeline.

## Order that actually works

1. Paste Luau into a project and save with protection enabled so a cached build exists.
2. Create a test key. Enable HWID if sharing is the risk.
3. Ship the [loader](how-the-loader-works.md), not the source.
4. Confirm a run in analytics, then issue buyer keys or a reward-link gate.

Obfuscation slows casual reading. It is not a license and does not make dumps impossible. Pair it with keys and HWID.

The standalone `/obfuscator` ForgeVM lab is admin-gated. Do not treat that URL as a public paste tool.

Live workflow: [https://www.keyforge.win/free-luau-obfuscator](https://www.keyforge.win/free-luau-obfuscator)
