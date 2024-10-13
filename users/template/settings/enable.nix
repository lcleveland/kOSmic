{ username, ... }:
{ lib, ... }:
{
  options.users.${username} = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable the user";
    };
  };
}
