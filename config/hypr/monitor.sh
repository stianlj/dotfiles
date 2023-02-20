#!/usr/bin/env bash

function run_hyprctl {
  config=$1
  separator=" ; "
  string="$(printf "${separator}%s" "${config[@]}")"
  string="${string:${#separator}}" # remove leading separator
  hyprctl --batch "$string"
}

eww daemon
if [ "$COMPUTER_IDENTIFIER" = "main-desktop" ]; then
  OUTPUT_MAIN="DP-1"
  OUTPUT_UPPER="HDMI-A-1"
  CONFIG=(
    "keyword monitor $OUTPUT_MAIN,5120x1440,499x1545,1.4"
    "keyword monitor $OUTPUT_MAIN,addreserved,0,0,400,447"
    "keyword monitor $OUTPUT_UPPER,3840x2160,1018x0,1.4"
    # "keyword wsbind 1,$OUTPUT_MAIN"
    # "keyword wsbind 2,$OUTPUT_MAIN"
    # "keyword wsbind 3,$OUTPUT_MAIN"
    # "keyword wsbind 4,$OUTPUT_MAIN"
    # "keyword wsbind 5,$OUTPUT_MAIN"
    # "keyword wsbind 6,$OUTPUT_MAIN"
    # "keyword wsbind 7,$OUTPUT_UPPER"
    # "keyword wsbind 8,$OUTPUT_UPPER"
    # "keyword wsbind 9,$OUTPUT_UPPER"
    # "keyword wsbind 10,$OUTPUT_MAIN"
  )
  separator=" ; "
  string="$(printf "${separator}%s" "${CONFIG[@]}")"
  string="${string:${#separator}}"
  hyprctl --batch "$string"
  eww open "bar-ultrawide"
elif [ "$COMPUTER_IDENTIFIER" = "work-laptop" ]; then
  if [ -d "/sys/class/drm/card1-DP-1" ]; then
    NO_OF_OUTPUTS=$(cat /sys/class/drm/card1-*/status | grep -w "connected" | wc -l)
  else
    NO_OF_OUTPUTS=$(cat /sys/class/drm/card0-*/status | grep -w "connected" | wc -l)
  fi
  if [ "$NO_OF_OUTPUTS" -gt "1" -a "$NO_OF_OUTPUTS" -lt "3" ]; then
    OUTPUT_LEFT="eDP-1"
    OUTPUT_CENTER="DP-4"
    CONFIG=(
      "keyword monitor $OUTPUT_LEFT,addreserved,0,0,47,0"
      "keyword monitor $OUTPUT_LEFT,3840x2400,auto,3"
      "keyword monitor $OUTPUT_CENTER,5120x1440,1280x0,1.4"
      "keyword monitor $OUTPUT_CENTER,addreserved,10,10,400,447"
    )
    separator=" ; "
    string="$(printf "${separator}%s" "${CONFIG[@]}")"
    string="${string:${#separator}}"
    hyprctl --batch "$string"
    eww open bar
  elif [ "$NO_OF_OUTPUTS" -gt "2" ]; then
    OUTPUT_LEFT="eDP-1"
    OUTPUT_CENTER="DP-2"
    OUTPUT_RIGHT="DP-5"
    CONFIG=(
      "keyword monitor $OUTPUT_CENTER,addreserved,0,0,47,0"
      "keyword monitor $OUTPUT_LEFT,3840x2400,auto,3"
      "keyword monitor $OUTPUT_CENTER,3840x2160,1280x0,2"
      "keyword monitor $OUTPUT_RIGHT,2560x1440,3200x0,1.4"
      # "keyword wsbind 1,$OUTPUT_LEFT"
      # "keyword wsbind 2,$OUTPUT_LEFT"
      # "keyword wsbind 3,$OUTPUT_CENTER"
      # "keyword wsbind 4,$OUTPUT_CENTER"
      # "keyword wsbind 5,$OUTPUT_CENTER"
      # "keyword wsbind 6,$OUTPUT_CENTER"
      # "keyword wsbind 7,$OUTPUT_RIGHT"
      # "keyword wsbind 8,$OUTPUT_RIGHT"
      # "keyword wsbind 9,$OUTPUT_RIGHT"
      # "keyword wsbind 10,$OUTPUT_RIGHT"
    )

    # run_hyprctl "$CONFIG"
    separator=" ; "
    string="$(printf "${separator}%s" "${CONFIG[@]}")"
    string="${string:${#separator}}"
    hyprctl --batch "$string"
    eww open "bar-triple"
  else
    # monitor=DP-1,1920x1080,0x0,1,mirror,eDP-1
    hyprctl --batch "keyword monitor eDP-1,addreserved,0,0,47,0 ; keyword monitor eDP-1,3840x2400,auto,2"
    eww open bar
  fi
fi
