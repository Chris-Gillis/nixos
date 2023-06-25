{ pkgs, config, lib, ... }:
{
  home = {
    packages = [ pkgs.eww-wayland ];
    sessionVariables = {
      EWW_NETWORK_INTERFACE = config.primaryNetworkInterface;
    };
  };


  xdg.configFile = {
    "eww/eww.scss".text = let
      theme = import ../../../../theme;
    in ''
      $color-foreground: #${theme.colors.foreground};
      $color-background: #${theme.colors.background};
      $color-black: #${theme.colors.black};
      $color-red: #${theme.colors.red};
      $color-green: #${theme.colors.green};
      $color-yellow: #${theme.colors.yellow};
      $color-blue: #${theme.colors.cyan-alt};
      $color-magenta: #${theme.colors.magenta};
      $color-cyan: #${theme.colors.cyan};
      $color-white: #${theme.colors.white};

      $color-warning: #${theme.colors.warning};
      $color-critical: #${theme.colors.error};

      $font-0: Koulen;
      $font-1: Iosevka Nerd Font Mono, MesloLGS Nerd Font Mono;
      $font-2: Font Awesome 6 Free Regular;

      $border-radius: 8px;

      ${lib.strings.fileContents ./config/eww.scss}
    '';

    "eww/eww.yuck".text = ''
      (defvar SHOW_BATTERY ${lib.trivial.boolToString config.eww.showBattery})

      ${lib.strings.fileContents ./config/eww.yuck} 
    '';

    "eww/eww.sh" = {
      text = builtins.readFile ./config/eww.sh;
      executable = true;
    };
  };
}
