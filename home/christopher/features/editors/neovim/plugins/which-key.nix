{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.which-key-nvim;
  type = "lua";
  config = ''
    local wk = require("which-key")
    wk.setup({})
  '';
}
