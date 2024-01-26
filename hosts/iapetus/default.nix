{ pkgs, inputs, outputs, unstable, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./hardware-configuration.nix

    ../common/global
    ../common/users/anthony

    ../common/optional/docker.nix
  ];

  networking = {
    hostName = "iapetus";
    useDHCP = false;
    interfaces.enp7s0 = {
      useDHCP = false;
      ipv4.addresses = [{
        address = "10.37.15.1";
        prefixLength = 23;
      }];
    };
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = false;
        PasswordAuthentication = false;
      };
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs unstable; };
    users = {
      anthony = import ../../home/anthony/iapetus.nix;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}

