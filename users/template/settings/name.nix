{ username, ... }:
{ config, lib, ... }:
let
  cfg = config.users.${username};
in
{
  options.users.${username} = {
    name = lib.mkOption {
      type = lib.types.str;
      default = "Template User";
      description = "The name of the user";
    };
  };
  config = lib.mkIf cfg.enable {
    users.users.${username}.description = cfg.name;
  };
}
