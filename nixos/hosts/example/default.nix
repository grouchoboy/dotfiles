{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "example-laptop";

  # Modern UEFI systemd-boot bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable modules
  modules = {
    desktop = {
      gnome.enable = true;
    };
    services = {
      audio.enable = true;
      printing.enable = true;
    };
    # Virtualization is omitted/disabled for physical bare-metal hardware
  };

  system.stateVersion = "26.05";
}
