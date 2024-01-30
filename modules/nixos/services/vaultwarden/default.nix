{ config, lib, ...}:
let
  cfg = config.services.bitwarden;
in 
{
  options = {
    services.bitwarden = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable bitwarden";
      };

      image = lib.mkOption {
        type = lib.types.str;
        default = "vaultwarden/server";
        description = "Bitwarden image";
      };

      version = lib.mkOption {
        type = lib.types.str;
        default = "1.30.1";
        description = "Bitwarden image version";
      };

      port = lib.mkOption {
        type = lib.types.int;
        default = 80;
        description = "Bitwarden port";
      };

      websocketPort = lib.mkOption {
        type = lib.types.int;
        default = 3012;
        description = "Bitwarden websocket port";
      };

      domain = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.oci-containers.backend = lib.mkForce "docker";
    
    virtualisation.oci-containers.containers.vaultwarden = {
      image = "${cfg.image}:${toString cfg.version}";
      ports = [
        "${toString cfg.port}:80/tcp"
        "${toString cfg.websocketPort}:3012/tcp"
      ];
      volumes = [
        "/data/vaultwarden/data:/data"
      ];
      environment = {
        ADMIN_TOKEN = lib.removeSuffix "\n" (builtins.readFile ./admin-token.gc.key);
        DOMAIN = cfg.domain;
      };
    };

    systemd.tmpfiles.rules = [
      "d /data/vaultwarden/data 0755 vaultwarden vaultwarden -"
    ];

    networking.firewall.allowedTCPPorts = [ cfg.port cfg.websocketPort ];
  };
}
