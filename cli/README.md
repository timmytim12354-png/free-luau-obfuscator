# Local Luau helpers

Two commands you can run after cloning. They run on your machine with Node 18+. They are **not** wYnFuscate, ForgeVM, or a KeyForge license.

```bash
node cli/kf-luau.mjs minify path/to/script.luau
node cli/kf-luau.mjs format path/to/script.luau
```

Writes next to the input: `script.min.luau` or `script.fmt.luau`.

| Command | What it does | What it does not do |
| --- | --- | --- |
| `minify` | Drops `--` line comments and extra blank lines | Encrypt, rename identifiers, or hide source |
| `format` | Reindents `function` / `if` / `for` / `while` / `do` / `end` | Parse full Luau syntax |

Use these to tidy a file before you paste it into the dashboard. Hosted protection: [docs/hosted-obfuscation.md](../docs/hosted-obfuscation.md) and [https://www.keyforge.win/free-luau-obfuscator](https://www.keyforge.win/free-luau-obfuscator).

Try the sample:

```bash
node cli/kf-luau.mjs format cli/sample.luau
node cli/kf-luau.mjs minify cli/sample.luau
```
