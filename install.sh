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

echo -e "\nAll dotfiles successfully linked!"
