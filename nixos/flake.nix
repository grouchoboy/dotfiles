{
  description = "Multi-machine NixOS flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, antigravity-nix, ... }@inputs:
    let
      inherit (nixpkgs) lib;

      # Helper function to generate host configurations
      mkHost = { hostname, system ? "x86_64-linux", extraModules ? [] }:
        lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs self; };
          modules = [
            ./hosts/common
            ./hosts/${hostname}
          ] ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        vm = mkHost {
          hostname = "vm";
        };

        example = mkHost {
          hostname = "example";
        };
      };
    };
}
