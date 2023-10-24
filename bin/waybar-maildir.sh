#!/usr/bin/env bash
#
# Curtesy of fauxmight: https://codeberg.org/fauxmight/waybar-maildir/src/branch/master/waybar-maildir.sh
#
# waybar-maildir.sh - count messages in a maildir (or other) directory
#
# USAGE: waybar-maildir.sh DIRECTORY ACCOUNT_NAME [nonotify]
#        "nonotify" is used to prevent multiple identical notification when this script is used in multi-monitor setups
#
# REQUIREMENTS: inotifywait
#               mu - to collect full 'Subject' line

mail_dir="${1}"
account_name="${2}"
notify_icon_path="/usr/share/icons/Papirus/symbolic/actions/mail-message-new-symbolic.svg"
notify_command='notify-send -i $notify_icon_path "${count} ny(e) e-post til ${account_name}" "$subject\nFra: $from"'
interval=30

old_count=0

while [[ -n "$(pgrep waybar)" ]]; do
  subject="SUBJECT UNAVAILABLE"
  if [[ ! -d "$mail_dir" ]]; then
    printf -- '{"text":"?"}\n'
    sleep "$interval"
  fi

  count="$(ls "$mail_dir" | wc -l)"

  if [[ "$count" > 0 ]]; then
    printf -- '{"text":"%s","class":"newmail","tooltip":"%s"}\n' "$count" "$account_name"
  else
    unset latest_message_file
    printf -- '{"text":"0","tooltip":"%s"}\n' "$account_name"
  fi

  if [[ ("${3}" != "nonotify") && ("$count" > "$old_count") ]]; then
    latest_message_file="$mail_dir"/$(ls -t "$mail_dir" | head -n1)
    subject=$(mu view "$latest_message_file" | grep '^Subject: ' | sed -e 's/^Subject: //')
    from=$(mu view "$latest_message_file" | grep '^From: ' | sed -e 's/^From: //')
    eval "$notify_command"
  fi

  old_count="$count"

  inotifywait -t "$interval" -qq -e 'create,delete,move' "$mail_dir"
  sleep 1 # Allow directory to settle after new messages

done

unset -v account_name count latest_file mail_dir nonotify notify_command old_count subject
