# =============================================================================
# PowerShell Profile - Tokyo Night / Dotfiles Environment
# =============================================================================

$Env:KOMOREBI_CONFIG_HOME = "$env:USERPROFILE\.config\komorebi"
$Env:STARSHIP_CONFIG = "$env:USERPROFILE\.config\starship.toml"

# -----------------------------------------------------------------------------
# PSReadLine & Predictive IntelliSense
# -----------------------------------------------------------------------------
if (Get-Module -ListAvailable PSReadLine) {
    Import-Module PSReadLine -ErrorAction SilentlyContinue

    # Up/Down arrow history search matching current input
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

    # Predictive IntelliSense (if supported in current PSReadLine version)
    try {
        Set-PSReadLineOption -PredictionSource History -ErrorAction Stop
        Set-PSReadLineOption -PredictionViewStyle InlineView -ErrorAction SilentlyContinue
    } catch {
        # PSReadLine < 2.2.0 fallback
    }

    # Enhanced completion & editing
    Set-PSReadLineKeyHandler -Key Tab -Function Complete
}

# -----------------------------------------------------------------------------
# Starship Prompt
# -----------------------------------------------------------------------------
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
} else {
    function prompt { "> " }
}

# -----------------------------------------------------------------------------
# Aliases & Functions
# -----------------------------------------------------------------------------
if (Get-Command nvim -ErrorAction SilentlyContinue) {
    Set-Alias -Name v -Value nvim -Option AllScope -ErrorAction SilentlyContinue
}
if (Get-Command lazygit -ErrorAction SilentlyContinue) {
    Set-Alias -Name lg -Value lazygit -Option AllScope -ErrorAction SilentlyContinue
}

# Jump to dotfiles repository
function dotfiles {
    Set-Location "$env:USERPROFILE\dotfiles"
}

# Quick reload profile
function reload-profile {
    & $PROFILE
    Write-Host "[OK] PowerShell profile reloaded." -ForegroundColor Green
}
