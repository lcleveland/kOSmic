{ config, lib, ... }:
let
  cfg = config.core.settings.network.network_manager;
in
{
  options.core.settings.network.network_manager = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable NetworkManager";
    };
  };
  config = lib.mkIf cfg.enable {
    networking.networkmanager.enable = cfg.enable;
  };
}
