{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    package = pkgs.vivaldi;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }  # uBlock Origin
      { id = "nngceckbapebfimnlniiiahkandclblb"; }  # Bitwarden
      { id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa"; }  # 1Password
      { id = "fmkadmapgofadopljbjfkapdkoienihi"; }  # React Dev Tools
    ];
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
    ];
  };

  # Proprietary codecs for Vivaldi
  home.packages = [
    pkgs.vivaldi-ffmpeg-codecs
  ];

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "vivaldi-stable.desktop" ];
    "text/xml" = [ "vivaldi-stable.desktop" ];
    "x-scheme-handler/http" = [ "vivaldi-stable.desktop" ];
    "x-scheme-handler/https" = [ "vivaldi-stable.desktop" ];
  };
}
