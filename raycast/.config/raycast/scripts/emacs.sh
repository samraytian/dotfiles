#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Emacs
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./icons/emacs-elrumo2-64.png
# @raycast.packageName Samray Scripts

# Documentation:
# @raycast.description Open emacsclient frame while emacs is in daemon mode, otherwise launch Emacs app instead.
# @raycast.author samraytain
# @raycast.authorURL https://raycast.com/samraytain

# Check if emacs server is running
SERVER_IS_RUNNING=$(emacsclient -e '(daemonp)' 2> /dev/null || echo nil)

# Checi if emacs frame exists
FRAME_EXISTS=$(emacsclient -e '(display-graphic-p)' 2> /dev/null || echo nil)

function active_emacs_frame() {
    osascript -e 'tell application "Emacs" to activate'
}

if [ "$SERVER_IS_RUNNING" = "t" ]; then
    if [ "$FRAME_EXISTS" = "nil" ]; then
        emacsclient -c -n "$@"
    fi
    active_emacs_frame
    exit 0
fi

if [ -n "$(pgrep Emacs)" ]; then
    active_emacs_frame
else
    open -a /opt/homebrew/opt/emacs-plus@29/Emacs.app
fi
