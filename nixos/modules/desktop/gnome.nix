{ lib, config, pkgs, ... }:

let
  cfg = config.modules.desktop.gnome;
in
{
  options.modules.desktop.gnome = {
    enable = lib.mkEnableOption "GNOME Desktop Environment";
  };

  config = lib.mkIf cfg.enable {
    # Enable GDM and GNOME Desktop
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    # Enable common desktop apps by default when GNOME is enabled
    modules.desktop.apps.enable = lib.mkDefault true;

    environment.systemPackages = with pkgs; [
      gnomeExtensions.blur-my-shell
      gnome-extension-manager
    ];
  };
}
