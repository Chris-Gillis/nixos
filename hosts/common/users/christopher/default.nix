{ pkgs, config, ... }:
let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.mutableUsers = false;
  users.users.christopher = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "dialout"
    ] ++ ifTheyExist [
      "network"
      "docker"
      "git"
      "input"
      "uinput"
    ];
    packages = [ pkgs.home-manager ];
  };
}
