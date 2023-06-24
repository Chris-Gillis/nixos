{ pkgs, ... }: {
  imports = [
    ./bat.nix
    ./git.nix
    ./misc-tools.nix
    ./ssh.nix
    ./zellij.nix
    ./zsh
  ];

  home.packages = with pkgs; [
    btop
    exa
    ripgrep
    fd
    jq
  ];
}
