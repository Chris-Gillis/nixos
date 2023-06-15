{ pkgs, lib, config, ... }:
let
  host = config.networking.hostName;
in
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    historySubstringSearch.enable = true;
    initExtra = ''
      ${lib.strings.fileContents ./env.zsh}
      ${lib.strings.fileContents ./aliases.zsh}
      ${lib.strings.fileContents ./init.zsh}
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "dotenv"
        "vi-mode"
      ];
      theme = "avit";
    };
  };
}
