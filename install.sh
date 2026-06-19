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
  brew analytics off
  brew update
else
  echo "✅ Homebrew already installed"
fi

## =====================
## Clone dotfiles repository
## =====================

if [ ! -d "$HOME/dotfiles" ]; then
  echo "Cloning dotfiles repository..."
  git clone git@github.com:samraytian/dotfiles.git "$HOME/dotfiles"
else
  echo "✅ Dotfiles repository already cloned, pulling latest..."
  cd "$HOME/dotfiles" && git pull origin main
fi

# Navigate to dotfiles directory and stow configurations
echo "Stowing dotfiles configurations..."
cd "$HOME/dotfiles" || exit 1

stow -R -t "$HOME" ghostty git rime starship tmux zsh

## =====================
## Install packages from Brewfile 
## =====================

pushd "$HOME/dotfiles" || exit 1
if [ -f "Brewfile" ]; then
  echo "Installing packages from Brewfile..."
  brew bundle --file="Brewfile"
else
  echo "No Brewfile found, skipping package installation."
fi
popd || exit 1

## =====================
## MacOS settings
## =====================

echo "Set key repeat rate and delay..."
defaults write NSGlobalDomain KeyRepeat -int 1         # Set a blazingly fast key repeat rate
defaults write NSGlobalDomain InitialKeyRepeat -int 10 # Shorten the delay before the repeat starts

# Disable the press-and-hold character menu (allows keys to repeat instead)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo "Set trackpad and mouse tracking speed..."
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2 # 设置触控板的跟踪速度，数值越大速度越快
defaults write NSGlobalDomain com.apple.mouse.scaling -float 2    # 设置鼠标的跟踪速度，数值越大速度越快

echo "Enable trackpad tap to click..."
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Enable trackpad three-finger drag..."
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

echo "Disable CursorUIViewService to prevent cursor lag and memory leak..."
sudo defaults write /Library/Preferences/FeatureFlags/Domain/UIKit.plist redesigned_text_cursor -dict-add Enabled -bool NO

killall Dock &>/dev/null || true

echo "✅ Dotfiles installation complete!"
