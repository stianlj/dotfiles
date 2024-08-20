#!/usr/bin/env bash

swaymsg -t subscribe -m '[ "window" ]' | while read line; do
  currentMonitor=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused).name')
  if [ "$currentMonitor" == "DP-1" ]; then
    numberOfFloatingNodes=$(swaymsg -t get_workspaces | jq '.[] | select(.focused).floating_nodes | length')
    numberOfNodes=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused).focus | length')
    numberOfNonFloatingNodes=$(($numberOfNodes - $numberOfFloatingNodes))
    echo "$numberOfNodes/$numberOfFloatingNodes/$numberOfNonFloatingNodes"
    if [ "$numberOfNonFloatingNodes" == "1" ]; then
      swaymsg gaps horizontal current set 800
      swaymsg gaps vertical current set 10
    elif [ "$numberOfNonFloatingNodes" == "2" ]; then
      swaymsg gaps horizontal current set 400
      swaymsg gaps vertical current set 10
    elif [ "$numberOfNonFloatingNodes" == "3" ]; then
      swaymsg gaps horizontal current set 200
      swaymsg gaps vertical current set 10
    elif [ "$numberOfNonFloatingNodes" == "4" ]; then
      swaymsg gaps horizontal current set 10
      swaymsg gaps vertical current set 10
    fi
  fi
done
