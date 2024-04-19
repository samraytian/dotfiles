#!/bin/bash

## Starship prompt upgrade

if ! command -v starship &> /dev/null; then
  echo "Starship is not installed. Please install it first."
  exit 1
fi

STARSHIP_PROMPT_PATH=~/.config/zsh/source/starship-prompt.zsh

if [ ! -f $STARSHIP_PROMPT_PATH ]; then
  touch $STARSHIP_PROMPT_PATH
fi

starship init zsh > $STARSHIP_PROMPT_PATH

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

echo "zshrc source files upgraded!"
exit 0