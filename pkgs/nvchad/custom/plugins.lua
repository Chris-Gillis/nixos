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
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    event = "VeryLazy",
    init = function()
      require("core.utils").load_mappings "copilotchat"
    end,
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    opts = {
      prompts = {
        -- Code related prompts
        Explain = "Please explain how the following code works.",
        Review = "Please review the following code and provide suggestions for improvement.",
        Tests = "Please explain how the selected code works, then generate unit tests for it.",
        Refactor = "Please refactor the following code to improve its clarity and readability.",
        FixCode = "Please fix the following code to make it work as intended.",
        FixError = "Please explain the error in the following text and provide a solution.",
        BetterNamings = "Please provide better names for the following variables and functions.",
        Documentation = "Please provide documentation for the following code.",
        -- Text related prompts
        Summarize = "Please summarize the following text.",
        Spelling = "Please correct any grammar and spelling errors in the following text.",
        Wording = "Please improve the grammar and wording of the following text.",
        Concise = "Please rewrite the following text to make it more concise.",
      },
      auto_follow_cursor = false,
      mappings = {
        close = "q",
        reset = "<C-r>",
        complete = "<Tab>",
        submit_prompt = "<CR>",
        accept_diff = "<C-a>",
        show_diff = "<C-s>",
      }
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      local select = require("CopilotChat.select")
      opts.selection = select.unnamed

      chat.setup(opts)

      vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = "*", range = true })

      vim.api.nvim_create_user_command("CopilotChatInline", function(args)
        chat.ask(args.args, {
          selection = select.visual,
          window = {
            layout = "float",
            relative = "cursor",
            width = 1,
            height = 0.4,
            row = 1,
          },
        })
      end, { nargs = "*", range = true})

      vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
        chat.ask(args.args, { selection = select.buffer })
      end, { nargs = "*", range = true})
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
    "lspcontainers/lspcontainers.nvim"
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
