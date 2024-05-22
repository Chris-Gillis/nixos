{ pkgs, lib }:
{
  plugin = pkgs.vimPlugins.gruvbox-nvim;
  type = "lua";
  config = ''
    if vim.fn.has('termguicolors') == 1 then
      vim.opt.termguicolors = true
    end
    
    vim.opt.background = 'dark'

    vim.cmd [[
      syntax enable
      colorscheme gruvbox
    ]]
  '';
}
