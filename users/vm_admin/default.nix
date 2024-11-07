{ ... }:
let
  username = "vm_admin";
in
{
  imports = [
    (import ./applications { username = username; })
    (import ./settings { username = username; })
  ];
}
