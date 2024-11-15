#!/bin/bash

set -e

# if homwbrew is not installed, exit
[ -x "$(command -v brew)" ] || exit 1

# stow
[ -x "$(command -v stow)" ] || brew install stow

# bat
[ -x "$(command -v bat)" ] || brew install bat

# eza
[ -x "$(command -v eza)" ] || brew install eza

# zoxide
[ -x "$(command -v zoxide)" ] || brew install zoxide

# fd
[ -x "$(command -v fd)" ] || brew install fd

# fzf
[ -x "$(command -v fzf)" ] || brew install fzf

# gh
[ -x "$(command -v gh)" ] || brew install gh

# thefuck
[ -x "$(command -v thefuck)" ] || brew install thefuck

# neovim
[ -x "$(command -v nvim)" ] || brew install neovim

# starship
[ -x "$(command -v starship)" ] || brew install starship

# zsh-autosuggestions
[ -d "$(brew --prefix)/share/zsh-autosuggestions" ] || brew install zsh-autosuggestions

# zsh-syntax-highlighting
[ -d "$(brew --prefix)/share/zsh-syntax-highlighting" ] || brew install zsh-syntax-highlighting

PACKAGES=""
EXCLUDES=". .. .git icons"

for dir in */; do
  dir=${dir%/}
  if [[ ! "$EXCLUDES" =~ $dir ]]; then
    if [[ -z "$PACKAGES" ]]; then
      PACKAGES="$dir"
    else
      PACKAGES="$PACKAGES $dir"
    fi
  fi
done

stow --verbose --restow --target=$HOME --dir=. $PACKAGES --ignore='\.DS_Store'
