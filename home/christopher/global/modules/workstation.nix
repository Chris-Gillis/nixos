{ lib, ... }:
let inherit (lib) types mkOption;
in
{
  options.isWorkstation = mkOption {
    type = types.bool;
    default = false;
    description = "Whether to install the workstation configuration";
  };
}
