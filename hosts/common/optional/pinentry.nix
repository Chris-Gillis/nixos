{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ pinentry ];
  services.dbus.packages = [ pkgs.gcr ];
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
  };
}
