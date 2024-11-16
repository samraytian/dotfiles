#!/bin/bash

set -e

## gh copilot alias upgrade

if ! command -v gh &> /dev/null; then
  echo "gh is not installed. Install it with 'brew install gh'"
  brew install gh
fi

if ! command -v gh extension list | grep 'gh-copilot' &> /dev/null; then
  echo "gh copilot extension is not installed. Install it with 'gh extension install github/gh-copilot'"
  gh extension install github/gh-copilot
fi

GH_COPILOT_ALIAS_PATH=~/.config/zsh/source/gh-copilot-alias.zsh

if [ ! -f $GH_COPILOT_ALIAS_PATH ]; then
  touch $GH_COPILOT_ALIAS_PATH
fi

gh copilot alias -- zsh > $GH_COPILOT_ALIAS_PATH

echo "zsh integration upgraded!"
exit 0