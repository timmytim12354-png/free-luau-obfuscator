# Creates a public GitHub repo from this folder and pushes main.
# Requires: GitHub CLI (`gh auth login`) and git.

$ErrorActionPreference = "Stop"
Set-Location (Split-Path -Parent $PSScriptRoot)

$Name = "free-luau-obfuscator"
$Description = "Free Luau / wYnFuscate obfuscator workflow and KeyForge (keyforge.win) docs. Roblox key system, loader, and custom Lua GUI SDK. No product source."

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Error "Install GitHub CLI: https://cli.github.com/ then run gh auth login"
}

git status | Out-Null

gh repo create $Name --public --source=. --remote=origin --description $Description --push
gh repo edit --add-topic luau,roblox,obfuscator,wynfuscate,lua,key-system,script-protection,keyforge,roblox-scripts,luarmor-alternative

Write-Host "Public repo is up. Add the About blurb and website https://www.keyforge.win in GitHub settings if the CLI did not."
