#!/usr/bin/env bash
# TODO: Pomodoro in general:
# * Keyboard shortcuts in Hyprland
# * Style
# * Find a way to implement automatic break
# * Set up hooks with:
# ** Notifications
# ** Update host file with forbidden sites when in pomodoro session

pomodoro_status=$(pomodoro status)
pomodoro_status_minutes=$(pomodoro status --format "%R")

if [[ $pomodoro_status ]]; then
  echo "{\"text\": \"${pomodoro_status_minutes}\", \"class\": \"running\", \"tooltip\": \"${pomodoro_status}\"}"
else
  echo "{\"text\": \"0\", \"class\": \"not-running\", \"tooltip\": \"Ingen pomodoro akkurat nå\"}"
fi
