{ ... }: {
  imports = [
    ../features/editors/nvchad
    ../features/cli/zellij.nix
    ./modules/workstation.nix
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
