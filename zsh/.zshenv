# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK="${ANDROID_HOME}"
export ANDROID_NDK="${ANDROID_HOME}/ndk-bundle"

export PATH="${PATH}:${ANDROID_HOME}/tools"
export PATH="${PATH}:${ANDROID_HOME}/platform-tools"
export PATH="${PATH}:${ANDROID_HOME}/tools/bin"
export PATH="${PATH}:${ANDROID_HOME}/emulator"

# Source rustup
if [[ -f "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
fi

# Homebrew
if [[ $(uname -s) == 'Darwin' ]]; then
    if [[ $(uname -m) == 'arm64' ]]; then
        eval $(/opt/homebrew/bin/brew shellenv)
    fi
fi

# Ruby & Gem
# export GEM_HOME="$HOME/.gem"
# export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
