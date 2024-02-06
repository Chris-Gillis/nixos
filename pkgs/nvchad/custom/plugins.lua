local plugins = {
  {
    "zbirenbaum/copilot.lua",
    cmd = { "Copilot" },
    event = "InsertEnter",
    opts = function()
      return require "custom.configs.copilot"
    end,
    config = function(_, opts)
      require("copilot").setup(opts)
    end,
  },
  {
    "jellydn/CopilotChat.nvim",
    branch = "canary",
    cmd = {
      "CopilotChat",
      "CopilotChatExplain",
      "CopilotChatTests",
      "CopilotChatReview",
      "CopilotChatRefactor",
      "CopilotChatSummarize",
      "CopilotChatSpelling",
      "CopilotChatWording",
      "CopilotChatConcise",
      "CopilotChatVsplitVisual",
      "CopilotChatInPlace",
      "UpdateRemotePlugins",
    },
    event = "VeryLazy",
    opts = {
      mode = "split",
    },
    init = function()
      require("core.utils").load_mappings "copilotchat"
    end,
    build = function()
      vim.defer_fn(function()
        vim.cmd("UpdateRemotePlugins")
        vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
      end, 3000)
    end,
  },
  -- {
  --   "Exafunction/codeium.vim",
  --   config = function()
  --     vim.keymap.set('i', '<C-v>', function() return vim.fn['codeium#Accept']() end, { expr = true })
  --     vim.g.codeium_no_map_tab = true
  --     -- vim.g.codeium_enabled = false
  --   end,
  --   cmd = "Codeium",
  --   event = "VimEnter",
  -- },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "hrsh7th/nvim-cmp",
    config = function(_, opts)
      local cmp = require "cmp"
      opts.completion.completeopt = "menu,menuone,noinsert,noselect"
      opts.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }
      cmp.setup(opts)
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require "custom.configs.rust_tools"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      log_level = vim.log.levels.DEBUG,
      ensure_installed = {
        "bash-language-server",
        "css-lsp",
        "cssmodules-language-server",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "dot-language-server",
        "emmet-ls",
        "eslint-lsp",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "prettier",
        "rust-analyzer",
        "solargraph",
        "sqlls",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "cmake",
        "cpp",
        "css",
        "dockerfile",
        "dot",
        "hlsl",
        "html",
        "javascript",
        "jq",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "kdl",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "regex",
        "ruby",
        "rust",
        "scss",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "wgsl",
        "yaml",
        "yuck",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufRead", "BufNewFile" },
    cmd = { "TSContextEnable", "TSContextDisable", "TSContextToggle" },
    opts = {
      enable = true,
    },
    config = function(_, opts)
      require("treesitter-context").setup(opts)
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup()
    end,
  },
  {
    "kamykn/spelunker.vim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      vim.g.enable_spelunker_vim = 1
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function(_, opts)
      require('nvim-ts-autotag').setup(opts)
      vim.cmd "TSEnable autotag"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    init = function()
      require("core.utils").load_mappings "nvimtree"
      require("custom.configs.nvimtree").init()
    end,
    opts = function()
      return require "plugins.configs.nvimtree"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
      vim.g.nvimtree_side = opts.view.side
    end,
  },
  {
    "folke/flash.nvim",
    event = { "BufRead", "BufNewFile" },
    init = function()
      vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
        require("flash").jump({
          search = {
            mode = function(str)
              return "\\<" .. str
            end,
          },
        })
      end)
    end,
    opts = {
      search = {
        mode = function(str)
          return "\\<" .. str
        end,
      },
    },
    config = function(_, opts)
      require("flash").setup(opts)
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "InsertEnter" },
    opts = function()
      return require "custom.configs.gitsigns"
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
  {
    "folke/trouble.nvim",
    event = { "BufRead", "BufNewFile" },
    init = function()
      require("core.utils").load_mappings "trouble"
    end,
    config = function()
      require("trouble").setup()
    end,
  },
}

return plugins
