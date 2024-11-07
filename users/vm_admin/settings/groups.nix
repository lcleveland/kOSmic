{ username, ... }:
{ config, lib, ... }:
let
  cfg = config.users.${username};
in
{
  options.users.${username} = {
    groups = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ "wheel" "networkmanager" ];
      description = "The name of the user";
    };
  };
  config = lib.mkIf cfg.enable {
    users.users.${username}.extraGroups = cfg.groups;
  };
}
