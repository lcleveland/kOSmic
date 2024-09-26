# This file defines the settings for allowing 'unfree' features in the OS.
{ config, lib, ... }:
let
  cfg = config.core.settings.allow_unfree;
in
{
  options.core.settings.allow_unfree = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable 'unfree' features in the OS.";
    };
  };
  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = cfg.enable;
  };
}
