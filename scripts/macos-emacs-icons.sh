#!/bin/bash

set -euo pipefail

echo "Change Emacs icons..."
if command -v fileicon &>/dev/null; then
  if [ -d "/Applications/Emacs.app" ]; then
    fileicon set /Applications/Emacs.app "$HOME/dotfiles/assets/icons/emacs-curvy-3d.icns"
  fi
  if [ -d "/Applications/Emacs Client.app" ]; then
    fileicon set /Applications/Emacs\ Client.app "$HOME/dotfiles/assets/icons/emacs-curvy-3d.icns"
  fi
else
  echo "fileicon not found, skipping Emacs icon change."
fi
