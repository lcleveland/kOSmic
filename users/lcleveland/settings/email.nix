{ username, ... }:
{ lib, ... }:
{
  options.users.${username} = {
    email = lib.mkOption {
      type = lib.types.str;
      default = "lyle.cleveland@proton.me";
      description = "The email for the user";
    };
  };
}
