{ inputs, outputs, ... }: {
  imports = [
    inputs.nur.nixosModules.nur

    ./auto-upgrade.nix
    ./dev-tools.nix
    ./doas.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./zsh.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
