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

    # Language Support
    ruby
    nodejs
    rust-bin.stable.latest.default

    # Misc Libs & Utils
    direnv
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
