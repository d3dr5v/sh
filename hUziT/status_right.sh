#!/bin/bash

timew_total=$(timew | grep "Total" | awk '{print $2}')

if [ -n "$timew_total" ]; then
    timew_display="$timew_total · "
else
    timew_display=""
fi

cpu_usage=$(top -l 2 | grep -E "^CPU" | tail -1 | awk '{ print $3 + $5"%" }')

current_time=$(date '+%d/%m %H:%M')

process_count=$(ps aux | wc -l | xargs)

relay=$(/usr/local/bin/mullvad status | grep "Relay:" | awk '{print $2}')

echo "$relay · $timew_display$cpu_usage · $current_time · $process_count"
