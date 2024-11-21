# ====================
# Environment
# ====================
setopt SHARE_HISTORY

[[ -d "$XDG_STATE_HOME/zsh" ]] || mkdir -p "$XDG_STATE_HOME/zsh"
[[ -d "$XDG_CACHE_HOME/zsh" ]] || mkdir -p "$XDG_CACHE_HOME/zsh"

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=20000
SAVEHIST=10000

export LESSHISTFILE="$XDG_STATE_HOME"/less/history

# ====================
# Alias
# ====================

# linux common tools
alias ls='eza'
alias ll='eza -l --git --icons'
alias la='eza -al --git --icons'
alias tree='eza --tree'
alias cat='bat'

# git
alias gst='git status'
alias gaa='git add --all'
alias gco='git checkout'
alias gcmsg='git commit -m'
alias gla='git log --graph'
alias glo='git log --pretty=oneline'
alias glao='git log --graph --pretty=oneline'

# ====================
# Editor
# ====================

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export VISUAL="$EDITOR"

# nvim
# alias vim="nvim" # default Neovim
alias vim="NVIM_APPNAME=lazyvim nvim" # LazyVim

vv() {
  select config in lazyvim kickstart nvchad astrovim lunarvim
  do NVIM_APPNAME=$config nvim $@; break; done
}

# emacs
brew_emacs_service=""

function emacs-service-start() {
  if [[ "$(uname)" == "Darwin" ]]; then
    if [[ -z "$brew_emacs_service" ]]; then
      brew_emacs_service="$(brew services list | grep emacs | awk '{print $1}')"
    fi
    brew services start $brew_emacs_service
  else
    emacs --daemon
  fi
}

function emacs-service-stop() {
  if [[ "$(uname)" == "Darwin" ]]; then
    if [[ -z "$brew_emacs_service" ]]; then
      brew_emacs_service="$(brew services list | grep emacs | awk '{print $1}')"
    fi
    brew services stop $brew_emacs_service
  else
    emacsclient -e "(kill-emacs)"
  fi
}

function emacs-service-restart() {
  emacs-service-stop
  emacs-service-start
}

alias ec="emacsclient -c -n"
alias et="emacsclient -t"

# ====================
# Utilities
# ====================

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# gitignore
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# starship prompt
eval "$(starship init zsh)"

# zoxide, a faster way to navigate your filesystem
eval "$(zoxide init zsh --cmd j)"

# fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# the fuck alias
eval $(thefuck --alias)

# gh copilot alias
source ~/.config/zsh/source/gh-copilot-alias.zsh

