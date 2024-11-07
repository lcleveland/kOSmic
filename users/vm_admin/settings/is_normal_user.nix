{ username, ... }:
{ config, lib, ... }:
let
  cfg = config.users.${username};
in
{
  options.users.${username} = {
    is_normal_user = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Is the user a normal user?";
    };
  };
  config = lib.mkIf cfg.enable {
    users.users.${username}.isNormalUser = cfg.is_normal_user;
  };
}
