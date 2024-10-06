{ config, lib, ... }:
let
  cfg = config.core.settings.display_manager;
in
{
  options.core.settings.cosmic.display_manager = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable display manager";
    };
  };
  config = lib.mkIf cfg.enable && config.core.settings.cosmic.enable {
    services.displayManager.cosmic-greeter.enable = cfg.enable;
  };
}
