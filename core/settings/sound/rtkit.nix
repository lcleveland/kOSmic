{ config, lib, ... }:
let
  cfg = config.core.settings.sound.rtkit;
in
{
  options.core.settings.sound.rtkit = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable RTKit";
    };
  };
  config = lib.mkIf cfg.enable {
    security.rtkit.enable = cfg.enable;
  };
}
