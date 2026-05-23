#!/bin/bash

set -e

# zsh
stow -R -v zsh --target="$HOME"

# git
stow -R -v git --target="$HOME"

# starship
stow -R -v starship --target="$HOME"

# ghostty
stow -R -v ghostty --target="$HOME"

# rime
stow -R -v rime --target="$HOME"

# tmux
stow -R -v tmux --target="$HOME"