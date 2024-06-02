{ inputs, lib, pkgs, config, outputs, ... }: 
let
  overlays = {
    nur = inputs.nur.overlay;
    personal = import ../../../pkgs/overlay.nix;
  };
in
{
  imports = [
    ../features/cli
    ./modules/workstation.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
    overlays = builtins.attrValues overlays;
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
  };

  home = {
    username = lib.mkDefault "christopher";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = "23.11";
    sessionPath = [ "$HOME/.local/bin" ];
  };
}
