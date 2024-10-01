{ config, lib, ... }:
let
  cfg = config.core.settings.boot.systemd;
in
{
  options.core.settings.boot.systemd = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable systemd";
    };
  };
  config = lib.mkIf config.core.settings.boot.boot_loader.enable {
    boot.loader = lib.mkIf cfg.enable {
      systemd-boot.enable = cfg.enable;
    };
  };
}
