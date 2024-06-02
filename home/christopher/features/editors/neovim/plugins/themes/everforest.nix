{ pkgs, lib }:
{
  plugin = pkgs.vimPlugins.everforest;
  type = "lua";
  config = ''
    if vim.fn.has('termguicolors') == 1 then
      vim.opt.termguicolors = true
    end
    
    vim.opt.background = 'light'

    vim.g.everforest_background = 'hard'

    vim.cmd [[
      syntax enable
      colorscheme everforest
    ]]
  '';
}
