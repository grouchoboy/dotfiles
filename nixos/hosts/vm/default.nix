{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Machine hostname
  networking.hostName = "vm";

  # Bootloader configuration (GRUB for this virtual machine)
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  # Enable machine-specific feature modules
  modules = {
    desktop = {
      gnome.enable = true;
    };
    services = {
      audio.enable = true;
      printing.enable = true;
    };
    virtualization = {
      qemu.enable = true;
    };
  };

  system.stateVersion = "26.05";
}
