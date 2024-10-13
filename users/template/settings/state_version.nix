{ username, ... }:
{ config, lib, ... }:
let
  cfg = config.users.${username};
in
{
  options.users.${username} = {
    state_version = lib.mkOption {
      type = lib.types.str;
      default = "24.05";
      description = "The state version for home manager for this user";
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager.users.${username} = {
      home = {
        stateVersion = "${cfg.state_version}";
        username = "${username}";
      };
    };

  };
}
