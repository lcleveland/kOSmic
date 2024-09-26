# The CPU vendor
{ lib, ... }:
{
  options.core.settings.cpu = {
    vendor = lib.mkOption {
      type = lib.types.enum [
        "amd"
        "intel"
      ];
      default = "amd";
      description = lib.mdDoc "The CPU vendor.";
    };
  };
}
