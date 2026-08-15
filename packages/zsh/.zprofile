# Login shells only. PATH assembly and anything that spawns subprocesses
# (brew, gem) or touches the filesystem stays here; pure exports live in
# ~/.zshenv, which is sourced before this file.

# Homebrew (macOS)
if [[ $(uname -s) == 'Darwin' ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# Zsh
[[ -d "$XDG_STATE_HOME/zsh" ]] || mkdir -p "$XDG_STATE_HOME/zsh"
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"

# Bun
export PATH="$BUN_INSTALL/bin:$PATH"

# Python
if [ -d "$(brew --prefix python)/libexec/bin" ]; then
  export PATH="$(brew --prefix python)/libexec/bin:$PATH"
fi

# Ruby
if [ -d "$(brew --prefix ruby)/bin" ]; then
  export PATH="$(brew --prefix ruby)/bin:$PATH"
  export PATH="$(gem environment gemdir)/bin:$PATH"
fi

# Rust
[[ -f "$CARGO_HOME/env" ]] && source "$CARGO_HOME/env"

# Android & Java
export ANDROID_HOME="$HOME/Library/Android/sdk"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"

# Flutter
export PATH="$PUB_CACHE/bin:$PATH"

# Secrets: export API keys for AI completion and other tools.  Also sourced
# by .zshrc for interactive shells; keeping it here ensures non-interactive
# login shells (e.g. Emacs' exec-path-from-shell) can read them too, without
# exposing them to every zsh script via .zshenv.
[ -f "$HOME/dotfiles/.secrets" ] && source "$HOME/dotfiles/.secrets"
