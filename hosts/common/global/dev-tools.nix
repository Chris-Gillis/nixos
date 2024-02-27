{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # Base Linux things
    vim
    wget
    curl
    git

    # Compilers
    gcc

    # Network tools
    tdns-cli

    # Misc Libs & Utils
    zip
    unzip
    git-crypt
  ];
}
