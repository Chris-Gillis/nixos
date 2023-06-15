{ ... }: 
let
  theme = import ../../../../theme;
in
{
  services.mako = {
    enable = true;
    actions = true;
    anchor = "top-center";
    defaultTimeout = 15;

    # Formatting
    backgroundColor = theme.colors.notifications.background;
    textColor = theme.colors.notifications.foreground;
    margin = "10";

    # Border
    borderColor = null;
    borderRadius = 5;
    borderSize = 0;

    extraConfig = ''

    '';
  };
}
