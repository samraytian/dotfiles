#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Emacs Client
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ./icons/emacs-elrumo2-64.png
# @raycast.packageName emacsclient

# Documentation:
# @raycast.description Open emacsclient frame.
# @raycast.author samraytain
# @raycast.authorURL https://raycast.com/samraytain

# Check if emacs server is running
SERVER_IS_RUNNING=$(emacsclient -e '(daemonp)' 2> /dev/null || echo nil)

# Checi if emacs frame exists
FRAME_EXISTS=$(emacsclient -e '(display-graphic-p)' 2> /dev/null || echo nil)

function active_emacs_frame() {
    osascript -e 'tell application "Emacs" to activate'
}

if [ -n "$(pgrep Emacs)" ]; then
    active_emacs_frame
    exit 0
fi

if [ "$SERVER_IS_RUNNING" = "t" ]; then
    if [ "$FRAME_EXISTS" = "nil" ]; then
        emacsclient -c -n "$@"
    fi
    active_emacs_frame
    exit 0
fi

# Fallback to open Emacs.app
open -a Emacs.app
