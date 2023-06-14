{ pkgs, ... }: {
  programs.qtgreet = {
    package = pkgs.qtgreet;
    enable = true;
    settings = {
      General = {
        Backend = "GreetD";
        Theme = "default";
        BlurBackground = "true";
      };
      Overrides = {
        Background = "Theme";
        BaseColor = "Theme";
        TextColor = "Theme";
      };
    };
  };
}
