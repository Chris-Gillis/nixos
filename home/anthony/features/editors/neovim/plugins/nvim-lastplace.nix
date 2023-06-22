{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.nvim-lastplace;
  type = "lua";
  config = ''
    require("nvim-lastplace").setup()
  '';
}
