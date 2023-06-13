{ pkgs, ... }: {
  programs.ssh = {
    enable = true;
    extraConfig = ''
Host gh
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile /home/anthony/.ssh/id_rsa
    User git
    '';
  };
}
