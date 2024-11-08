{ ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];
  users.lcleveland.enable = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
}
