# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Zsh
[[ -d "$XDG_STATE_HOME/zsh" ]] || mkdir -p "$XDG_STATE_HOME/zsh"
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"

export SHELL_SESSIONS_DISABLE=1
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"

# Flutter
export FLUTTER_ROOT="$HOME/dev/sdk/flutter"
export PATH="$FLUTTER_ROOT/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"

# FVM
export FVM_CACHE_PATH="$XDG_CACHE_HOME/fvm"

# Android & JAVA
export ANDROID_HOME="$HOME/Library/Android/sdk"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"

export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

if [[ -f "$CARGO_HOME/env" ]]; then
  source "$CARGO_HOME/env"
fi

# Ruby
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
