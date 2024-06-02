{ pkgs, config, lib, ... }:
{
  home = {
    packages = [ pkgs.eww ];
    sessionVariables = {
      EWW_NETWORK_INTERFACE = config.primaryNetworkInterface;
    };
  };


  xdg.configFile = {
    "eww/eww.scss".text = let
      theme = import ../../../../theme;
    in ''
      $color-foreground: #${theme.colors.bar.foreground};
      $color-background: #${theme.colors.bar.background};
      $color-launcher: #${theme.colors.bar.launcher};
      $color-workspace: #${theme.colors.bar.workspace};
      $color-datetime: #${theme.colors.bar.datetime};
      $color-network: #${theme.colors.bar.network};
      $color-sound: #${theme.colors.bar.sound};
      $color-battery: #${theme.colors.bar.battery};
      $color-power: #${theme.colors.bar.power};

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
      (defvar NETWORK_INTERFACE "${config.primaryNetworkInterface}")

      ${lib.strings.fileContents ./config/eww.yuck} 
    '';

    "eww/eww.sh" = {
      text = builtins.readFile ./config/eww.sh;
      executable = true;
    };
  };
}
