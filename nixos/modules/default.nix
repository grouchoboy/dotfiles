{ ... }:

{
  imports = [
    ./desktop/gnome.nix
    ./desktop/apps.nix
    ./services/audio.nix
    ./services/printing.nix
    ./virtualization/qemu.nix
  ];
}
