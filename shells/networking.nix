{ pkgs, ... }:
let
  test = pkgs.writeShellApplication {
    name = "net-test";
    text = ''
      #! /usr/bin/env nix-shell
      #! nix-shell -i bash -p dig

      echo "Testing network..."
      nslookup google.com
    '';
  };
in
pkgs.mkShell {
  packages = with pkgs; [
    # network utils
    inetutils
    nmap
    dig

    # custom scripts
    test
  ];

  shellHook = ''
    echo Entering networking shell...
    echo
    echo Avaliable commands:
    echo "  - dig"
    echo "  - nslookup"
    echo "  - nmap"
    echo
  '';
}
