# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Homebrew (macOS)
if [[ $(uname -s) == 'Darwin' ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# Zsh
[[ -d "$XDG_STATE_HOME/zsh" ]] || mkdir -p "$XDG_STATE_HOME/zsh"
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"
export SHELL_SESSIONS_DISABLE=1
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"

# Bun
export BUN_INSTALL="$XDG_DATA_HOME/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Node.js
export npm_config_userconfig="$XDG_CONFIG_HOME/npm/config"
export npm_config_cache="$XDG_CACHE_HOME/npm"

# Python
if [ -d "$(brew --prefix python)/libexec/bin" ]; then
  export PATH="$(brew --prefix python)/libexec/bin:$PATH"
fi
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"

# Ruby
if [ -d "$(brew --prefix ruby)/bin" ]; then
  export PATH="$(brew --prefix ruby)/bin:$PATH"
  export PATH="$(gem environment gemdir)/bin:$PATH"
fi
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle/config"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
[[ -f "$CARGO_HOME/env" ]] && source "$CARGO_HOME/env"

# Android & Java
export ANDROID_HOME="$HOME/Library/Android/sdk"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"

# iOS / CocoaPods
export CP_HOME_DIR="$XDG_DATA_HOME/cocoapods"
export CP_CACHE_DIR="$XDG_CACHE_HOME/cocoapods"

# Flutter
export PUB_CACHE="$XDG_CACHE_HOME/pub-cache"
export PATH="$PUB_CACHE/bin:$PATH"

export FVM_CACHE_PATH="$XDG_CACHE_HOME/fvm"
export ANALYZER_STATE_LOCATION_OVERRIDE="$XDG_DATA_HOME/dartServer"

# AI Tools
export COPILOT_HOME="$XDG_CONFIG_HOME/copilot"
