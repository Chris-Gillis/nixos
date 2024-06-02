{ pkgs, inputs, outputs, unstable, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./hardware-configuration.nix

    ../common/global
    ../common/users/christopher

    ../common/optional/workstation.nix
    ../common/optional/pipewire.nix
    ../common/optional/docker.nix
    ../common/optional/greetd.nix
    ../common/optional/flatpak.nix
    # ../common/optional/gamemode.nix
    ../common/optional/wayland.nix
  ];

  # system.build-settings = {
  #   enable = true;
  #   cores = 2;
  #   max-jobs = 4;
  # };

  networking = {
    hostName = "mercury";
    useDHCP = false;
    interfaces.enp7s0 = {
      useDHCP = true;
    };
    # firewall = {
    #   enable = true;
    #   allowedTCPPorts = [ 80 443 3000 3001 8000 8001 8080 ];
    # };
  };

  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = false;
  # };

  services = { };

  # Enable polkit for Sway/Wayland
  security.polkit.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs unstable; };
    users = {
      christopher = import ../../home/christopher/mercury.nix;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}

