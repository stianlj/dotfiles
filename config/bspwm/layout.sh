#!/usr/bin/env bash

padding () {
    desktopId=$1
    top=$2
    right=$3
    bottom=$4
    left=$5

    bspc config -d $desktopId top_padding $top
    bspc config -d $desktopId right_padding $right
    bspc config -d $desktopId bottom_padding $bottom
    bspc config -d $desktopId left_padding $left
}

bspc subscribe node_add node_remove | while read -r line; do
    desktopId=$(echo "$line" | awk '{print $3}')
    monitorId=$(echo "$line" | awk '{print $2}')
    monitorName=$(bspc query -T -m $monitorId | jq -r .name)
    if [ "$monitorName" == "$ULTRA_WIDE_MONITOR" ]; then
        numberOfNodes=$(bspc query -N -n .local.tiled | wc -l)
        if [ $numberOfNodes == "1" ]; then
            padding $desktopId 30 1300 30 1300
        elif [ $numberOfNodes == "2" ]; then
            bsp-layout set even
            padding $desktopId 30 500 30 500
        elif [ $numberOfNodes == "3" ]; then
            bsp-layout set even
            padding $desktopId 30 30 30 30
        elif [ $numberOfNodes == "4" ]; then
            bsp-layout set even
            padding $desktopId 0 0 0 0
        fi
    fi
done
