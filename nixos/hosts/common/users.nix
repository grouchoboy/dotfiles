{ pkgs, ... }:

{
  # Define default user account
  users.users.manu = {
    isNormalUser = true;
    description = "manu";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };
}
