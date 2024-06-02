{ pkgs, ... }: {
  home.packages = [ pkgs.pavucontrol pkgs.pulseaudio ];
}
