#!/bin/bash

set -e

[ -x "$(command -v brew)" ] || exit 1

packages=(
  "stow"
  "tmux"
  "bat"
  "eza"
  "cmake"
  "ripgrep"
  "fd"
  "fzf"
  "zoxide"
  "shellcheck"
  "tree-sitter"
  "tree-sitter-cli"
  "gh"
  "git-flow"
  "thefuck"
  "starship"
  "zsh-completions"
  "zsh-autosuggestions"
  "zsh-syntax-highlighting"
)

for package in "${packages[@]}"; do
  [ -x "$(command -v "$package")" ] || brew install "$package"
done
