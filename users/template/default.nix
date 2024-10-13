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
  };
  config.users.${username} = lib.mkIf cfg.enable { };
}
