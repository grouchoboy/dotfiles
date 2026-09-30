{ lib, pkgs, config, ... }:

let
  cfg = config.modules.development;
in
{
  options.modules.development = {
    enable = lib.mkEnableOption "Development tools";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      go
      gopls
    ];
  };
}
