{ lib, ... }:

{
  # Nix settings and flake support
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    warn-dirty = false;
  };

  # Automatic garbage collection to maintain disk space
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Allow proprietary/unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable NetworkManager by default on all machines
  networking.networkmanager.enable = lib.mkDefault true;

  # Fallback state version (can be overridden per host)
  system.stateVersion = lib.mkDefault "26.05";
}
