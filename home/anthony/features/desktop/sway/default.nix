{ pkgs, lib, config, ... }: {
  imports = [
    ../common/wayland
  ];

  wayland.windowManager.sway = {
    enable = true;
    extraConfig = builtins.readFile ./config/default;
    config = {
      modifier = "Mod4";
      terminal = "${pkgs.kitty}/bin/kitty";
      menu = "${pkgs.wofi}/bin/wofi --show drun";
      left = "h";
      up = "k";
      down = "j";
      right = "l";

      bars = [];
      defaultWorkspace = "workspace number 1";
      gaps = {
        smartGaps = true;
        inner = 5;
        outer = 10;
      };

      keybindings = let
        mod = config.wayland.windowManager.sway.config.modifier;
	      inherit (config.wayland.windowManager.sway.config)
	        left up down right terminal menu;
      in {
        "${mod}+Return" = "exec ${terminal}";
	      "${mod}+Shift+q" = "kill";
	      "${mod}+Space" = "exec ${menu}";

	      "${mod}+${left}" = "focus left";
        "${mod}+${down}" = "focus down";
        "${mod}+${up}" = "focus up";
        "${mod}+${right}" = "focus right";

        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+${left}" = "move left";
        "${mod}+Shift+${down}" = "move down";
        "${mod}+Shift+${up}" = "move up";
        "${mod}+Shift+${right}" = "move right";

        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        "${mod}+Shift+space" = "floating toggle";
        "${mod}+z" = "focus mode_toggle";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        # "${mod}+p" =
        #   "exec ${pkgs.slurp}/bin/slurp | ${pkgs.grim}/bin/grim -g- screenshot-$(date +%Y%m%d-%H%M%S).png";

        "${mod}+c" = "split h";
        "${mod}+v" = "split v";
        "${mod}+f" = "fullscreen toggle";
        # "${mod}+comma" = "layout stacking";
        # "${mod}+period" = "layout tabbed";
        # "${mod}+slash" = "layout toggle split";
        "${mod}+a" = "focus parent";
        # "${mod}+s" = "focus child";

        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";
        # "${mod}+Shift+v" = ''mode "system:  [r]eboot  [p]oweroff  [l]ogout"'';

        "${mod}+r" = "mode resize";

        # "${mod}+l" = ''exec ${pkgs.swaylock}/bin/swaylock -i ":$(${wallpaper}/bin/wallpaper get)"'';
        # "${mod}+k" = "exec ${pkgs.mako}/bin/makoctl dismiss";
        # "${mod}+Shift+k" = "exec ${pkgs.mako}/bin/makoctl dismiss -a";

        "XF86MonBrightnessUp" = "exec light -A 5";
        "XF86MonBrightnessDown" = "exec light -U 5";

        "XF86AudioMute" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioRaiseVolume" =
          "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" =
          "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";

        # "${mod}+apostrophe" = "move workspace to output right";

        # "${mod}+minus" = "scratchpad show";
        # "${mod}+underscore" = "move container to scratchpad";
      };
      startup = let
        wallpaper = config.wallpaper;
      in [
        # { command = "albert"; }
        { command = "swaybg -i ${wallpaper} --mode fill";  }
        { command = "eww -c ~/.config/eww/topbar open topbar"; }
      ];
    };
  };

  home.packages = with pkgs; [
    swaybg
  ];

  programs.zsh.loginExtra = ''
    if [ "$(tty)" = "/dev/tty1" ]; then
      exec sway &> /dev/null
    fi
  '';

  programs.zsh.profileExtra = ''
    if [ "$(tty)" = "/dev/tty1" ]; then
      exec sway &> /dev/null
    fi
  '';
}
