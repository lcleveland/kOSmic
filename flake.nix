{
  description = "A NixOS that is based on the Cosmic DE";

  outputs = inputs@{ config, home_manager, nixpkgs, nixpkgs_stable, nixvim, self }:
    let
      base_modules = [
        ./core
        home_manager.nixosModules.home-manager
      ];
      make_unstable_system = profile: extra_modules:
        nixpkgs.lib.nixosSystem {
          system = config.core.settings.nix.system;
          modules = base_modules ++ extra_modules;
        };
      make_stable_system = profile: extra_modules:
        nixpkgs_stable.lib.nixosSystem {
          system = config.core.settings.nix.system;
          modules = base_modules ++ extra_modules;
        };
    in
    {
      nixosConfigurations = {
        home = make_unstable_system;
      };
    };
  inputs = {
    home_manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    nixpkgs_stable = {
      url = "github:nixos/nixpkgs?ref=nixos-24.05";
    };
    nixvim = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nixvim";
    };
  };
}
