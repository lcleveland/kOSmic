{ config, lib, ... }:
let
  cfg = config.core.settings.network;
in
{
  options.core.settings.network = {
    hostname = lib.mkOption {
      type = lib.types.str;
      default = "nixos";
      description = lib.mdDoc "The name of the host.";
    };
  };
  config = {
    networking = {
      hostName = cfg.hostname;
    };
  };
}
