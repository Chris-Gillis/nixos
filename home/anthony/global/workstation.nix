{ ... }: {
  imports = [
    ../features/editors/nvchad
    ../features/cli/zellij.nix
    ./modules/eww.nix
    ./modules/hyprland.nix
    ./modules/interface.nix
    ./modules/monitors.nix
    ./modules/wallpaper.nix
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
