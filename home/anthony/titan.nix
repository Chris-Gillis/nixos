let
  wallpapers = import ./wallpapers;
in
{
  imports = [
    ./global

    ./features/desktop/common
    ./features/desktop/hyprland
    ./features/games/lutris.nix
  ];

  wallpaper = wallpapers.space-colonization;
  primaryNetworkInterface = "enp7s0";

  hyprland = {
    general = ''
      layout=master
    '';
    bindings = ''
      bind=SUPER,t,layoutmsg,swapwithmaster auto
      bind=SUPERSHIFT,t,layoutmsg,focusmaster auto
    '';
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
