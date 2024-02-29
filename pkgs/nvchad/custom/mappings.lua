local M = {}

M.copilotchat = {
  plugin = true,

  n = {
    ["<leader>cch"] = {
      function()
        require("CopilotChat.code_actions").show_help_actions({
          selection = require("CopilotChat.select").line,
        })
      end,
      "CopilotChat - Help actions",
    },
    ["<leader>ccp"] = {
      function()
        require("CopilotChat.code_actions").show_prompt_actions()
      end,
      "CopilotChat - Prompt actions",
    },
    ["<leader>cce"] = { "<cmd>CopilotChatExplain<cr>", "CopilotChat - Explain code" },
    ["<leader>cct"] = { "<cmd>CopilotChatTests<cr>", "CopilotChat - Generate tests" },
    ["<leader>ccr"] = { "<cmd>CopilotChatReview<cr>", "CopilotChat - Review code" },
    ["<leader>ccR"] = { "<cmd>CopilotChatRefactor<cr>", "CopilotChat - Refactor code" },
    ["<leader>ccn"] = { "<cmd>CopilotChatBetterNamings<cr>", "CopilotChat - Better naming" },
    ["<leader>cci"] = {
      function()
        local input = vim.fn.input("Ask Copilot: ")
        if input ~= "" then
          vim.cmd("CopilotChat " .. input)
        end
      end,
      "CopilotChat - Ask input",
    },
    ["<leader>ccm"] = { "<cmd>CopilotChatCommit<cr>", "CopilotChat - Generate commit message for all changes" },
    ["<leader>ccM"] = { "<cmd>CopilotChatCommitStaged<cr>", "CopilotChat - Generate commit message for staged changes" },
    ["<leader>ccq"] = {
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          vim.cmd("CopilotChatBuffer " .. input)
        end
      end,
      "CopilotChat - Quick chat",
    },
    ["<leader>ccd"] = { "<cmd>CopilotChatDebugInfo<cr>", "CopilotChat - Debug Info" },
    ["<leader>ccf"] = { "<cmd>CopilotChatFixDiagnostic<cr>", "CopilotChat - Debug Info" },
    ["<leader>ccl"] = { "<cmd>CopilotChatReset<cr>", "CopilotChat - Debug Info" },
    ["<leader>ccv"] = { "<cmd>CopilotChatToggle<cr>", "CopilotChat - Debug Info" },
  },
  x = {
    ["<leader>ccp"] = {
      function()
        require("CopilotChat.code_actions").show_prompt_actions({
          selection = require("CopilotChat.select").visual,
        })
      end,
      "CopilotChat - Prompt actions",
    },
    ["<leader>ccv"] = { ":CopilotChatVisual", "CopilotChat - Open in vertical split" },
    ["<leader>ccx"] = { ":CopilotChatInline<cr>", "CopilotChat - Inline chat" },
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

M.lspconfig = {
  plugin = true,

  n = {
    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "floating diagnostic",
    },
  },
}

return M
