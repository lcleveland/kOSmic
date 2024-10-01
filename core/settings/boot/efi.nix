{ config, lib, ... }:
let
  cfg = config.core.settings.boot.efi;
in
{
  options.core.settings.boot.efi = {
    can_touch_efi_variables = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Allow touch of EFI variables";
    };
  };
  config = lib.mkIf config.core.settings.boot.boot_loader.enable {
    boot.loader = lib.mkIf cfg.can_touch_efi_variables {
      efi.canTouchEfiVariables = cfg.can_touch_efi_variables;
    };
  };
}
