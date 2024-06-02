{ home, wallpaper, theme, hyprland }:
let
  inherit (home.sessionVariables) TERMINAL BROWSER EDITOR;
  inherit (theme) colors;
in
''
  $inactive_border=0xff${colors.inactive}
  $active_border=0xff${colors.focused}
  $group_border=0x66${colors.inactive-alt}
  $group_border_active=0x66${colors.focused-alt}
  $shadow=0x44000000
  $shadow_inactive=0x66000000

  general {
    ${hyprland.general}
    gaps_in=10
    gaps_out=10
    border_size=3
    cursor_inactive_timeout=4

    # Base colors
    col.inactive_border=$inactive_border
    col.active_border=$active_border
  }

  group {
    col.border_inactive=$group_border
    col.border_active=$group_border_active
  }

  decoration {
    active_opacity=0.94
    inactive_opacity=0.84
    fullscreen_opacity=1.0
    rounding=5
    drop_shadow=true
    shadow_range=12
    shadow_offset=3 3

    # Shadow colors
    col.shadow=$shadow
    col.shadow_inactive=$shadow_inactive

    blur {
      enabled=true
      size=5
      passes=3
      new_optimizations=true
      ignore_opacity=false
    }
  }

  animations {
    enabled=true

    bezier=easein,0.11, 0, 0.5, 0
    bezier=easeout,0.5, 1, 0.89, 1
    bezier=easeinout,0.45, 0, 0.55, 1
    bezier=overshot,0.05,0.9,0.1,1.1

    animation=windowsIn,1,3,overshot,slide
    animation=windowsOut,1,3,overshot,slide
    animation=windowsMove,1,3,overshot

    animation=fadeIn,1,3,easeout
    animation=fadeOut,1,3,easein
    animation=fadeSwitch,1,3,easeout
    animation=fadeShadow,1,3,easeout
    animation=fadeDim,1,3,easeout
    animation=border,1,3,easeout

    animation=workspaces,1,2,overshot,slide
  }

  dwindle {
    split_width_multiplier=1.35
  }

  master {
    new_is_master=false
    orientation=center
    always_center_master=true
  }

  misc {
    vfr=on
  }

  input {
    touchpad {
      disable_while_typing=true
      natural_scroll=true
    }
  }

  gestures {
    workspace_swipe = true
  }

  # Startup
  exec-once=eww -c $HOME/.config/eww open topbar
  exec-once=mako
  exec=swaybg -i ${wallpaper} --mode fill

  ${hyprland.startup}

  # Mouse binding
  bindm=SUPER,mouse:272,movewindow
  bindm=SUPER,mouse:273,resizewindow

  # Program bindings
  bind=SUPER,Return,exec,${TERMINAL}

  bind=SUPER,space,exec,wofi
  bind=SUPER,d,exec,wofi -S run

  # Clipboard management
  exec-once = wl-paste --type thyprland --watch cliphist store #Stores only text data
  exec-once = wl-paste --type image --watch cliphist store #Stores only image data
  bind = SUPER, V, exec, cliphist list | wofi -dmenu | cliphist decode | wl-copy

  # Lock screen
  bind=,XF86Launch5,exec,swaylock -S
  bind=,XF86Launch4,exec,swaylock -S
  bind=SUPER,backspace,exec,swaylock -S

  # Screenshots
  bind=,Print,exec,grimblast --notify copy area

  # Keyboard controls (brightness, media, sound, etc)
  bind=,XF86MonBrightnessUp,exec,brightnessctl set +5%
  bind=,XF86MonBrightnessDown,exec,brightnessctl set 5%-

  bind=,XF86AudioNext,exec,playerctl next
  bind=,XF86AudioPrev,exec,playerctl previous
  bind=,XF86AudioPlay,exec,playerctl play-pause
  bind=,XF86AudioStop,exec,playerctl stop
  bind=ALT,XF86AudioNext,exec,playerctld shift
  bind=ALT,XF86AudioPrev,exec,playerctld unshift
  bind=ALT,XF86AudioPlay,exec,systemctl --user restart playerctld

  bind=,XF86AudioRaiseVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ +5%
  bind=,XF86AudioLowerVolume,exec,pactl set-sink-volume @DEFAULT_SINK@ -5%
  bind=,XF86AudioMute,exec,pactl set-sink-mute @DEFAULT_SINK@ toggle

  bind=SHIFT,XF86AudioMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle
  bind=,XF86AudioMicMute,exec,pactl set-source-mute @DEFAULT_SOURCE@ toggle


  # Window manager controls
  bind=SUPER,y,overview:toggle

  bind=SUPERSHIFT,q,killactive
  bind=SUPERSHIFT,e,exit

  bind=SUPER,s,togglesplit
  bind=SUPER,f,fullscreen,1
  bind=SUPERSHIFT,f,fullscreen,0
  bind=SUPERSHIFT,space,togglefloating

  bind=SUPER,minus,splitratio,-0.25
  bind=SUPERSHIFT,minus,splitratio,-0.3333333

  bind=SUPER,equal,splitratio,0.25
  bind=SUPERSHIFT,equal,splitratio,0.3333333

  bind=SUPER,g,togglegroup
  bind=SUPER,apostrophe,changegroupactive,f
  bind=SUPERSHIFT,apostrophe,changegroupactive,b

  bind=SUPER,left,movefocus,l
  bind=SUPER,right,movefocus,r
  bind=SUPER,up,movefocus,u
  bind=SUPER,down,movefocus,d
  bind=SUPER,h,movefocus,l
  bind=SUPER,l,movefocus,r
  bind=SUPER,k,movefocus,u
  bind=SUPER,j,movefocus,d

  bind=SUPERSHIFT,left,swapwindow,l
  bind=SUPERSHIFT,right,swapwindow,r
  bind=SUPERSHIFT,up,swapwindow,u
  bind=SUPERSHIFT,down,swapwindow,d
  bind=SUPERSHIFT,h,swapwindow,l
  bind=SUPERSHIFT,l,swapwindow,r
  bind=SUPERSHIFT,k,swapwindow,u
  bind=SUPERSHIFT,j,swapwindow,d

  bind=SUPER,u,togglespecialworkspace
  bind=SUPERSHIFT,u,movetoworkspace,special

  bind=SUPER,1,workspace,01
  bind=SUPER,2,workspace,02
  bind=SUPER,3,workspace,03
  bind=SUPER,4,workspace,04
  bind=SUPER,5,workspace,05
  bind=SUPER,6,workspace,06
  bind=SUPER,7,workspace,07
  bind=SUPER,8,workspace,08
  bind=SUPER,9,workspace,09
  bind=SUPER,0,workspace,10
  bind=SUPER,f1,workspace,11
  bind=SUPER,f2,workspace,12
  bind=SUPER,f3,workspace,13
  bind=SUPER,f4,workspace,14
  bind=SUPER,f5,workspace,15
  bind=SUPER,f6,workspace,16
  bind=SUPER,f7,workspace,17
  bind=SUPER,f8,workspace,18
  bind=SUPER,f9,workspace,19
  bind=SUPER,f10,workspace,20
  bind=SUPER,f11,workspace,21
  bind=SUPER,f12,workspace,22

  bind=SUPERSHIFT,1,movetoworkspacesilent,01
  bind=SUPERSHIFT,2,movetoworkspacesilent,02
  bind=SUPERSHIFT,3,movetoworkspacesilent,03
  bind=SUPERSHIFT,4,movetoworkspacesilent,04
  bind=SUPERSHIFT,5,movetoworkspacesilent,05
  bind=SUPERSHIFT,6,movetoworkspacesilent,06
  bind=SUPERSHIFT,7,movetoworkspacesilent,07
  bind=SUPERSHIFT,8,movetoworkspacesilent,08
  bind=SUPERSHIFT,9,movetoworkspacesilent,09
  bind=SUPERSHIFT,0,movetoworkspacesilent,10
  bind=SUPERSHIFT,f1,movetoworkspacesilent,11
  bind=SUPERSHIFT,f2,movetoworkspacesilent,12
  bind=SUPERSHIFT,f3,movetoworkspacesilent,13
  bind=SUPERSHIFT,f4,movetoworkspacesilent,14
  bind=SUPERSHIFT,f5,movetoworkspacesilent,15
  bind=SUPERSHIFT,f6,movetoworkspacesilent,16
  bind=SUPERSHIFT,f7,movetoworkspacesilent,17
  bind=SUPERSHIFT,f8,movetoworkspacesilent,18
  bind=SUPERSHIFT,f9,movetoworkspacesilent,19
  bind=SUPERSHIFT,f10,movetoworkspacesilent,20
  bind=SUPERSHIFT,f11,movetoworkspacesilent,21
  bind=SUPERSHIFT,f12,movetoworkspacesilent,22

  ${hyprland.bindings}

  windowrule=float,title:^(hyprland-fzfify)$
''
