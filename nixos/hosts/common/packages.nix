{ pkgs, inputs, ... }:

{
  # System-wide packages installed on all machines
  environment.systemPackages = with pkgs; [
    # Core CLI & Editors
    vim
    neovim
    git
    wget
    curl

    # Build tools & Dotfiles & Shell utils
    zsh
    gcc
    gnumake
    tree-sitter
    nodejs
    stow
    htop
    tmux
    tree
    jq
    unzip
    zip

    # Password management CLI
    bitwarden-cli

    inputs.antigravity-nix.packages.${pkgs.system}.google-antigravity-cli
  ];
}
