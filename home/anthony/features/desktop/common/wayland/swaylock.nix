{ config, pkgs, ... }: {
  home.packages = [ pkgs.swaylock-effects ];
  programs.swaylock = {
    settings = {
      effect-blur = "20x3";
    };
  };
}
