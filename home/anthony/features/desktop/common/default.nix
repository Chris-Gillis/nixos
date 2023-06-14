{ pkgs, ... }: {
  imports = [
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
}
