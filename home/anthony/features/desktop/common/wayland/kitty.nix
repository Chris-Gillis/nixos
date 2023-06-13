{ pkgs, config, ... }:
let
  kitty-xterm = pkgs.writeShellScriptBin "xterm" ''
    ${config.programs.kitty.package}/bin/kitty -1 "$@"
  '';
in
{
  home = {
    packages = [ kitty-xterm ];
    sessionVariables = {
      TERMINAL = "kitty -1";
    };
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 11;
    };
    settings = {
      scrollback_lines = 4000;
      enable_audio_bell = false;
    };
    extraConfig = ''
      # Everforest Light Theme
      background            #fff9e8
      foreground            #5c6a72
      cursor                #d8caac
      selection_foreground  #d8caac
      selection_background  #505a60
      color0                #3c474d
      color8                #868d80
      color1                #e68183
      color9                #e68183
      color2                #a7c080
      color10               #a7c080
      color3                #d9bb80
      color11               #d9bb80
      color4                #83b6af
      color12               #83b6af
      color5                #d39bb6
      color13               #d39bb6
      color6                #87c095
      color14               #87c095
      color7                #868d80
      color15               #868d80
    '';
  };
}
