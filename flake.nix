{
  description = "A NixOS that is based on the Cosmic DE";

  outputs = inputs@{ home_manager, nixos_cosmic, nixpkgs, nixpkgs_stable, nixvim, self }:
    let
      base_modules = [
        ./core
        home_manager.nixosModules.home-manager
        nixos_cosmic.nixosModules.default
      ];
      make_unstable_system = profile:
        nixpkgs.lib.nixosSystem {
          modules = base_modules ++ profile;
          specialArgs = {
            inherit inputs;
          };
        };
    in
    {
      nixosConfigurations = {
        home = make_unstable_system [ ./core/profiles/home.nix ];
      };
    };
  inputs = {
    home_manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    nixos_cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
    };
    nixpkgs = {
      follows = "nixos_cosmic/nixpkgs";
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    nixpkgs_stable = {
      follows = "nixos_cosmic/nixpkgs-stable";
      url = "github:nixos/nixpkgs?ref=nixos-24.05";
    };
    nixvim = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nixvim";
    };
  };
}
