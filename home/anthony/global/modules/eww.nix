{ lib, ... }:
let inherit (lib) types mkOption mkEnableOption;
in
{
  options.eww = mkOption {
    type = types.submodule {
      options = {
        showBattery = mkEnableOption "Eww Battery Widget";
      };
    };
    default = {
      showBattery = false;
    };
  };
}
