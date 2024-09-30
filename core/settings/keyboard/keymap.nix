{ config, lib, ... }:
let
  cfg = config.core.settings.keyboard.keymap;
in
{
  options.core.settings.keyboard.keymap = {
    layout = lib.mkOption {
      type = lib.types.str;
      default = "us";
      description = "The keyboard layout to use";
    };
    variant = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "The keyboard variant to use";
    };
  };
  config = {
    services.xserver.xkb = {
      layout = cfg.layout;
      variant = cfg.variant;
    };
  };
}
