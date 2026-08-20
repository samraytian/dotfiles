# Login shells only. PATH assembly and anything that spawns subprocesses
# (brew, gem) or touches the filesystem stays here; pure exports live in
# ~/.zshenv, which is sourced before this file.

# Homebrew (macOS)
if [[ $(uname -s) == 'Darwin' ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Neovim runtime path; lua-language-server auto-loads it via VIMRUNTIME
export VIMRUNTIME="$(nvim -u NONE -i NONE --headless +'lua io.write(vim.env.VIMRUNTIME)' +qa)"

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# Zsh
[[ -d "$XDG_STATE_HOME/zsh" ]] || mkdir -p "$XDG_STATE_HOME/zsh"
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"

# Bun
export PATH="$BUN_INSTALL/bin:$PATH"

# Python
python_libexec="$(brew --prefix python)/libexec/bin"
if [ -d "$python_libexec" ]; then
  export PATH="$python_libexec:$PATH"
fi

# Ruby
ruby_bin="$(brew --prefix ruby)/bin"
if [ -d "$ruby_bin" ]; then
  export PATH="$ruby_bin:$PATH"
  gem_bin="$(gem environment gemdir)/bin"
  export PATH="$gem_bin:$PATH"
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
