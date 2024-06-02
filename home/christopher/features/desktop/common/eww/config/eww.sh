#!/bin/sh

run_launcher()
{
  wofi
}

run_battery()
{
  battery=`cat /sys/class/power_supply/BAT0/capacity`
  adapter=`cat /sys/class/power_supply/AC/online`

  if [[ "$1" == "charge" ]]; then
    echo "$battery"
  elif [[ "$1" == "ac" ]]; then
    echo "$adapter"
  else
    echo "{\"battery\":$battery,\"ac\":\"$adapter\"}"
  fi
}

run_network()
{
  IFNAME=$EWW_NETWORK_INTERFACE
  NETSTAT="/sys/class/net/$IFNAME/statistics"
  BYTES_RX="$NETSTAT/rx_bytes"
  BYTES_TX="$NETSTAT/tx_bytes"

  CACHE="$HOME/.cache/eww/network"
  CACHE_UP="$CACHE/bytes_up"
  CACHE_DOWN="$CACHE/bytes_down"

  ## Create cache dir if it doesn't exist
  if [[ ! -d "$CACHE" ]]; then
      mkdir -p ${CACHE}
      touch ${CACHE_UP}
      touch ${CACHE_DOWN}
  fi

  get_network_data() {
      prev_bytes_up=`cat $CACHE_UP`
      prev_bytes_down=`cat $CACHE_DOWN`

      bytes_up=`cat $BYTES_TX`
      bytes_down=`cat $BYTES_RX`

      up_diff="$((bytes_up-prev_bytes_up))"
      down_diff="$((bytes_down-prev_bytes_down))"

      up_diff_bits="$((up_diff*8))"
      down_diff_bits="$((down_diff*8))"

      formatted_up=`numfmt --suffix "b/s" --to iec --format "%3.0f" $up_diff_bits`
      formatted_down=`numfmt --suffix "b/s" --to iec --format "%3.0f" $down_diff_bits`

      ## Overwrite previous speed data
      echo "$bytes_up" > ${CACHE_UP}
      echo "$bytes_down" > ${CACHE_DOWN}
  }

  get_network_data

  echo "{\"up\":\"$formatted_up\",\"down\":\"$formatted_down\"}"
}

run_power()
{
  if [[ "$1" == "shutdown" ]]; then
    doas poweroff
  elif [[ "$1" == "reboot" ]]; then
    doas reboot
  elif [[ "$1" == "logout" ]]; then
    loginctl kill-session self
  fi
}

run_volume()
{
  volume=`pactl get-sink-volume @DEFAULT_SINK@ | head -n1 | awk '{print $5}' | sed 's/\%//g'`
  mute=`pactl get-sink-mute @DEFAULT_SINK@ | grep Mute | head -n1 | awk '{print $2}'`


  if [[ "$1" == "value" ]]; then
    echo "$volume"
  elif [[ "$1" == "muted" ]]; then
    echo "$mute"
  else
    echo "{\"volume\":$volume,\"mute\":\"$mute\"}"
  fi
}

run_workspaces_old()
{
  get_workspaces() {
    workspaces=($(swaymsg -t get_workspaces | jq -r -c '.[] | { "name": .name, "focused": .focused, "urgent": .urgent }'))

    json='['
    for workspace in "${workspaces[@]}"; do
      name=`echo "$workspace" | jq -r -c '.name'`
      focused=`echo "$workspace" | jq -r -c '.focused'`
      urgent=`echo "$workspace" | jq -r -c '.urgent'`
      if [[ "$name" == "main" ]]; then
        symbol="גּ"
        pretty="Main"
      elif [[ "$name" == "code" ]]; then
        symbol=""
        pretty="Code"
      elif [[ "$name" == "test" ]]; then
        symbol=""
        pretty="Test"
      else
        symbol=""
        pretty="$name"
      fi
      json="$json{\"symbol\":\"$symbol\",\"name\":\"$name\",\"pretty\":\"$pretty\",\"focused\":$focused,\"urgent\":$urgent},"
    done
    json="${json::-1}]"
    echo "$json"
  }

  get_workspaces

  ## Subscribe to workspace updates to refresh this script
  swaymsg -t subscribe -m '[ "workspace" ]' | while read -r _ ; do
    get_workspaces
  done
}

run_workspaces() {
  echo "{\"workspaces\":[]}"
}

SCRIPT="$1"
shift

if [[ "$SCRIPT" == "battery" ]]; then
  run_battery $@
elif [[ "$SCRIPT" == "network" ]]; then
  run_network $@
elif [[ "$SCRIPT" == "power" ]]; then
  run_power $@
elif [[ "$SCRIPT" == "volume" ]]; then
  run_volume $@
elif [[ "$SCRIPT" == "workspaces" ]]; then
  run_workspaces $@
elif [[ "$SCRIPT" == "launcher" ]]; then
  run_launcher $@
else
  echo "Please select a script to run!"
  exit 1
fi
