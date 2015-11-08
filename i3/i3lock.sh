#!/bin/bash
scrot /tmp/screen_locked.png
convert /tmp/screen_locked.png -blur 3x3 /tmp/screen_locked2.png
i3lock -i /tmp/screen_locked2.png
