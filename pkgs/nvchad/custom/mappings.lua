local M = {}

M.copilotchat = {
  plugin = true,

  n = {
    ["<leader>cce"] = { "<cmd>CopilotChatExplain<cr>", "CopilotChat - Explain code" },
    ["<leader>cct"] = { "<cmd>CopilotChatTests<cr>", "CopilotChat - Generate tests" },
    ["<leader>ccr"] = { "<cmd>CopilotChatReview<cr>", "CopilotChat - Review code" },
    ["<leader>ccR"] = { "<cmd>CopilotChatRefactor<cr>", "CopilotChat - Refactor code" },
    ["<leader>ccs"] = { "<cmd>CopilotChatSummarize<cr>", "CopilotChat - Summarize text" },
    ["<leader>ccS"] = { "<cmd>CopilotChatSpelling<cr>", "CopilotChat - Correct spelling" },
    ["<leader>ccw"] = { "<cmd>CopilotChatWording<cr>", "CopilotChat - Improve wording" },
    ["<leader>ccc"] = { "<cmd>CopilotChatConcise<cr>", "CopilotChat - Make text concise" },
  },
}

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
  },
}

return M
