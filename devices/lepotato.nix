{ inputs, config, lib, pkgs, ... }: {
  imports = [
    "${inputs.nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64-installer.nix"
    ../hosts/common/global
    ../hosts/common/users/anthony
  ];
  sdImage = {
    compressImage = false;
    populateFirmwareCommands = "";
    postBuildCommands = ''
      dd if=${pkgs.ubootLibreTechCC}/u-boot.gxl.sd.bin of=$img conv=fsync,notrunc bs=512 seek=1 skip=1
    '';
  };
  nixpkgs = {
    config.allowUnfree = true;
    buildPlatform.system = "x86_64-linux";
    hostPlatform.system = "aarch64-linux";
  };
  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = lib.mkForce "no";
        PasswordAuthentication = false;
      };
    };
  };
  system.stateVersion = "23.05";
}
