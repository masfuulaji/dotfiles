# Dotfiles (Alacritty + Zellij + GlazeWM + YASB + Neovim + Starship)

My desktop and terminal environment configuration for Windows & WSL, themed with **Tokyo Night Storm**.

## Included Tools
- **Neovim**: Full LazyVim setup with Tokyo Night (transparent), Diffview, Hardtime, and Go/Delve DAP debugging.
- **Starship**: Minimal, blazing-fast prompt with Tokyo Night Storm theme, Git status, runtime indicators, and command duration.
- **Alacritty**: Fast GPU-accelerated terminal with Tokyo Night Storm theme.
- **Zellij**: Terminal multiplexer configured for Neovim (starts in `locked` mode with `Ctrl + a` leader key, no pane frames, and auto-return to locked mode).
- **GlazeWM**: Tiling window manager for Windows v3 configured with Tokyo Night borders and gaps.
- **YASB**: Top status bar with system stats, workspace indicators, and live weather.

## Quick Setup

### Windows (PowerShell)
```powershell
git clone https://github.com/<your-username>/dotfiles.git C:\Users\sdo\dotfiles
cd C:\Users\sdo\dotfiles
.\install.ps1
```

### Linux / WSL (Bash)
```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## How It Works
Configurations are linked using NTFS Junctions on Windows and symlinks on Linux. Any changes made in this repository are immediately active without copying.
