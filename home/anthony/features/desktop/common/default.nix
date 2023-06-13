{ pkgs, ... }: {
  imports = [
    ./discord.nix
    ./firefox
    ./eww
    ./light.nix
    ./pavucontrol.nix
    ./slack.nix
  ];

  xdg.mimeApps.enable = true;
}
