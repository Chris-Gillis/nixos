{ pkgs, ... }: 
let
  theme = import ../../../../theme;
in
{
  home.packages = [ pkgs.libnotify ];
  services.mako = {
    enable = true;
    sort="-time";
    layer="overlay";
    anchor = "top-center";
    defaultTimeout = 5000; # ms
    ignoreTimeout = true;

    # Formatting
    width = 500;
    height = 200;
    margin = "10";
    padding = "15";
    backgroundColor = "#${theme.colors.notifications.background}CC";
    textColor = "#${theme.colors.notifications.foreground}FF";
    maxIconSize = 128;

    # Border
    borderColor = null;
    borderRadius = 5;
    borderSize = 0;

    extraConfig = ''
      on-button-left=dismiss
      on-button-right=invoke-default-action

      [urgency=low]
      background-color=#${theme.colors.notifications.background}66
      default-timeout=1500

      [urgency=critical]
      border-color=#${theme.colors.error}FF
      border-size=2

      [category=mpd]
      default-timeout=2000
      group-by=category
    '';
  };
}
