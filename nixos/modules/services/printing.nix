{ lib, config, ... }:

let
  cfg = config.modules.services.printing;
in
{
  options.modules.services.printing = {
    enable = lib.mkEnableOption "CUPS Printing Service";
  };

  config = lib.mkIf cfg.enable {
    services.printing.enable = true;
  };
}
