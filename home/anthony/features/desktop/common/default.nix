{ pkgs, ... }: {
  imports = [
    ./chromium.nix
    ./cursors.nix
    ./discord.nix
    ./firefox
    ./eww
    ./light.nix
    ./obsidian.nix
    ./pavucontrol.nix
    ./slack.nix
    ./spotify.nix
    ./vivaldi
  ];

  xdg.mimeApps.enable = true;

  home.packages = with pkgs; [
    beekeeper-studio
    postman
    remmina
    playerctl
    gimp
    # figma-linux
    libsForQt5.dolphin
  ];
}
