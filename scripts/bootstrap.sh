#!/bin/bash

set -euo pipefail

## =====================
## Xcode Command Line Tools
## =====================
if [[ "$(uname)" == "Darwin" ]]; then
  if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    # Wait until the Xcode Command Line Tools are installed
    until xcode-select -p &>/dev/null; do
      sleep 5
    done
    echo "Xcode Command Line Tools installed."
  else
    echo "✅ Xcode Command Line Tools already installed"
  fi
fi

## =====================
## Install Homebrew
## =====================

# Check if Homebrew is installed, if not install it
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew already installed"
fi

# Ensure brew is on PATH for this session (Apple Silicon: /opt/homebrew, Intel: /usr/local)
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

brew analytics off
brew update

## =====================
## Git Credential Manager
## =====================

if ! brew list --cask git-credential-manager &>/dev/null; then
  echo "Installing Git Credential Manager..."
  brew install --cask git-credential-manager
else
  echo "✅ Git Credential Manager already installed"
fi

echo "Configuring Git Credential Manager..."
git-credential-manager configure

echo "✅ Git Credential Manager configured"

## =====================
## Clone dotfiles repository
## =====================

if [ ! -d "$HOME/dotfiles" ]; then
  echo "Cloning dotfiles repository..."
  git clone https://github.com/samraytian/dotfiles.git "$HOME/dotfiles"
else
  echo "Dotfiles repository already cloned, pulling latest..."
  pushd "$HOME/dotfiles" >/dev/null || exit 1
  git remote set-url origin https://github.com/samraytian/dotfiles.git
  if [ -z "$(git status --porcelain)" ]; then
    git pull origin main
  else
    echo "⚠️ Local changes detected, skipping git pull to avoid conflicts."
  fi
  popd >/dev/null || exit 1
fi

echo "Setting up symlinks for dotfiles..."
"$HOME/dotfiles/dots" install

## =====================
## Install packages from Brewfile
## =====================
BREWFILE="$HOME/dotfiles/scripts/Brewfile"

if [ -f "$BREWFILE" ]; then
  echo "Installing packages from Brewfile..."
  brew bundle --file="$BREWFILE"
else
  echo "No Brewfile found, skipping package installation."
fi

## =====================
## MacOS settings
## =====================
if [[ "$(uname)" == "Darwin" ]]; then
  echo "Applying macOS defaults..."
  "$HOME/dotfiles/scripts/macos-defaults.sh"

  echo "Installing AI tools..."
  "$HOME/dotfiles/scripts/install-ai-tools.sh"

  echo "Installing Emacs..."
  "$HOME/dotfiles/scripts/install-emacs.sh"
fi

echo "✅ Dotfiles installation complete!"
