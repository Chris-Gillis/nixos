{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.comment-nvim;
  type = "lua";
  config = ''
    require('Comment').setup()

    local wk = require("which-key")
    wk.register({
      ["<leader>/"] = {
        function()
          require("Comment.api").toggle.linewise.current()
        end,
        "Toggle comment"
      }
    })
    wk.register({
      ["<leader>/"] = { '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', "Toggle comment" }
    }, { mode = "v" })
  '';
}
