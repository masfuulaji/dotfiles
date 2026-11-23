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
            Remove-Item $Target -Force
        } else {
            $backup = "${Target}_backup_$(Get-Date -Format 'yyyyMMddHHmmss')"
            Move-Item $Target $backup -Force
            Write-Host "Backed up existing $Name to $backup" -ForegroundColor Yellow
        }
    }
    New-Item -ItemType Junction -Path $Target -Target $Source | Out-Null
    Write-Host "[OK] Linked $Name -> $Source" -ForegroundColor Green
}

# Check if GlazeWM or YASB are running to safely update their directories
$glazeRunning = Get-Process -Name glazewm -ErrorAction SilentlyContinue
$yasbRunning = Get-Process -Name yasb -ErrorAction SilentlyContinue
$restartWM = $false

if ($glazeRunning -or $yasbRunning) {
    Write-Host "Temporarily stopping GlazeWM / YASB to link configuration directories..." -ForegroundColor Yellow
    Stop-Process -Name glazewm, yasb -Force -ErrorAction SilentlyContinue
    Start-Sleep -Milliseconds 800
    $restartWM = $true
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

if ($restartWM) {
    Write-Host "Restarting GlazeWM (and YASB)..." -ForegroundColor Cyan
    Start-Process glazewm -ArgumentList "start"
}

Write-Host "`nAll dotfiles successfully linked!" -ForegroundColor Green
