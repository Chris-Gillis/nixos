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

      $font-1: MesloLGS Nerd Font;
      $font-2: Font Awesome 6 Free Regular;

      ${lib.strings.fileContents ./config/eww.scss}
    '';

    "eww/eww.yuck".text = ''
      ${lib.strings.fileContents ./config/eww.yuck} 
    '';

    "eww/eww.sh" = {
      text = builtins.readFile ./config/eww.sh;
      executable = true;
    };
  };
}
