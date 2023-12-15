{ pkgs, ... }: {
  home.packages = [
    (pkgs.discord.override {
      withVencord = false;
    })
  ];
  xdg.configFile = {
    "discord/settings.json" = {
      source = ./settings.json;
    };

    "Vencord" = {
      recursive = true;
      source = ./vencord;
    };
  };
}
