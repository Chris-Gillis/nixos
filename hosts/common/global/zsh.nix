{ config, ... }:
let
  host = config.networking.hostName;
in
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      nrs = "doas nixos-rebuild switch --flake ~/source/nix#${host}";
      nrt = "doas nixos-rebuild test --flake ~/source/nix#${host}";
      ncg = "doas nixos-collect-garbage --delete-older-than 1d";
    };
  };
}
