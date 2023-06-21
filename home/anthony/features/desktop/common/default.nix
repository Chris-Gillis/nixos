{ pkgs, ... }: {
  imports = [
    ./bottles.nix
    ./cursors.nix
    ./discord.nix
    ./firefox
    ./eww
    ./light.nix
    ./obsidian.nix
    ./pavucontrol.nix
    ./slack.nix
    ./spotify.nix
  ];

  xdg.mimeApps.enable = true;

  home.packages = with pkgs; [
    beekeeper-studio
  ];
}
