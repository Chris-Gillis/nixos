{ pkgs, inputs, ... }: {
  home.packages = [
    inputs.superfile.packages.${pkgs.system}.default
  ];

  xdg.configFile."superfile" = {
    source = ./config;
    recursive = true;
  };
}
