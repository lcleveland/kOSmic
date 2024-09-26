{ ... }: {
  imports = [
    ./allow_unfree.nix
    ./enable_flakes.nix
    ./garbage_collection.nix
    ./state_version.nix
    ./store.nix
    ./system.nix
  ];
}
