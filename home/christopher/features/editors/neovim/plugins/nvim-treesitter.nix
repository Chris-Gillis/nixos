{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
  type = "lua";
  config = ''
    require("nvim-treesitter.configs").setup({})
  '';
}
