{ pkgs, lib }:
let
  pluginFromGit = repo: ref: rev: pkgs.vimUtils.buildVimPlugin {
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
  plugin = (pluginFromGit "Glench/Vim-Jinja2-Syntax" "master" "2c17843b074b06a835f88587e1023ceff7e2c7d1");
  type = "lua";
  config = ''
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
      pattern = { "*.tera" },
      command = "set ft=jinja",
    })
  '';
}
