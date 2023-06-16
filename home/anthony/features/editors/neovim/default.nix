{ pkgs, config, unstable, lib, ... }:
let
  # Installs a vim plugin from git
  pluginGit = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
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
      let g:codeium_no_map_tab = true
      imap <silent><script><expr><nowait> <C-v> codeium#Accept()
    '';

    extraPackages = with pkgs; [
      tree-sitter

      nodejs
      ruby
      gnumake
    ];

    plugins = with pkgs.vimPlugins; [
      codeium-vim
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };
}
