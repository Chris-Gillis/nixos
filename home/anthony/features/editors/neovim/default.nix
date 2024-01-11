{ pkgs, unstable, lib, ... }:
let
  plugins = import ./plugins { inherit pkgs lib; };
in
{
  home.sessionVariables.EDITOR = "nvim";

  programs.neovim = {
    enable = true;
    package = unstable.neovim-unwrapped;

    extraPackages = with pkgs; [
      # Language servers
      nodePackages.bash-language-server
      nodePackages.vscode-langservers-extracted
      nodePackages.eslint
      nodejs_18
      docker-compose-language-service
      nodePackages.dockerfile-language-server-nodejs
      lua-language-server
      nil
      nodePackages.prettier
      rust-analyzer
      rubyPackages.solargraph
      nodePackages.typescript-language-server
    ];

    extraLuaPackages = luaPkgs: [];

    plugins = builtins.attrValues plugins;

    extraLuaConfig = ''
      ${lib.strings.fileContents ./lua/vim-settings.lua}
      ${lib.strings.fileContents ./lua/keybinds.lua}
    '';
  };
}
