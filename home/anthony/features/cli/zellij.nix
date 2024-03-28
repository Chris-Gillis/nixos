{ pkgs, ... }: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "gruvbox-dark";
      themes = {
        everforest-light = {
          bg = "#fff9e8";
          fg = "#3c474d";
          black = "#3c474d";
          red = "#f85552";
          green = "#8da101";
          yellow = "#dfa000";
          blue = "#3a94c5";
          magenta = "#df69ba";
          cyan = "#35a77c";
          white = "#dfddc8";
          orange = "#FF9E64";
        };
      };
    };
  };
}
