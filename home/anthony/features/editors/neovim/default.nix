{ pkgs, config, unstable, lib, vimUtils, ... }:
let
  # Installs a vim plugin from git
  pluginGit = ref: repo: vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };

  # Always installs latest version
  plugin = pluginGit "HEAD";
in
{
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;
    package = unstable.neovim-unwrapped;
    extraConfig = ''
      luafile ~/.config/nvim/init.lua
    '';

    extraPackages = with pkgs; [
      tree-sitter

      nodejs
      ruby
      gnumake
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
