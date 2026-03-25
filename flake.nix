{
  description = "NixOS server config for home server";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.chandler = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./common/base.nix
          ./hosts/chandler/default.nix
          ./hosts/chandler/hardware-configuration.nix
        ];
      };

      nixosConfigurations.joey = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./common/base.nix
          ./hosts/joey/default.nix
          ./hosts/joey/hardware-configuration.nix
        ];
      };
    };
}
