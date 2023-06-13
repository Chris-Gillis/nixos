{ pkgs, ... }: {
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    nerdfonts
    font-awesome

    # Custom fonts (see /pkgs/)
    koulen
    phosphor-icons
  ];
}
