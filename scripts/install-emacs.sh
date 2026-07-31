#!/usr/bin/env bash
set -euo pipefail

## =====================
## Install Emacs Plus
## =====================

EMACS_FORMULA="emacs-plus@31"

echo "Tapping d12frosted/emacs-plus..."
brew tap --trust d12frosted/emacs-plus

if brew list --versions "$EMACS_FORMULA" &>/dev/null; then
  echo "Reinstalling $EMACS_FORMULA..."
  # Answer "y" automatically if prompted to install dependencies
  yes | brew reinstall "$EMACS_FORMULA"
else
  echo "Installing $EMACS_FORMULA..."
  yes | brew install "$EMACS_FORMULA"
fi

echo "✅ $EMACS_FORMULA installed!"

EMACS_PREFIX="$(brew --prefix "$EMACS_FORMULA")"
echo "Copying Emacs apps to /Applications/..."
# Remove old versions first to avoid cp nesting instead of overwriting
rm -rf /Applications/Emacs.app "/Applications/Emacs Client.app"
cp -r "$EMACS_PREFIX/Emacs.app" /Applications/
cp -r "$EMACS_PREFIX/Emacs Client.app" /Applications/
echo "✅ Emacs apps copied!"
