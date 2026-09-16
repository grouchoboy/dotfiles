#!/usr/bin/env bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
KONSOLE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/konsole"

mkdir -p "$KONSOLE_DIR"
cp "$DOTFILES_DIR/Gruvbox-Light-Hard.colorscheme" "$KONSOLE_DIR/"
