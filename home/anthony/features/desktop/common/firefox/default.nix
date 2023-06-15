{ pkgs, inputs, ... }:
let
  addons = inputs.firefox-addons.packages.${pkgs.system};
  bookmarks = import ./bookmarks.nix;
in
{
  programs.firefox = {
    enable = true;
    profiles = {
      primary = {
        bookmarks = bookmarks;
        extensions = with addons; [
          ublock-origin
          bitwarden
          # onepassword-password-manager  # TODO: Fix this allowUnfree issue
          tree-style-tab
        ];
        search = {
          default = "DuckDuckGo";
          force = true;
        };
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
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
