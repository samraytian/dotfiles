#!/bin/bash

# Check if gh copilot is installed
if ! command -v gh copilot &> /dev/null; then
  echo "gh copilot is not installed. Please install it first."
  exit 1
fi

# Define the path to the gh copilot alias
GH_COPILOT_ALIAS_PATH=~/.config/zsh/source/gh-copilot-alias.zsh

# Check if the gh copilot alias file exists
if [ ! -f $GH_COPILOT_ALIAS_PATH ]; then
  echo "gh copilot alias file not found. Creating it..."
  touch $GH_COPILOT_ALIAS_PATH
fi

echo "Upgrading gh copilot alias..."
gh copilot alias -- zsh > $GH_COPILOT_ALIAS_PATH
echo "gh copilot alias upgraded!"

exit 0
