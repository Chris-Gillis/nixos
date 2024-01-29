{ pkgs, inputs, outputs, unstable, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./hardware-configuration.nix

    ../common/global
    ../common/users/anthony

    ../common/optional/docker.nix
  ];

  networking = {
    hostName = "gaia";
    useDHCP = false;
    interfaces.enp7s0 = {
      useDHCP = true;
    };
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    pihole = {
      enable = true;
      version = "2023.05.2";
      dnsPort = 53;
      httpPort = 23792;
      inDns = "1.1.1.1";
      routerDomain = "utthome.local";
      customDnsEntries = [
        { ip = "10.37.14.1"; name = "opnsense.utthome.local"; }
        { ip = "10.37.15.1"; name = "gaia.utthome.local"; }
        { ip = "10.37.15.2"; name = "hashbrown.utthome.local"; }
        { ip = "10.37.15.3"; name = "spud.utthome.local"; }
      ];
      adlists = [
        "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
      ];
      whitelist = [
        "s.youtube.com"
        "video-stats.l.google.com"
        "www.googleapis.com"
        "youtubei.googleapis.com"
        "oauthaccountmanager.googleapis.com"
        "android.clients.google.com"
        "gstaticadssl.l.google.com"
        "googleapis.l.google.com"
        "clientconfig.passport.net"
        "v10.events.data.microsoft.com"
        "v20.events.data.microsoft.com"
        "appleid.apple.com"
        "gsp-ssl.ls.apple.com"
        "gsp-ssl.ls-apple.com.akadns.net"
        "spclient.wg.spotify.com"
        "apresolve.spotify.com"
        "api-tv.spotify.com"
      ];
    };

    nginx-proxy-manager.enable = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs unstable; };
    users = {
      anthony = import ../../home/anthony/gaia.nix;
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

