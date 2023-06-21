{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.codeium-vim;
  type = "lua";
  config = ''
    vim.keymap.set('i', '<C-v>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    vim.g.codeium_no_map_tab = true
  '';
}
