{ config, lib, ... }:
let
  cfg = config.core.settings.nix;
in
{
  options.core.settings.nix = {
    state_version = lib.mkOption {
      type = lib.types.str;
      default = "unstable";
      description = lib.mdDoc "Nix state version";
    };
  };
  config = {
    system.stateVersion = cfg.state_version;
  };
}
