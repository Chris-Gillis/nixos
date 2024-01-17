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

return M
