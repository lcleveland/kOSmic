{ ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];
  users.vm_admin.enable = true;
}
