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

  host-specific = {
    hyprland.ext = {
      general = ''
        layout=master
      '';
      keybinds = ''
        bind=SUPERSHIFT,t,layoutmsg,swapwithmaster auto
        bind=SUPER,t,layoutmsg,focusmaster auto
      '';
    };
  };

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
