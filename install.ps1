# Dotfiles Setup Script for Windows
$dotfiles = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Setting up dotfiles from $dotfiles..." -ForegroundColor Cyan

# 1. Alacritty
$alacrittyTarget = "$env:APPDATA\alacritty"
if (Test-Path $alacrittyTarget) {
    $item = Get-Item $alacrittyTarget
    if ($item.Attributes -match "ReparsePoint") {
        Remove-Item $alacrittyTarget -Force
    } else {
        Move-Item $alacrittyTarget "$env:APPDATA\alacritty_backup_$(Get-Date -Format 'yyyyMMddHHmmss')" -Force
    }
}
New-Item -ItemType Junction -Path $alacrittyTarget -Target "$dotfiles\alacritty" | Out-Null
Write-Host "[OK] Linked Alacritty -> $dotfiles\alacritty" -ForegroundColor Green

# 2. Zellij
$zellijConfigDir = "$env:APPDATA\zellij\config"
if (Test-Path $zellijConfigDir) {
    $item = Get-Item $zellijConfigDir
    if ($item.Attributes -match "ReparsePoint") {
        Remove-Item $zellijConfigDir -Force
    } else {
        Move-Item $zellijConfigDir "$env:APPDATA\zellij\config_backup_$(Get-Date -Format 'yyyyMMddHHmmss')" -Force
    }
} else {
    New-Item -ItemType Directory -Force -Path "$env:APPDATA\zellij" | Out-Null
}
New-Item -ItemType Junction -Path $zellijConfigDir -Target "$dotfiles\zellij" | Out-Null
Write-Host "[OK] Linked Zellij -> $dotfiles\zellij" -ForegroundColor Green

Write-Host "`nAll dotfiles successfully linked!" -ForegroundColor Green
