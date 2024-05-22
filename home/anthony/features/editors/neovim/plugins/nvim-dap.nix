{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.nvim-dap;
  type = "lua";
}
