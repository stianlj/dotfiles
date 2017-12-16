#!/usr/bin/env sh

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

# polybar singlebar -l info
polybar left &
polybar middle &
polybar right &
