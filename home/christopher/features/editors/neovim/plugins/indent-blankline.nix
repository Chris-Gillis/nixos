{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.indent-blankline-nvim;
  type = "lua";
  config = ''
    require("ibl").setup()
  '';
}
