# This file defines the kernel to use for the flake.
{ config, lib, pkgs, ... }:
let
  cfg = config.core.settings.kernel;
in
{
  options.core.settings.kernel = {
    pkg = lib.mkOption {
      type = lib.types.attrs;
      default = pkgs.linuxPackages_latest;
      description = lib.mdDoc "The kernel package to use";
    };
  };
  config = {
    boot.kernelPackages = cfg.pkg;
  };
}
