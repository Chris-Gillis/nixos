{ pkgs, ... }: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./git.nix
    ./misc-tools.nix
    ./ssh.nix
    ./zsh
  ];

  home.packages = with pkgs; [
    eza
    ripgrep
    fd
    jq
    yarn
  ];
}
