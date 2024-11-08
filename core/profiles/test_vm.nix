{ ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];
  users.lcleveland.enable = true;
  core.settings.boot.systemd.enable = false;
  boot.loader.grub = {
    enable = true;
    device = "/dev/vda1";
  };
}
