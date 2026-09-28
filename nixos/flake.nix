{
  description = "Multi-machine NixOS flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
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
        # Current active host
        vm = mkHost {
          hostname = "vm";
        };

        # Example secondary machine (e.g. laptop)
        example = mkHost {
          hostname = "example";
        };
      };
    };
}
