{
  description = "A NixOS that is based on the Cosmic DE";

  outputs = inputs@{ home_manager, nixpkgs, nixpkgs_stable, nixvim, self }:
    let
      base_modules = [
        ./core
        home_manager.nixosModules.home-manager
      ];
      make_unstable_system = profile: hardware_configuration:
        nixpkgs.lib.nixosSystem {
          modules = base_modules ++ profile ++ hardware_configuration;
          specialArgs = {
            inherit inputs;
          };
        };
    in
    {
      nixosConfigurations = {
        home = make_unstable_system [ ./profiles/home.nix ] [ ./hardware_configurations/dream/hardware-configuration.nix ];
      };
    };
  inputs = {
    home_manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    nixos_cosmic = {
      inputs.nixpkgs.follows = "nixos-cosmic/nixpkgs";
      url = "github:lilyinstarlight/nixos-cosmic";
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
