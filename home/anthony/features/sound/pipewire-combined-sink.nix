{ ... }: {
  xdg.configFile."pipewire/pipewire-pulse.conf.d/add-combined-sink.conf".text = ''
    context.exec = [
      { path = "pactl" args = "load-module module-combine-sink" }
    ]
  '';
}
