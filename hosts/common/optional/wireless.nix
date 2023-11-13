{
  networking = {
    wireless = {
      enable = true;
      userControlled = {
        enable = true;
        group = "network";
      };
      networks = {
        "UttAloufHome-5G" = {
          psk = "smilingvalley910";
        };
      };
    };
  };

  users = {
    groups.network = { };
  };
}
