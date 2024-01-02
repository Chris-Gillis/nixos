{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.neo-tree-nvim;
  type = "lua";
  config = ''
    -- disable legacy commands
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    require("neo-tree").setup({
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { "terminal" },
      window = {
        position = "left",
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["o"] = "open",
          ["i"] = "open_split",
          ["s"] = "open_vsplit",
          ["a"] = { "add", config = { show_path = "relative" } },
          ["d"] = "delete",
          ["r"] = { "rename", config = { show_path = "relative" } },
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
        follow_current_file = true,
      },
    })

    -- keybinds
    vim.keymap.set('n', '<C-b>', '<cmd> Neotree toggle<CR>')
    vim.keymap.set('n', '<C-e>', '<cmd> Neotree focus<CR>')

    -- open neo-tree on enter directory
    local function open_neo_tree(data)

      -- buffer is a directory
      local directory = vim.fn.isdirectory(data.file) == 1

      local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

      if not directory and not no_name then
        return
      end

      if directory then
        -- create a new, empty buffer
        vim.cmd.enew()

        -- wipe the directory buffer
        vim.cmd.bw(data.buf)

        -- change to the directory
        vim.cmd.cd(data.file)

        -- open the tree
        require("neo-tree.command").execute({
          action = "show",
          source = "filesystem",
          dir = data.file,
          toggle = false,
        })
        -- focus the tree
        require("neo-tree.command").execute({ action = "focus" })
      end

      if no_name then
        -- open the tree, find the file but don't focus it
        require("neo-tree.command").execute({
          action = "show",
          source = "filesystem",
          toggle = false,
        })
        -- focus the tree
        require("neo-tree.command").execute({ action = "focus" })
      end
    end

    vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_neo_tree })
  '';
}
