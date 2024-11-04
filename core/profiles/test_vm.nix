{ ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];
  users.lcleveland.enable = true;
}
