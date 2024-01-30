{ config, lib, pkgs, ... }:
let
  cfg = config.services.nginx-proxy-manager;
in 
{
  options = {
    services.nginx-proxy-manager = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };

      image = lib.mkOption {
        type = lib.types.str;
        default = "jc21/nginx-proxy-manager";
      };

      version = lib.mkOption {
        type = lib.types.singleLineStr;
        default = "2.11.1";
      };

      adminPort = lib.mkOption {
        type = lib.types.port;
        default = 81;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.oci-containers.backend = lib.mkForce "docker";
    
    virtualisation.oci-containers.containers.nginx-proxy-manager = {
      image = "${cfg.image}:${cfg.version}";
      ports = [
        "${toString cfg.adminPort}:81"
        "80:80"
        "443:443"
      ];
      volumes = [
        "/data/nginx-proxy-manager/data:/data"
        "/data/nginx-proxy-manager/letsencrypt:/etc/letsencrypt"
      ];
    };

    systemd.tmpfiles.rules = [
      "d /data/nginx-proxy-manager/data 0755 nginx nginx -"
      "d /data/nginx-proxy-manager/letsencrypt 0755 nginx nginx -"
    ];

    networking.firewall.allowedTCPPorts = [ cfg.adminPort 80 443 ];
  };
}
