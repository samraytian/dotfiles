#!/bin/bash

## gh copilot alias upgrade

if ! command -v gh copilot &> /dev/null; then
  echo "gh copilot is not installed. Please install it first."
  exit 1
fi

GH_COPILOT_ALIAS_PATH=~/.config/zsh/source/gh-copilot-alias.zsh

if [ ! -f $GH_COPILOT_ALIAS_PATH ]; then
  touch $GH_COPILOT_ALIAS_PATH
fi

gh copilot alias -- zsh > $GH_COPILOT_ALIAS_PATH

echo "zsh integration upgraded!"
exit 0