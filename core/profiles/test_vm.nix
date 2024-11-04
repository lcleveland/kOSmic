{ ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];
  config = {
    options.users.lcleveland.enable = true;
  };
}
