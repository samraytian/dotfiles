#!/bin/bash

set -e

# Check brew bundle
if ! command -v brew &>/dev/null; then
  echo "Homebrew is not installed. Please install it first."
  exit 1
fi

brew bundle check --file="$HOME/dotfiles/scripts/Brewfile" --verbose || {
  exit 1
}
