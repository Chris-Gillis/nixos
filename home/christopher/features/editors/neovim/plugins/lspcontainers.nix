{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.lspcontainers-nvim;
  type = "lua";
}
