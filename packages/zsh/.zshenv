# Sourced by every zsh invocation, including non-interactive scripts:
# keep this file to fast, side-effect-free exports only.

# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Bun
export BUN_INSTALL="$XDG_DATA_HOME/bun"

# Node.js
export npm_config_userconfig="$XDG_CONFIG_HOME/npm/config"
export npm_config_cache="$XDG_CACHE_HOME/npm"

# Python
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export MPLCONFIGDIR="$XDG_CONFIG_HOME/matplotlib"

# Ruby
export GEM_HOME="$XDG_DATA_HOME/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle/config"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle"

# Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# iOS / CocoaPods
export CP_HOME_DIR="$XDG_DATA_HOME/cocoapods"
export CP_CACHE_DIR="$XDG_CACHE_HOME/cocoapods"

# Flutter
export PUB_CACHE="$XDG_CACHE_HOME/pub-cache"
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
export FVM_CACHE_PATH="$XDG_CACHE_HOME/fvm"
export ANALYZER_STATE_LOCATION_OVERRIDE="$XDG_DATA_HOME/dartServer"

# AI Tools
export COPILOT_HOME="$XDG_CONFIG_HOME/copilot"
