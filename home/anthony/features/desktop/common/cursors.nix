{ pkgs, ... }: {
  home.file.".icons/default/index.theme".text = ''
    [icon theme]
    Inherits=BreezeX-Dark
  '';

  home.pointerCursor = {
    size = 24;
    name = "BreezeX-Dark";
    package = pkgs.breezex-icon-theme;
    gtk.enable = true;
    x11.enable = true;
  };
}
