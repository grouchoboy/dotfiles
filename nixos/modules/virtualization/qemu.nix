{ lib, config, ... }:

let
  cfg = config.modules.virtualization.qemu;
in
{
  options.modules.virtualization.qemu = {
    enable = lib.mkEnableOption "QEMU / KVM Guest integration";
  };

  config = lib.mkIf cfg.enable {
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
  };
}
