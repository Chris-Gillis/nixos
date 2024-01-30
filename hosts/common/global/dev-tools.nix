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

    # Network tools
    tdns-cli

    # Misc Libs & Utils
    zip
    unzip
    git-crypt
  ];

  services.dbus.packages = [ pkgs.gcr ];
  services.pcscd.enable = true;
  programs.gnupg.agent = {
     enable = true;
     pinentryFlavor = "curses";
     enableSSHSupport = true;
  };
}
