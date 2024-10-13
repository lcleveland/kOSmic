{ ... }:
let
  username = "template";
in
{
  imports = [
    ./applications
    (import ./settings { username = username; })
  ];
}
