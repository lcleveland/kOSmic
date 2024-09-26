# Enable CPU microcode updates
{ config, lib, ... }:
let
  cfg = config.core.settings.cpu.microcode;
  vendor = config.core.settings.cpu.vendor;
in
{
  options.core.settings.cpu.microcode = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable microcode.";
    };
  };
  config = lib.mkIf cfg.enable {
    hardware.cpu.${vendor}.updateMicrocode = cfg.enable;
  };
}
