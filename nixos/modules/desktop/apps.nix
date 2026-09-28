{ lib, pkgs, config, ... }:

let
  cfg = config.modules.desktop.apps;
in
{
  options.modules.desktop.apps = {
    enable = lib.mkEnableOption "Common Desktop Applications";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
      ghostty
      bitwarden-desktop
    ];
  };
}
