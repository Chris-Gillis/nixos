# Dependency for ./neo-tree
{ pkgs, lib }: {
  plugin = pkgs.vimPlugins.nui-nvim;
  type = "lua";
}
