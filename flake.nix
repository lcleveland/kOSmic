{
  description = "A NixOS that is based on the Cosmic DE";

  outputs = inputs@{ home_manager, nixos_cosmic, nixpkgs, nixpkgs_stable, nixvim, self }:
    let
      base_modules = [
        {
          nix.settings = {
            substituters = [ "https://cosmic.cachix.org/" ];
            trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
          };
        }
        ./core
        home_manager.nixosModules.home-manager
        nixos_cosmic.nixosModules.default
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
      url = "github:lilyinstarlight/nixos-cosmic";
    };
    nixpkgs = {
      follows = "nixos-cosmic/nixpkgs";
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
