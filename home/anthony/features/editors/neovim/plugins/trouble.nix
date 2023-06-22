{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.trouble-nvim;
  type = "lua";
  config = ''
    require("trouble").setup()

    vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { noremap = true, silent = true })
  '';
}
