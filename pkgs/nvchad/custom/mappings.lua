local M = {}

M.nvimtree = {
  plugin = true,
  
  n = {
    -- toggle
    ["<C-b>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    ["<C-e>"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

M.trouble = {
  plugin = true,

  n = {
    ["<leader>xx"] = { "<cmd>TroubleToggle<cr>", "Open Trouble for diagnostics", opts = { silent = true, noremap = true } },
    ["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Open Trouble for workspace diagnostics", opts = { silent = true, noremap = true } },
    ["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Open Trouble for file diagnostics", opts = { silent = true, noremap = true } },
  }
}

return M
