{ config, lib, ... }:
let
  cfg = config.core.settings.language;
in
{
  options.core.settings.language = {
    locale = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
      description = "Locale";
    };
  };
  config = {
    i18n = {
      defaultLocale = cfg.locale;
      extraLocaleSettings = {
        LC_ADDRESS = cfg.locale;
        LC_IDENTIFICATION = cfg.locale;
        LC_MEASUREMENT = cfg.locale;
        LC_MONETARY = cfg.locale;
        LC_NAME = cfg.locale;
        LC_NUMERIC = cfg.locale;
        LC_PAPER = cfg.locale;
        LC_TELEPHONE = cfg.locale;
        LC_TIME = cfg.locale;
      };
    };
  };
}
