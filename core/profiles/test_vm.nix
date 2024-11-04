{ ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];
  options.users.lcleveland.enable = true;
}
