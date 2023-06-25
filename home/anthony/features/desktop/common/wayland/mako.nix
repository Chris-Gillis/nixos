{ pkgs, ... }: 
let
  theme = import ../../../../theme;
in
{
  home.packages = [ pkgs.libnotify ];
  services.mako = {
    enable = true;
    # actions = true;
    anchor = "top-center";
    # defaultTimeout = 15;

    # Formatting
    backgroundColor = "#${theme.colors.notifications.background}DF";
    textColor = "#${theme.colors.notifications.foreground}FF";
    margin = "10";

    # Border
    borderColor = null;
    borderRadius = 5;
    borderSize = 0;

    # extraConfig = ''
    #
    # '';
  };
}
