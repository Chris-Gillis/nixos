{ pkgs, ... }: {
  networking = import ./networking.nix { inherit pkgs; };
}
