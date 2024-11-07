{ username, ... }:
{ ... }:
{
  imports = [
    (import ./email.nix { username = username; })
    (import ./enable.nix { username = username; })
    (import ./groups.nix { username = username; })
    (import ./initial_password.nix { username = username; })
    (import ./is_normal_user.nix { username = username; })
    (import ./name.nix { username = username; })
    (import ./state_version.nix { username = username; })
    (import ./username.nix { username = username; })
  ];
}
