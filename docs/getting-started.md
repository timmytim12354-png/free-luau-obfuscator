# Getting started with KeyForge

Shortest path from an account to a protected script. You do **not** need Discord or ads for the first test.

Live: [https://www.keyforge.win/docs](https://www.keyforge.win/docs)

1. **Register** at [https://www.keyforge.win/register](https://www.keyforge.win/register). Verify email or Discord if onboarding asks — that protects the dashboard, not the loader.
2. **Create a project.** Dashboard → New project. Name it after the script you will ship.
3. **Add a script.** Paste Luau, pick protection, save. The source stays in your project.
4. **Generate a key.** Open Keys and create one lifetime test key.
5. **Copy the loader.** On the project page, copy the loadstring. Run it in a supported executor with the test key.
6. **Confirm a run.** Check Overview / analytics for the handshake. Then issue real keys or an ad link.

## Typical loader shape

```lua
_G.script_key = "YOUR-KEY"
loadstring(game:HttpGet("https://www.keyforge.win/v1/load/YOUR_PROJECT_ID"))()
```

## Common mistakes

- Sending buyers the dashboard source instead of the loader
- Skipping a test key and debugging on paying users
- Assuming a hidden `/v1/load` URL is enough without keys

**Do I need a paid plan?**  
Starter is enough to prove the loader. Upgrade when you hit project, key, or obfuscation caps.
