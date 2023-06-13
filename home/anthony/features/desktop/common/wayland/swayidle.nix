{ pkgs, lib, config, ... }:
let
  swaylock = "${pkgs.swaylock-effects}/bin/swaylock";
  pactl = "${pkgs.pulseaudio}/bin/pactl";
  pgrep = "${pkgs.procps}/bin/pgrep";
  swaymsg = "${pkgs.sway}/bin/swaymsg";

  isLocked = "${pgrep} -x swaylock";
  actionLock = "${swaylock} -S --daemonize";

  lockTime = 4 * 60; # 4min
  
  mkEvent = time: start: resume: ''
    timeout ${toString (lockTime + time)} '${start}' ${lib.optionalString (resume != null) "resume '${resume}'"}
    timeout ${toString time} '${isLocked} && ${start}' ${lib.optionalString (resume != null) "resume '${isLocked} && ${resume}'"}
  '';
in
{
  xdg.configFile."swayidle/config".text = ''
    timeout ${toString lockTime} '${actionLock}'
  '' +
  # After 10s of being locked, mute mic
  (mkEvent 10 "${pactl} set-source-mute @DEFAULT_SOURCE@ yes" "${pactl} set-source-mute @DEFAULT_SOURCE@ no") +
  # Sway: turn off screen
  lib.optionalString config.wayland.windowManager.sway.enable
    (mkEvent 40 "${swaymsg} 'output * dpms off'" "${swaymsg} 'output * dpms on'");
}
