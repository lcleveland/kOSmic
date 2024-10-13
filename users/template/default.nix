{ config, lib, ... }:
let
  cfg = config.users.${username};
  username = "template";
in
{
  imports = [
    ./applications
    ./settings
  ];
  options.users.${username} = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the user";
    };
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
