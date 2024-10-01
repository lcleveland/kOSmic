{ config, lib, ... }:
let
  cfg = config.core.settings.time;
in
{
  options.core.settings.time = {
    timezone = lib.mkOption {
      type = lib.types.str;
      default = "America/Chicago";
      description = lib.mdDoc "Timezone to use for the OS.";
    };
  };
  config = {
    time.timeZone = cfg.timezone;
  };
}
