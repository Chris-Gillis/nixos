{ inputs, outputs, pkgs, config, lib, ... }: {
  imports = [
    ../common
    ../common/wayland
    inputs.hyprland.homeManagerModules.default
  ];

  programs.zsh.loginExtra = ''
    if [ "$(tty)" = "/dev/tty1" ]; then
      exec Hyprland &> /dev/null
    fi
  '';

  programs.zsh.profileExtra = ''
    if [ "$(tty)" = "/dev/tty1" ]; then
      exec Hyprland &> /dev/null
    fi
  '';

  home.packages = with pkgs; [
    inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    extraConfig = let
      theme = import ../../../theme;
    in
      (import ./config.nix {
        inherit (config) home wallpaper;
        theme = theme;
      }) +
      (import ./monitors.nix {
        inherit lib;
        inherit (config) monitors;
      });
  };
}
