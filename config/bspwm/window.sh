#!/usr/bin/env bash
set -euo pipefail

current_monitor_id=$(bspc wm -d | jq '.focusedMonitorId')
current_monitor_name=$(bspc wm -d | jq -r ".monitors[] | select(.id | contains($current_monitor_id)) | .name")
current_monitor_width=$(xwininfo -name "$current_monitor_name" | grep 'Width' | cut -d ':' -f2 | sed 's/ //g')
current_monitor_height=$(xwininfo -name "$current_monitor_name" | grep 'Height' | cut -d ':' -f2 | sed 's/ //g')
current_monitor_position_start_from_left=$(xwininfo -name "$current_monitor_name" | grep 'Absolute upper-left X' | cut -d ':' -f2 | sed 's/ //g')
current_monitor_position_start_from_top=$(xwininfo -name "$current_monitor_name" | grep 'Absolute upper-left Y' | cut -d ':' -f2 | sed 's/ //g')

echo "$current_monitor_name"
echo "$current_monitor_width"
echo "$current_monitor_height"
echo "$current_monitor_position_start_from_left"
echo "$current_monitor_position_start_from_top"
