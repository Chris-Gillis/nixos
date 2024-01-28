{ pkgs, ... }: {
  imports = [
    ./bat.nix
    ./git.nix
    ./misc-tools.nix
    ./ssh.nix
    ./zsh
  ];

  home.packages = with pkgs; [
    btop
    eza
    ripgrep
    fd
    jq
    yarn
  ];
}
