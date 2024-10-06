{ config, lib, ... }:
let
  cfg = config.core.settings.desktop_environment.cosmic.display_manager;
  cosmic = config.core.settings.desktop_environment.cosmic;
in
{
  options.core.settings.desktop_environment.cosmic.display_manager = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable display manager";
    };
  };
  config = lib.mkIf (cfg.enable && cosmic.enable) {
    services.displayManager.cosmic-greeter.enable = cfg.enable;
  };
}
