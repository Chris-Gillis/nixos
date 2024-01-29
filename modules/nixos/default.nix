{
  qtgreet = import ./qtgreet.nix;
  pihole = import ./services/pihole.nix;
  nginx-proxy-manager = import ./services/nginx-proxy-manager.nix;
}
