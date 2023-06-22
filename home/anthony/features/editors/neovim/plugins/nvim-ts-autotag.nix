{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.nvim-ts-autotag;
  type = "lua";
  config = ''
    require('nvim-treesitter.configs').setup {
      autotag = {
        enable = true,
      }
    }
  '';
}
