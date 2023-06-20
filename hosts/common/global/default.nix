{ inputs, outputs, ... }: {
  imports = [
    inputs.nur.nixosModules.nur
    inputs.sops-nix.nixosModules.sops

    # ./auto-upgrade.nix
    ./cursors.nix
    ./dev-tools.nix
    ./doas.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./zsh.nix

    ./work-setup.nix
  ] ++ (builtins.attrValues outputs.nixosModules);

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
