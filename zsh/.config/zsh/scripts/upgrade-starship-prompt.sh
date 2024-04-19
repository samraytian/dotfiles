#!/bin/bash

# Check if starship is installed
if ! command -v starship &> /dev/null; then
  echo "Starship is not installed. Please install it first."
  exit 1
fi

# Define the path to the starship prompt
STARSHIP_PROMPT_PATH=~/.config/zsh/functions/starship-prompt.zsh

# Check if the starship prompt file exists
if [ ! -f $STARSHIP_PROMPT_PATH ]; then
  echo "Starship prompt file not found. Creating a new one..."
  mkdir -p ~/.config/zsh/functions
  touch $STARSHIP_PROMPT_PATH
fi

starship init zsh > $STARSHIP_PROMPT_PATH
echo "Starship prompt upgraded!"
exit 0
