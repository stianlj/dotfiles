#!/data/data/com.termux/files/usr/bin/bash -l

# Place this in ~/.termux/tasker/org-link.sh
# You may have to create the .termux/tasker directory

# Launches a capture template 'L' with the following variables available in the template:
# %:link - The url of the webpage being shared
# %:description - The title of the webpage
# %:annotation - An org link built from the above two variables
# %i - Any notes entered in the popup

url=$(echo $1 | base64 --decode | grep -o "\S*://\S*" | tr -d "\n" | jq -sRr @uri)
title=$(echo $2 | base64 --decode | jq -sRr @uri)
notes=$(echo $3 | base64 --decode | jq -sRr @uri)
socketFile=/data/data/com.termux/files/usr/var/run/emacs10444/server

emacsclient \
    -s $socketFile \
    "org-protocol://capture?template=L&url=$url&title=$title&body=$notes"

