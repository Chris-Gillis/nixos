{ lib, ... }:
let inherit (lib) types mkOption;
in
{
  options.host-specific = mkOption {
    type = types.submodule {
      options = {
        hyprland = mkOption {
          type = types.submodule {
            options = {
              ext = mkOption {
                type = types.submodule {
                  options = {
                    general = mkOption {
                      type = types.lines;
                    };
                    bindings = mkOption {
                      type = types.lines;
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
    default = {
      hyprland = {
        ext = {
          general = ''
            layout=dwindle
          '';
          bindings = "";
        };
      };
    };
  };
}
