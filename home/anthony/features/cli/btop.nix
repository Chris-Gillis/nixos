{ pkgs, ... }: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "Default";
      theme_background = true;
      vim_keys = true;
    };
  };
}
