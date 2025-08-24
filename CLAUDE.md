# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository containing configuration files and setup
scripts for a Linux development environment, primarily targeting Arch
Linux/Fedora with KDE.

## Architecture & Structure

### Configuration Categories
- **Terminal & Shell**: Alacritty, Ghostty terminals with Zsh configuration
- **Editor**: Neovim configuration based on kickstart.nvim
- **Window Managers**: Hyprland and Sway with Waybar status bar
- **Development Tools**: tmux, lazygit, zellij session management
- **Container Tools**: Toolbox configurations for MySQL and PostgreSQL development environments

### Key Directories
- `nvim/`: Neovim configuration using Lazy.nvim plugin manager and kickstart.nvim as base
- `hypr/`: Hyprland window manager configuration with theming (Catppuccin/Gruvbox)
- `bootstrap/`: Installation and setup scripts organized by tool/category
- `tmux/`: tmux configuration with TPM plugin manager and Gruvbox theme
- `toolbox/`: Container configurations for development databases

## Common Commands

### Bootstrap & Setup
```bash
# Clone and setup dotfiles (run from home directory)
./bootstrap/dotfiles.sh

# Install Arch Linux packages and AUR packages
./bootstrap/arch/arch.sh

# Setup individual tools
./bootstrap/zsh.sh        # Zsh shell setup
./bootstrap/nvim.sh       # Neovim setup
./bootstrap/tmux.sh       # tmux setup
./bootstrap/lazygit.sh    # Git UI setup
```

### Development Environment
```bash
# Start development database containers
cd toolbox/postgres && docker-compose up -d
cd toolbox/mysql && docker-compose up -d

# Enter postgres development container
cd toolbox/postgres && ./enter.sh
```

### Configuration Management
- Configurations are symlinked from this repository to `~/.config/`
- tmux plugins managed via TPM (Tmux Plugin Manager)
- Neovim plugins managed via Lazy.nvim
- Color themes: Primary themes are Gruvbox and Catppuccin variants

## Development Workflow

### Neovim Setup
The Neovim configuration is based on kickstart.nvim and includes:
- LSP configuration for multiple languages
- Lazy.nvim for plugin management
- Custom snippets in `nvim/snippets/`
- Gruvbox and Catppuccin color themes

### Container Development
Toolbox containers provide isolated development environments:
- PostgreSQL container with custom configuration
- MySQL 5.7 and 8.0 containers available
- Containers expose standard database ports

### Theme Management
Consistent theming across all applications:
- Gruvbox (hard/soft variants)
- Catppuccin (frappe/latte variants)
- Theme files located in respective application directories
