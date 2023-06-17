{ pkgs, ... }: {
  home.packages = with pkgs; [
    (lutris.override {
      extraLibraries = pkgs: [
        libunwind
      ];
      extraPkgs = pkgs: [
        
      ];
    })
  ];
}
