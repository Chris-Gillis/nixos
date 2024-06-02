{ pkgs, lib }: {
  everforest = import ./everforest.nix { inherit pkgs lib; };
  gruvbox = import ./gruvbox.nix { inherit pkgs lib; };
}
