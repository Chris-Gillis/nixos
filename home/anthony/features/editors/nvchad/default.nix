{ config, pkgs, lib, ... }:
let
  populateEnv = ./populate-nvim-env.py;

  populateEnvScript = ''
    mkdir -p ${config.xdg.dataHome}/nvim/site/plugin
    ${pkgs.python39}/bin/python ${populateEnv} -o ${config.xdg.dataHome}/nvim/site/plugin
  '';
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      nodejs_20
      gcc
      typescript
    ];
  };

  xdg.configFile."nvim".source = "${pkgs.nvchad}";

  home.packages = with pkgs; [
    nvchad
    (pkgs.writeShellScriptBin "update-nvim-env" ''
      #
      # update-nvim-env
      #
      # Update neovim env such that it can be used in neovide or other GUIs
      ${populateEnvScript}
    '')
  ];

  home.activation.neovim = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    echo "Populating neovim env..."
    ${populateEnvScript}
  '';

  programs.bash.initExtra = lib.mkAfter ''
    export EDITOR="${config.programs.neovim.package}/bin/nvim"
  '';

  programs.zsh.initExtra = lib.mkAfter ''
    export EDITOR="${config.programs.neovim.package}/bin/nvim"
  '';
}
