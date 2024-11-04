{ ... }:
let
  username = "lcleveland";
in
{
  imports = [
    (import ./applications { username = username; })
    (import ./settings { username = username; })
  ];
}
