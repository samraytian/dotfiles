# XDG Base Directory
[[ -z "$XDG_CONFIG_HOME" ]] && export XDG_CONFIG_HOME="$HOME/.config"
[[ -z "$XDG_CACHE_HOME" ]] && export XDG_CACHE_HOME="$HOME/.cache"
[[ -z "$XDG_DATA_HOME" ]] && export XDG_DATA_HOME="$HOME/.local/share"
[[ -z "$XDG_STATE_HOME" ]] && export XDG_STATE_HOME="$HOME/.local/state"

# Zsh
[[ -d "$XDG_STATE_HOME/zsh" ]] || mkdir -p "$XDG_STATE_HOME/zsh"
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"

# Node.js
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

# Flutter
export PATH=$HOME/Developer/flutter/bin:$PATH
export PATH="$HOME/.pub-cache/bin:$PATH"

# FVM
export PATH="$HOME/.fvm_flutter/bin:$PATH"
export FVM_CACHE_PATH="$XDG_CACHE_HOME/fvm"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

if [[ -f "$CARGO_HOME/env" ]]; then
  source "$CARGO_HOME/env"
fi

# Ruby
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
