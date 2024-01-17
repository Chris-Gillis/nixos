final: prev:
rec {
  koulen = prev.callPackage ./koulen.nix { };
  phosphor-icons = prev.callPackage ./phosphor.nix { };
  breezex-icon-theme = prev.callPackage ./breeze-cursor-theme.nix { };
  nvchad = prev.callPackage ./nvchad { };

  dfipc = prev.libsForQt5.callPackage ./dfipc.nix { };
  dflogin1 = prev.libsForQt5.callPackage ./dflogin1.nix { };
  dfutils = prev.libsForQt5.callPackage ./dfutils.nix { };
  dfapplications = prev.libsForQt5.callPackage ./dfapplications.nix { inherit dfipc; };
  wayqt = prev.libsForQt5.callPackage ./wayqt.nix { };
  qtgreet = prev.libsForQt5.callPackage ./qtgreet.nix { inherit wayqt dfapplications dfutils dflogin1; };
}
