{ pkgs, ... }: {
  home.packages = [ pkgs.fzf ];
  xdg.configFile."hyprland-fzfify" = {
    source = ./fzfify_scripts;
  };
}
