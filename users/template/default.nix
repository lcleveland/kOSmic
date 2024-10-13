{ ... }:
let
  username = "template";
in
{
  imports = [
    ((import ./applications) {
      username = "${username}";
    })
    ((import ./settings) {
      username = "${username}";
    })
  ];
}
