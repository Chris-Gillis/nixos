let
  wallpapers = import ./wallpapers;
in
{
  imports = [
    ./global

    ./features/desktop/common
    # ./features/desktop/sway
    ./features/desktop/hyprland
    ./features/desktop/wireless
  ];

  wallpaper = wallpapers.planet-vector-art;
  primaryNetworkInterface = "wlp0s20f3";

  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1200;
      refreshRate = 60;
      noBar = false;
      x = 0;
    }
  ];
}
