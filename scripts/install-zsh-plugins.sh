#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
ZINIT_HOME="$DATA_HOME/zinit/zinit.git"
PLUGIN_MARKER="$DATA_HOME/zsh/dotfiles-plugins-installed"
PLUGIN_SPEC="$DOTFILES_DIR/scripts/zsh-plugins.zsh"
PLUGIN_VERSION=1

if ! command -v git >/dev/null 2>&1; then
  echo "git is required to install zsh plugins." >&2
  exit 1
fi

if ! command -v zsh >/dev/null 2>&1; then
  echo "zsh is required to install zsh plugins." >&2
  exit 1
fi

if [[ ! -r "$PLUGIN_SPEC" ]]; then
  echo "Plugin specification not found: $PLUGIN_SPEC" >&2
  exit 1
fi

if [[ ! -r "$ZINIT_HOME/zinit.zsh" ]]; then
  if [[ -e "$ZINIT_HOME/.git" ]]; then
    echo "Existing zinit checkout is incomplete: $ZINIT_HOME" >&2
    exit 1
  fi

  mkdir -p "$(dirname "$ZINIT_HOME")"
  echo "Installing zinit..."
  git clone --depth=1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

echo "Installing zsh plugins..."
ZINIT_HOME="$ZINIT_HOME" PLUGIN_SPEC="$PLUGIN_SPEC" zsh -f -c '
  emulate -L zsh
  setopt errexit
  source "$ZINIT_HOME/zinit.zsh"
  source "$PLUGIN_SPEC"
  zinit ice cloneonly
  zinit light-mode for "${DOTFILES_ZSH_PLUGINS[@]}"
'

mkdir -p "$(dirname "$PLUGIN_MARKER")"
printf '%s\n' "$PLUGIN_VERSION" > "$PLUGIN_MARKER"
echo "✅ Zsh plugins installed"
