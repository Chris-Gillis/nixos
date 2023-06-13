{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    hardware.url = "github:nixos/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    kmonad = {
      url = "github:kmonad/kmonad?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/hyprland";
    hyprwm-contrib.url = "github:hyprwm/contrib";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, rust-overlay, ... }@inputs:
  let
    inherit (self) outputs;

    forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

    system = "x86_64-linux";
    unstable = import nixpkgs-unstable { inherit system; };

    overlays = {
      rust-overlay = rust-overlay.overlays.default;
      nur = inputs.nur.overlay;
      personal = import pkgs/overlay.nix;
    };

    mkNixos = modules: nixpkgs.lib.nixosSystem {
      inherit system;

      modules = modules ++ [
        ({ pkgs, ... }: {
          nixpkgs.overlays = builtins.attrValues overlays;
        })
      ];
      specialArgs = { inherit inputs outputs unstable; };
    };
  in
  {
    nixosModules = import ./modules/nixos;

    packages = forEachPkgs (pkgs: (import ./pkgs { inherit pkgs; }));

    nixosConfigurations = {
      tethys = mkNixos [ ./hosts/tethys ];
    };
  };
}
