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
                    keybinds = mkOption {
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
  };
}
