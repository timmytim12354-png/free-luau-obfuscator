# Recreates the public GitHub repo if you are starting from a fresh clone.
# The live repo already exists: https://github.com/timmytim12354-png/free-luau-obfuscator

$ErrorActionPreference = "Stop"
Set-Location (Split-Path -Parent $PSScriptRoot)

$Name = "free-luau-obfuscator"
$Description = "Luau integration examples, local minify CLI, and KeyForge (keyforge.win) loader/SDK docs. Hosted wYnFuscate runs on KeyForge — this repo is not the obfuscator engine."

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Error "Install GitHub CLI: https://cli.github.com/ then run gh auth login"
}

gh repo create $Name --public --source=. --remote=origin --description $Description --push
gh repo edit --add-topic luau,roblox,obfuscator,wynfuscate,lua,key-system,script-protection,keyforge,roblox-scripts --homepage "https://www.keyforge.win"
