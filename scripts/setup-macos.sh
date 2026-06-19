#!/bin/bash

set -euo pipefail

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