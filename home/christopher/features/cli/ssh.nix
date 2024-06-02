{ pkgs, ... }: {
  programs.ssh = {
    enable = true;
    extraConfig = ''
Host gh
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile /home/christopher/.ssh/id_rsa
    User git
  };
}
