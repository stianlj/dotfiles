#!/usr/bin/env bash

COMPUTER=$1
CONFIG_FILE=$HOME/.config/i3/config

rm $CONFIG_FILE

for f in $HOME/.config/i3/config.d/*; do
  filename=$(basename "$f")
  extension="${filename##*.}"
  section=$(sed '/# vim:filetype=i3/d' $f)
  if [ $extension != 'work-laptop' ] && [ $extension != 'main-desktop' ]; then
    echo -e "\n# FROM: $filename\n$section" >> $CONFIG_FILE
  fi;
  if [ $extension = $COMPUTER ]; then
    echo -e "\n# FROM: $filename\n$section" >> $CONFIG_FILE
  fi;
done;
