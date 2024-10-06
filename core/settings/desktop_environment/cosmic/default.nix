{ config, lib, nixos_cosmic, nixpkgs, ... }:
let
  cfg = config.core.settings.desktop_environment.cosmic;
in
{
  imports = [
    ./display_manager.nix
  ];
  options.core.settings.desktop_environment.cosmic = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Cosmic";
    };
    substituters = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "https://cosmic.cachix.org" ];
      description = "Cachix Substituters";
    };
    trusted_public_keys = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
      description = "Cachix Trusted Public Keys";
    };
  };
  config = lib.mkIf cfg.enable {
    nix.settings = {
      substituters = cfg.substituters;
      trusted-public-keys = cfg.trusted_public_keys;
    };
    services.desktopManager.cosmic.enable = cfg.enable;
  };
}
