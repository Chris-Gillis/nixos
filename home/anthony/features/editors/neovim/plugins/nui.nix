# Dependency for ./neo-tree
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
  plugin = (pluginFromGit "MunifTanjim/nui.nvim" "main" "7a524120a7a70761b5a65b602fd235a65cb005aa");
  type = "lua";
}
