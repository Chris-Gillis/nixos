{ pkgs, ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      hide_scroll = true;
      show = "drun";
      width = "25%";
      lines = 10;
      line_wrap = "word";
      term = "kitty";
      allow_markup = true;
      always_parse_args = true;
      show_all = true;
      print_command = true;
      layer = "overlay";
      allow_images = true;
      insensitive = true;
      prompt = "";
      image_size=15;
      display_generic = true;
      location = "center";
    };
    style = builtins.readFile ./style.css;
  };
}