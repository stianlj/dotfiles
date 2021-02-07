#!/data/data/com.termux/files/usr/bin/bash -l

# Place this in ~/.termux/boot/emacs-service.sh
# You may have to create the .termux/boot directory

# This file will load emacs when the phone boots and have
# it running in the background. Must install Termux:Boot.

emacs --daemon

# I'm actually unsatisfied with this because the daemon sometimes hangs,
# and won't accept new clients but won't die. You'll have to kill
# it manually if a notification shows up for a long time that says 'Termux (x tasks)'.
# That means one or more of the captures couldn't connect to the daemon.
