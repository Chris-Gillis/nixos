{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.trouble-nvim;
  type = "lua";
  config = ''
    require("trouble").setup()

    local wk = require("which-key")
    wk.register({
      ["<leader>x"] = {
        x = { "<cmd>TroubleToggle<cr>", "Toggle Trouble diagnostics" },
        w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble workspace diagnostics" },
        d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble document diagnostics" },
      }
    })
  '';
}
