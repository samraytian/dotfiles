#!/bin/bash

set -e

# zsh
stow -R -v zsh --target="$HOME"

# git
if [ -f "$HOME/.gitconfig" ]; then
  rm "$HOME/.gitconfig"
fi
if [ -f "$HOME/.gitignore" ]; then
  rm "$HOME/.gitignore"
fi
ln -s "$HOME/.dotfiles/git/.gitconfig" "$HOME/.gitconfig"
ln -s "$HOME/.dotfiles/git/.gitignore" "$HOME/.gitignore"

# starship
stow -R -v starship --target="$HOME"

# ghostty
stow -R -v ghostty --target="$HOME"