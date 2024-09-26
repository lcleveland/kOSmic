{ config, lib, ... }:
let
  cfg = config.core.settings.nix.store;
in
{
  options.core.settings.nix.store = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable Nix store optimization";
    };
  };
  nix.settings.auto-optimise-store = cfg.enable;
}
