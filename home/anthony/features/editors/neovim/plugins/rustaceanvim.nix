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
  plugin = (pluginFromGit "mrcjkb/rustaceanvim" "master" "66466d4fe0b8988ba9e2932d3c41782c2efb683b");
  type = "lua";
  config = ''
    vim.g.rustaceanvim = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              enable = true,
              command = "check",
              extraArgs = {
                "--target-dir", "/home/anthony/.rust-analyzer",
              }
            }
          }
        }
      }
    }
  '';
}
