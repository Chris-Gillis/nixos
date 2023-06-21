{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
}
