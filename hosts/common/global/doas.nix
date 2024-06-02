{
  security = {
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [{
        users = [ "christopher" ];
        keepEnv = true;
        noPass = true;
      }];
    };
  };
}
