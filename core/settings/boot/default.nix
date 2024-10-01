{ ... }: {
  imports = [
    ./boot_loader.nix
    ./efi.nix
    ./systemd.nix
  ];
}
