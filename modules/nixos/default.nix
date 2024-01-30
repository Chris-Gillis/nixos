{
  qtgreet = import ./qtgreet.nix;

  # Services
  pihole = import ./services/pihole;
  nginx-proxy-manager = import ./services/nginx-proxy-manager.nix;
  vaultwarden = import ./services/vaultwarden;
}
