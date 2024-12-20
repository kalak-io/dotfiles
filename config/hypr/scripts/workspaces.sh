#!/bin/bash

move_to_monitor() {
  if [ ${1+x} ]; then
    local monitor=$1
    for (( i=1; i<=5; i++ )); do
      hyprctl dispatch moveworkspacetomonitor "${i} ${monitor}"
    done
  fi
}

is_laptop_monitor() {
  if hyprctl monitors | grep -q "BOE 0x0BCA"; then
    return 1
  fi
}

enable_laptop_monitor() {
  hyprctl keyword monitor "desc:BOE 0x0BCA,preferred,auto,1.566667"
  #move_to_monitor "desc: BOE 0x0BCA"
}

disable_laptop_monitor() {
  move_to_monitor "desc:Dell Inc. DELL P2212H V0VCM1CR1PAS"
  hyprctl keyword monitor "desc:BOE 0x0BCA,disable"
}

suspend_laptop() {
  systemctl suspend
}

adjust_workspaces() {
  is_laptop_monitor
  is_laptop=$?
  if [ "$1" -eq 1 ] && [ "$is_laptop" -eq 1 ] && [ "$2" == "closed" ]; then
    suspend_laptop
  elif [ "$1" -eq 1 ] && [ "$is_laptop" -ne 1 ] && [ "$2" == "open" ]; then
    enable_laptop_monitor
  elif [ "$1" -eq 2 ] && [ "$2" == "closed" ]; then
    disable_laptop_monitor
  fi

  hyprctl dispatch workspace 1
}

main() {
  num_monitors=$(($(xrandr --listmonitors | wc -l) - 1))

  if [ "$(cat /proc/acpi/button/lid/*/state | grep -c open)" -gt 0 ]; then
    laptop_status="open"
  else
    laptop_status="closed"
  fi

  adjust_workspaces ${num_monitors} ${laptop_status}
}
main
