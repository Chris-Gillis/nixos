{ pkgs, lib }: {
  everforest = import ./everforest.nix { inherit pkgs lib; };
}
