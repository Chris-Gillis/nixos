{
  qtgreet = import ./qtgreet.nix;
  build-settings = import ./build-settings.nix;

  # Services
  pihole = import ./services/pihole;
  nginx-proxy-manager = import ./services/nginx-proxy-manager.nix;
  vaultwarden = import ./services/vaultwarden;
}
