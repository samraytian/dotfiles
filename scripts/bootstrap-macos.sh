#!/bin/bash

set -e

# if homwbrew is not installed, exit
[ -x "$(command -v brew)" ] || exit 1

# stow
[ -x "$(command -v stow)" ] || brew install stow

# tmux
[ -x "$(command -v tmux)" ] || brew install tmux

# bat, an cat clone with syntax highlighting and Git integration
[ -x "$(command -v bat)" ] || brew install bat

# eza, a replacement for ls
[ -x "$(command -v eza)" ] || brew install eza

# ripgrep, a line-oriented search tool that recursively searches the current directory for a regex pattern
[ -x "$(command -v rg)" ] || brew install ripgrep

# fd, a simple, fast and user-friendly alternative to find
[ -x "$(command -v fd)" ] || brew install fd

# fzf, a command-line fuzzy finder
[ -x "$(command -v fzf)" ] || brew install fzf

# zoxide, a smarter cd command
[ -x "$(command -v zoxide)" ] || brew install zoxide

# tree-sitter and tree-sitter-cli
[ -x "$(command -v tree-sitter)" ] || brew install tree-sitter
[ -x "$(command -v tree-sitter-cli)" ] || brew install tree-sitter-cli

# gh
[ -x "$(command -v gh)" ] || brew install gh

# thefuck
[ -x "$(command -v thefuck)" ] || brew install thefuck

# starship
[ -x "$(command -v starship)" ] || brew install starship

# git-flow
[ -x "$(command -v git-flow)" ] || brew install git-flow

# zsh-completions
[ -d "$(brew --prefix)/share/zsh-completions" ] || brew install zsh-completions

# zsh-autosuggestions
[ -d "$(brew --prefix)/share/zsh-autosuggestions" ] || brew install zsh-autosuggestions

# zsh-syntax-highlighting
[ -d "$(brew --prefix)/share/zsh-syntax-highlighting" ] || brew install zsh-syntax-highlighting
