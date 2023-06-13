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
        "ATTMxkE3Ks" = {
          psk = "k9yam28bvp6d";
        };
      };
    };
  };

  users = {
    groups.network = { };
  };
}
