#!/bin/bash

lock_and_suspend() {
  # Suspend the system (locking is manage by hypridle)
  echo "Suspending the system..."
  systemctl suspend
}

move_to_external_monitor() {
  for (( i=1; i<=5; i++ )); do
    hyprctl dispatch workspace $i
    hyprctl dispatch movecurrentworkspacetomonitor +1
  done
}

move_from_external_monitor() {
  for (( i=1; i<=5; i++ )); do
    hyprctl dispatch workspace $i
    hyprctl dispatch movecurrentworkspacetomonitor -1
  done
}

adjust_workspaces() {
  if [ "$1" == "1" ] && [ "$2" == "closed" ]; then
      lock_and_suspend
  elif [ "$1" == "2" ]; then
    if [ "$2" == "open" ]; then
      move_from_external_monitor
      hyprctl keyword monitor desc:"BOE 0x0BCA",preferred,auto,1
    elif [ "$2" == "closed" ]; then
      move_to_external_monitor
      hyprctl keyword monitor desc:"BOE 0x0BCA",disable
    fi
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

  adjust_workspaces "$num_monitors" "$laptop_status"
}

main
