# This file defines the system architecture for the flake.
{ config, lib, ... }:
let
  cfg = config.core.settings.system;
in
{
  options.core.settings.system = {
    type = lib.types.string;
    default = "x86_64-linux";
    description = lib.mdDoc "The system architecture for the flake";
  };
  config = {
    nixpkgs.lib.nixosSystem.system = cfg;
  };
}
