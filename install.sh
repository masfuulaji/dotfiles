#!/usr/bin/env bash
# Dotfiles Setup Script for Linux / WSL
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Setting up dotfiles from $DOTFILES_DIR..."

# 1. Alacritty
mkdir -p ~/.config/alacritty
ln -sf "$DOTFILES_DIR/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
echo "[OK] Linked Alacritty -> ~/.config/alacritty/alacritty.toml"

# 2. Zellij
mkdir -p ~/.config/zellij
ln -sf "$DOTFILES_DIR/zellij/config.kdl" ~/.config/zellij/config.kdl
echo "[OK] Linked Zellij -> ~/.config/zellij/config.kdl"

# 3. Neovim
mkdir -p ~/.config
if [ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then
    BACKUP_DIR=~/.config/nvim_backup_$(date +%Y%m%d%H%M%S)
    mv ~/.config/nvim "$BACKUP_DIR"
    echo "Backed up existing ~/.config/nvim to $BACKUP_DIR"
fi
ln -sfn "$DOTFILES_DIR/nvim" ~/.config/nvim
echo "[OK] Linked Neovim -> ~/.config/nvim"

# 4. Starship
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/starship/starship.toml" ~/.config/starship.toml
echo "[OK] Linked Starship -> ~/.config/starship.toml"

echo -e "\nAll dotfiles successfully linked!"
