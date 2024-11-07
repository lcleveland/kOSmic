{ username, ... }:
{ config, lib, ... }:
let
  cfg = config.users.${username};
in
{
  options.users.${username} = {
    initial_password = lib.mkOption {
      type = lib.types.str;
      default = "Password123";
      description = "The initial password of the user";
    };
  };
  config = lib.mkIf cfg.enable {
    users.users.${username}.initialPassword = cfg.initial_password;
  };
}
