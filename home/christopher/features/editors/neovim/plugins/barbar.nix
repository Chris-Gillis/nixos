{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.barbar-nvim;
  type = "lua";
  config = ''
    require('barbar').setup()

    vim.keymap.set('n', '<Tab>', '<cmd>BufferNext<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<S-Tab>', '<cmd>BufferPrevious<CR>', { noremap = true, silent = true })
  '';
}
