let
  wallpapers = import ./wallpapers;
in
{
  imports = [
    ./global
    ./global/workstation.nix

    ./features/desktop/common
    # ./features/desktop/hyprland

    ./features/games/lutris.nix
    ./features/games/bottles.nix
    ./features/games/steam.nix
    # ./features/3d-printing.nix
  ];

  isWorkstation = true;
  wallpaper = wallpapers.space-colonization;
  primaryNetworkInterface = "enp7s0";

  # hyprland = {
  #   general = ''
  #     layout=master
  #   '';
  #   bindings = ''
  #     bind=SUPER,t,layoutmsg,swapwithmaster auto
  #     bind=SUPERSHIFT,t,layoutmsg,focusmaster auto
  #     bind=SUPER,n,exec,$HOME/.config/hyprland-fzfify/new-workspace
  #     bind=SUPERSHIFT,n,exec,$HOME/.config/hyprland-fzfify/rename-workspace
  #     bind=SUPER,w,exec,$HOME/.config/hyprland-fzfify/move-to-workspace
  #     bind=SUPERSHIFT,w,exec,$HOME/.config/hyprland-fzfify/move-window-to-workspace
  #   '';
  #   startup = ''
  #     exec-once=pactl load-module module-combine-sink
  #   '';
  # };

  monitors = [
    {
      name = "DP-1";
      width = 5120;
      height = 1440;
      refreshRate = 120;
      noBar = false;
      x = 0;
    }
  ];
}
