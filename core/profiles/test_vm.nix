{ ... }: {
  imports = [
    ./hardware_configurations/test_vm.nix
  ];
  options.users.lcleveland.enable = true;
}
