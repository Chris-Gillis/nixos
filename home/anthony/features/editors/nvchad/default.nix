{ config, pkgs, lib, ... }:
let
  populateEnv = ./populate-nvim-env.py;

  populateEnvScript = ''
    mkdir -p ${config.xdg.dataHome}/nvim/site/plugin
    ${pkgs.python311}/bin/python ${populateEnv} -o ${config.xdg.dataHome}/nvim/site/plugin
  '';

  rubyDeps = pkgs.ruby.withPackages (p: with p; [
    solargraph
  ]);
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
      rubyDeps
      silicon
    ];
    withPython3 = true;
    extraPython3Packages = (ps: with ps; [
      python-dotenv
      requests
      pynvim
      prompt-toolkit
      tiktoken
    ]);
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
