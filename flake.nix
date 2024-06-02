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
    # rust-overlay = {
    #   url = "github:oxalica/rust-overlay";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # hyprland = {
    #   url = "github:hyprwm/hyprland";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # hyprwm-contrib.url = "github:hyprwm/contrib";
    # Hyprspace = {
    #   url = "github:KZDKM/Hyprspace";
    #   inputs.hyprland.follows = "hyprland";
    # };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    superfile.url = "github:yorukot/superfile";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs:
  let
    inherit (self) outputs;

    forEachSystem = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
    forEachPkgs = f: forEachSystem (sys: f nixpkgs.legacyPackages.${sys});

    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    unstable = import nixpkgs-unstable { inherit system; };

    overlays = {
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
      specialArgs = { inherit inputs outputs unstable nix-gaming; };
    };

    mkNixosImage = modules: nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = modules ++ [
        ({ pkgs, ... }: {
          nixpkgs.overlays = builtins.attrValues overlays;
        })
      ];
      specialArgs = { inherit inputs outputs unstable; };
    };
  in
  rec {
    nixosModules = import ./modules/nixos;

    packages = forEachPkgs (pkgs: (import ./pkgs { inherit pkgs; }));

    nixosConfigurations = {
      mercury = mkNixos [ ./hosts/mercury ];
    };

    devShells."${system}" = import ./shells { inherit pkgs; };
  };
}
