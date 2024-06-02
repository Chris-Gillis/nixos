{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.nvim-autopairs;
  type = "lua";
  config = ''
    require('nvim-autopairs').setup({
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt" , "vim" },
    })

    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  '';
}
