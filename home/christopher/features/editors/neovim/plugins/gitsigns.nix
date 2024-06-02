{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.gitsigns-nvim;
  type = "lua";
  config = ''
    require('gitsigns').setup({
      signs = {
        add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
        change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
        delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
        topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
        changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
        untracked = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      },
      on_attach = function(bufnr)
        gs = package.loaded.gitsigns
        local wk = require("which-key")
        wk.register({
          ['<leader>gb'] = {
            function()
              gs.blame_line({ full = true })
            end,
            "git blame line"
          }
	}, { buffer = bufnr, silent = true })
      end,
    })
  '';
}
