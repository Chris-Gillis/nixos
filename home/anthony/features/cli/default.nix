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
    exa
    ripgrep
    fd
    jq
  ];
}
