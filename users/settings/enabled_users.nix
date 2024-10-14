{ config, lib, ... }:
let
  cfg = config.users.settings;
in
{
  options.users.settings = {
    enabled_users = {
      type = lib.types.listOf lib.types.str;
      default = [ "template" ];
      description = "List of enabled users";
    };
  };
  config = {
    enable_map = map (user: { config.users.${user}.enable = true; }) cfg.enabled_users;
  };
}
