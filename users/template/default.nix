{ ... }:
let
  username = "template";
in
{
  imports = [
    ((import ./applicatons) {
      username = "${username}";
    })
    ((import ./settings) {
      username = "${username}";
    })
  ];
}
