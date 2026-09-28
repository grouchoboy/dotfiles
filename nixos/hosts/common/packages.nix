{ pkgs, ... }:

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
    gnumake
    stow
    htop
    tmux
    tree
    jq
    unzip
    zip

    # Password management CLI
    bitwarden-cli
  ];
}
