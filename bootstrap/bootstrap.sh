#!/bin/bash

set -euo pipefail

## =====================
## Check for ssh key
## =====================

if [ ! -f "$HOME/.ssh/github_ed25519" ]; then
  echo "No SSH key found for GitHub. Please generate one and add it to your GitHub account."
  echo "You can generate an SSH key with the following command:"
  echo "ssh-keygen -t ed25519 -C 'samray.tian@gmail.com' -f \$HOME/.ssh/github_ed25519"
  exit 1
fi

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
## Clone dotfiles repository
## =====================

if [ ! -d "$HOME/dotfiles" ]; then
  echo "Cloning dotfiles repository..."
  git clone git@github.com:samraytian/dotfiles.git "$HOME/dotfiles"
else
  echo "Dotfiles repository already cloned, pulling latest..."
  pushd "$HOME/dotfiles" >/dev/null || exit 1
  if [ -z "$(git status --porcelain)" ]; then
    git pull origin main
  else
    echo "⚠️  Local changes detected, skipping git pull to avoid conflicts."
  fi
  popd >/dev/null || exit 1
fi

echo "Setting up symlinks for dotfiles..."
chmod +x "$HOME/dotfiles/dots"
"$HOME/dotfiles/dots" install

## =====================
## Install packages from Brewfile 
## =====================
BREWFILE="$HOME/dotfiles/bootstrap/Brewfile"

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
  echo "Applying macOS settings..."
  chmod +x "$HOME/dotfiles/bootstrap/setup-macos.sh"
  "$HOME/dotfiles/bootstrap/setup-macos.sh"
fi

echo "✅ Dotfiles installation complete!"
