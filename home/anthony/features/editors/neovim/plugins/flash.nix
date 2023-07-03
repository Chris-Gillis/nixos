{ pkgs, lib }:
let
  pluginFromGit = repo: ref: rev: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
      rev = rev;
    };
  };
in
{
  plugin = (pluginFromGit "folke/flash.nvim" "main" "47fdbbb139d54eef2a0d164e3080d9924c969f77");
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
