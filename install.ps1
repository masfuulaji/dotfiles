# Dotfiles Setup Script for Windows
$dotfiles = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Setting up dotfiles from $dotfiles..." -ForegroundColor Cyan

function Link-Directory {
    param (
        [string]$Name,
        [string]$Target,
        [string]$Source
    )

    $parent = Split-Path -Parent $Target
    if (-not (Test-Path $parent)) {
        New-Item -ItemType Directory -Force -Path $parent | Out-Null
    }

    if (Test-Path $Target) {
        $item = Get-Item $Target
        if ($item.Attributes -match "ReparsePoint") {
            # Already pointing to correct source
            if ($item.Target -eq $Source) {
                Write-Host "[OK] Already linked $Name -> $Source" -ForegroundColor Green
                return
            }
            cmd.exe /c rmdir "$Target"
        } else {
            $backup = "${Target}_backup_$(Get-Date -Format 'yyyyMMddHHmmss')"
            Move-Item $Target $backup -Force
            Write-Host "Backed up existing $Name to $backup" -ForegroundColor Yellow
        }
    }
    New-Item -ItemType Junction -Path $Target -Target $Source | Out-Null
    Write-Host "[OK] Linked $Name -> $Source" -ForegroundColor Green
}

# 1. Alacritty
Link-Directory -Name "Alacritty" -Target "$env:APPDATA\alacritty" -Source "$dotfiles\alacritty"

# 2. Zellij
Link-Directory -Name "Zellij" -Target "$env:APPDATA\zellij\config" -Source "$dotfiles\zellij"

# 3. GlazeWM
Link-Directory -Name "GlazeWM" -Target "$env:USERPROFILE\.config\glazewm" -Source "$dotfiles\glazewm"

# 4. YASB
Link-Directory -Name "YASB" -Target "$env:USERPROFILE\.config\yasb" -Source "$dotfiles\yasb"

# 5. Neovim (Windows)
Link-Directory -Name "Neovim" -Target "$env:LOCALAPPDATA\nvim" -Source "$dotfiles\nvim"

# 6. Starship
$starshipTarget = "$env:USERPROFILE\.config\starship.toml"
$starshipParent = Split-Path -Parent $starshipTarget
if (-not (Test-Path $starshipParent)) { New-Item -ItemType Directory -Force -Path $starshipParent | Out-Null }
if (Test-Path $starshipTarget) { Remove-Item $starshipTarget -Force }
New-Item -ItemType SymbolicLink -Path $starshipTarget -Target "$dotfiles\starship\starship.toml" -ErrorAction SilentlyContinue | Out-Null
if (-not (Test-Path $starshipTarget)) {
    Copy-Item "$dotfiles\starship\starship.toml" $starshipTarget -Force
}
Write-Host "[OK] Linked Starship -> $dotfiles\starship\starship.toml" -ForegroundColor Green

# 7. PowerShell Profiles (Windows PowerShell 5.1 & PowerShell 7+)
$psProfiles = @(
    "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1",
    "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
)
foreach ($prof in $psProfiles) {
    $profDir = Split-Path -Parent $prof
    if (-not (Test-Path $profDir)) { New-Item -ItemType Directory -Force -Path $profDir | Out-Null }
    if (Test-Path $prof) { Remove-Item $prof -Force }
    New-Item -ItemType SymbolicLink -Path $prof -Target "$dotfiles\powershell\Microsoft.PowerShell_profile.ps1" -ErrorAction SilentlyContinue | Out-Null
    if (-not (Test-Path $prof)) {
        Copy-Item "$dotfiles\powershell\Microsoft.PowerShell_profile.ps1" $prof -Force
    }
}
Write-Host "[OK] Linked PowerShell Profile -> $dotfiles\powershell\Microsoft.PowerShell_profile.ps1" -ForegroundColor Green

# 8. Git Config (Tokyo Night Delta & global includes)
if (Get-Command git -ErrorAction SilentlyContinue) {
    $gitConfigPath = "$dotfiles/git/.gitconfig".Replace('\', '/')
    git config --global include.path "$gitConfigPath"
    Write-Host "[OK] Configured Git include -> $gitConfigPath" -ForegroundColor Green
}

Write-Host "`nAll dotfiles successfully linked!" -ForegroundColor Green
