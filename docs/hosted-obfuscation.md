# Hosted Luau obfuscation (wYnFuscate)

KeyForge can obfuscate on save in the dashboard so the file you deliver is not the file you edit. Available protection methods and allowances depend on the plan. Confirm current limits on the [pricing page](https://www.keyforge.win/en/pricing).

This repository’s [cli/](../cli) only minifies or formats locally. It is not the hosted pipeline.

## Order that actually works

1. Paste Luau into a project and save with protection enabled so a cached build exists.
2. Create a test key. Enable HWID if sharing is the risk.
3. Ship the [loader](how-the-loader-works.md), not the source.
4. Confirm a run in analytics, then issue buyer keys or a reward-link gate.

Obfuscation slows casual reading. It is not a license and does not make dumps impossible. Pair it with keys and HWID.

The standalone [free Luau obfuscator](https://www.keyforge.win/en/obfuscator) is a public paste-and-download tool; it does not require an administrator account. Public submissions retain server-side rate limits, validation and compilation resource budgets. This tool is separate from dashboard project licensing and loader delivery. Older admin-gated descriptions no longer reflect the live public tool.

Live workflow: [https://www.keyforge.win/en/free-luau-obfuscator](https://www.keyforge.win/en/free-luau-obfuscator)
