#!/data/data/com.termux/files/usr/bin/bash -l

# Place this in ~/.termux/tasker/org-note.sh
# You may have to create the .termux/tasker directory

# Launches a capture template 'N' with the following variables available in the template:
# %:description - The title entered in the popup
# %i - The selected text

title=$(echo $1 | base64 --decode | jq -sRr @uri)
note=$(echo $2 | base64 --decode | jq -sRr @uri)
socketFile=/data/data/com.termux/files/usr/var/run/emacs10444/server

emacsclient \
    -s $socketFile \
    "org-protocol://capture?template=N&title=$title&body=$note"
