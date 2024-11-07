{ username, ... }:
{ lib, ... }:
{
  options.users.${username} = {
    email = lib.mkOption {
      type = lib.types.str;
      default = "template@template.com";
      description = "The email for the user";
    };
  };
}
