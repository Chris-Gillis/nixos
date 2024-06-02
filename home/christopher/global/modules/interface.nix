{ lib, ... }:
let inherit (lib) types mkOption;
in
{
  options.primaryNetworkInterface = mkOption {
    type = types.str;
    default = "";
    description = ''
      Primary network interface name
    '';
  };
}
