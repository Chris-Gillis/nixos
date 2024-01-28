{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # Base Linux things
    vim
    wget
    curl
    git
    pinentry

    # Compilers
    gcc

    # Misc Libs & Utils
    zip
    unzip
  ];

  services.dbus.packages = [ pkgs.gcr ];
  services.pcscd.enable = true;
  programs.gnupg.agent = {
     enable = true;
     pinentryFlavor = "curses";
     enableSSHSupport = true;
  };
}
