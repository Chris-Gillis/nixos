{ pkgs, inputs, ... }:
let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  programs.firefox = {
    enable = true;
    profiles = {
      primary = {
        bookmarks = [];
        extensions = with addons; [
          ublock-origin
        ];
        search = {
          default = "DuckDuckGo";
          force = true;
        };
        settings = { };
        userChrome = builtins.readFile ./userChrome.css;
      };
    };
  };

  home = {
    sessionVariables.BROWSER = "firefox";
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}
