#!/bin/bash

# Start-up applications at the right time
hour=$(date +%H | sed "s/^0*//g; s/\.0*/./g")
start_hour=9
end_hour=17

day=$(date +%u)
start_day=1
end_day=5

if [[ $hour -ge $start_hour ]] && [[ $hour -le $end_hour ]] && [[ $day -ge $start_day ]] && [[ $day -le $end_day ]]
then
    google-chrome-stable &
    codium $HOME/Documents/projects/profesional/unifai/self-service &
    slack &
fi
exit 0
