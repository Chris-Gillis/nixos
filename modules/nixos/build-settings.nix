{ config, lib, pkgs, ... }:
let
  cfg = config.system.build-settings;

  inherit (lib) mkEnableOption mkOption mkIf literalExpression types;
in {
  options.system.build-settings = {
    enable = mkEnableOption {
      default = false;
      description = ''
        Enable the build settings for nixpkgs. This allows you to set the
        number of cores to use for building packages and the maximum number of
        jobs to run simultaneously.
      '';
    };
    cores = mkOption {
      type = types.int;
      default = 0;
      description = ''
        The number of cores to use for building packages. If set to 0, the
        number of cores is automatically detected.
      '';
    };
    max-jobs = mkOption {
      type = with types; either numbers.nonnegative "auto";
      default = "auto";
      description = ''
        The maximum number of jobs to run simultaneously. If set to 0, remote
        builders are preferred over local builds. If set to "auto", the number
        of jobs is automatically detected.
      '';
    };
    description = "Settings for nixpkgs build system";
  };

  config = mkIf cfg.enable {
    nix.settings = {
      cores = cfg.cores;
      max-jobs = cfg.max-jobs;
    };
  };
}
