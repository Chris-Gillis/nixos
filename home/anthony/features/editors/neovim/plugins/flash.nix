{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.flash-nvim;
  type = "lua";
  config = ''
    require("flash").setup({
      search = {
        mode = function(str)
          return "\\<" .. str
        end,
      },
    })

    vim.keymap.set({ 'n', 'x', 'o' }, 's', function()
      require("flash").jump({
        search = {
          mode = function(str)
            return "\\<" .. str
          end,
        },
      })
    end)
  '';
}
    # vim.keymap.set(
    #   'n',
    #   '<leader>s',
    #   [[
    #     function()
    #       require("flash").jump({
    #         search = {
    #           mode = function(str)
    #             return "\\<" .. str
    #           end,
    #         },
    #       })
    #     end
    #   ]],
    #   {}
    # )
