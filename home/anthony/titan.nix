let
  wallpapers = import ./wallpapers;
in
{
  imports = [
    ./global

    ./features/desktop/common
    ./features/desktop/hyprland
  ];

  wallpaper = wallpapers.space-colonization;
  primaryNetworkInterface = "enp7s0";

  monitors = [
    {
      name = "DP-2";
      width = 5120;
      height = 1440;
      refreshRate = 120;
      noBar = false;
      x = 0;
    }
  ];
}
