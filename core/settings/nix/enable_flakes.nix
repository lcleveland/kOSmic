#   This file defines the settings for allowing 'flakes' in the OS.
{ config, lib, ... }:
let
  cfg = config.core.settings.nix.enable_flakes;
in
{
  options.core.settings.nix.enable_flakes = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable 'flakes' in the OS.";
    };
  };
  config = lib.mkIf cfg.enable {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
