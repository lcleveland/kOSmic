{ username }:
{ ... }:
{
  imports = [
    (import ./enable.nix { username = username; })
    (import ./name.nix { username = username; })
    (import ./state_version.nix { username = username; })
  ];
}
