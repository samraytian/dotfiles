# ====================
# Oh-My-ZSH
# ====================

set -o emacs

export LANG=en_US.UTF-8
export TERM=xterm-256color
export LESSHISTFILE=-

# Install zsh-autosuggestions & zsh-syntax-highlighting
#
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# 
plugins=(
    git 
    gitignore 
    tmux 
    macos 
    xcode 
    extract 
    autojump 
    colored-man-pages 
    zsh-autosuggestions 
    zsh-syntax-highlighting)

export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=7

DISABLE_AUTO_TITLE="false"
ENABLE_CORRECTION="false"
DISABLE_UNTRACKED_FILES_DIRTY="true"

fpath+=${ZDOTDIR:-~}/.zsh_functions

source $ZSH/oh-my-zsh.sh

# ====================
# Editor
# ====================

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export VISUAL="$EDITOR"

# ====================
# Alias
# ====================

# linux common tools
alias ls='exa'
alias ll='exa -al --git --icons'
alias tree='exa --tree'
alias cat='bat'

# git
alias gst='git status'
alias gaa='git add --all'
alias gco='git checkout'
alias gcmsg='git commit -m'
alias gla='git log --graph'
alias glo='git log --pretty=oneline'
alias glao='git log --graph --pretty=oneline'

# vim
alias vim="nvim"

# emacs
brew_emacs_service=""

function emacsd() {
  if [[ "$(uname)" == "Darwin" ]]; then
    if [[ -z "$brew_emacs_service" ]]; then
      brew_emacs_service="$(brew services list | grep emacs | awk '{print $1}')"
    fi
    brew services start $brew_emacs_service
  else
    emacs --daemon
  fi
}

function emacsd-stop() {
  if [[ "$(uname)" == "Darwin" ]]; then
    if [[ -z "$brew_emacs_service" ]]; then
      brew_emacs_service="$(brew services list | grep emacs | awk '{print $1}')"
    fi
    brew services stop $brew_emacs_service
  else
    emacsclient -e "(kill-emacs)"
  fi
}

function emacsd-restart() {
  emacsd-stop
  emacsd
}

alias ec="emacsclient -c -n"
alias et="emacsclient -t"

# ====================
# Utilities
# ====================

# gitignore
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# starship
eval "$(starship init zsh)"
