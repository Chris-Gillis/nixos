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
  plugin = (pluginFromGit "kamykn/spelunker.vim" "master" "a0bc530f62798bbe053905555a4aa9ed713485eb");
  type = "lua";
  config = ''
    vim.g.enable_spelunker_vim = 1
  '';
}
