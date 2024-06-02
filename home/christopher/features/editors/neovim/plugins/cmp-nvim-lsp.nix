{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.cmp-nvim-lsp;
  type = "lua";
}
