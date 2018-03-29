#!/usr/bin/env sh

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

# polybar singlebar -l info
polybar middle-$COMPUTER_IDENTIFIER &
if [ $COMPUTER_IDENTIFIER = "main-desktop" ]; then
  polybar right &
  polybar left &
fi
