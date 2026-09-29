{ pkgs, ... }:

{
  # Enable zsh
  programs.zsh.enable = true;

  # Define default user account
  users.users.manu = {
    isNormalUser = true;
    description = "manu";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };
}
