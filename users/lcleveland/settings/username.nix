{ username, ... }:
{ config, lib, ... }:
let
  cfg = config.users.${username};
in
{
  options.users.${username} = {
    username = lib.mkOption {
      type = lib.types.str;
      default = "${username}";
      description = "Username of the user.";
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager.users.${username}.home.username = cfg.username;
  };
}
