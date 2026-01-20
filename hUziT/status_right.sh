#!/bin/bash

timew_total=$(timew | grep "Total" | awk '{print $2}')
if [ -n "$timew_total" ]; then
    timew_display="$timew_total "
else
    timew_display=""
fi

cpu_usage="$(top -l 2 | grep -E "^CPU" | tail -1 | awk '{ print $3 + $5"%" }')"

current_time="$(date '+%d/%m %H:%M')"

relay_raw=$(/usr/local/bin/mullvad status | grep "Relay:" | awk '{print $2}')
if [ -n "$relay_raw" ]; then
    relay="$relay_raw"
else
    relay="No VPN"
fi

memory_usage="$(vm_stat | awk '/Pages free:/{free=$3} /Pages active:/{active=$3} END {printf "%.2f%%", (active/(active+free))*100}')"

current_path=$(tmux display-message -p "#{pane_current_path}")

current_path="${current_path/#$HOME/\~}"

if [[ ${#current_path} -gt 20 ]]; then
  current_path=$(echo "$current_path" | rev | cut -d'/' -f-2 | rev)
fi

battery="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)%"

echo "#[fg=white]$timew_display#[fg=red]$current_path #[fg=yellow]$relay #[fg=green]$battery #[fg=coral]$cpu_usage #[fg=blue]$memory_usage #[fg=orange]$current_time"
