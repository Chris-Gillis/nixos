{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.lualine-nvim;
  type = "lua";
  config = ''
    require('lualine').setup({

    })
  '';
}
