{ ... }:
let
  username = "template";
in
{
  imports = [
    ./applications
    ./settings
  ];
}
