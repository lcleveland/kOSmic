# This file defines the system architecture for the flake.
{ config, lib, ... }:
let
  cfg = config.core.settings.nix;
in
{
  options.core.settings.nix = {
    system = lib.mkOption {
      type = lib.types.string;
      default = "x86_64-linux";
      description = lib.mdDoc "The system architecture for the flake";
    };
  };
  config = {
    lib.nixosSystem.system = cfg.system;
  };
}
