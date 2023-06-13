{ pkgs, ... }: {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "AnthonyUtt";
    userEmail = "anthony@anthonyutt.dev";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      user = {
        signing.key = "22950B038D71CEA";
      };
      commit = {
        # gpgSign = true;
      };
    };
  };
}
