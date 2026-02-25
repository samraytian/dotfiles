# ====================
# Environment
# ====================
set -o emacs
setopt SHARE_HISTORY

LANG=en_US.UTF-8

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=20000
SAVEHIST=10000

export LESSHISTFILE="$XDG_STATE_HOME"/less/history

export PATH="$HOME/.dotfiles/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# ====================
# Alias
# ====================

# linux common tools
alias ls='eza'
alias la='eza -a --git'
alias ll='eza -al --git'
alias lla='eza -al --git --icons'
alias tree="eza --tree -a -I '.git|.vendor'"
alias cat='bat'

# git
alias gst='git status'
alias gaa='git add --all'
alias gco='git checkout'
alias gcmsg="git commit -m"
alias gca="git commit --amend --no-edit"
alias gcam="git commit --amend -m"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"

# ====================
# Editor
# ====================

export EDITOR='nvim'
export VISUAL="$EDITOR"

alias vim='nvim'

# ====================
# Utilities
# ====================

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit -d "$ZSH_COMPDUMP"
fi

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zoxide, a faster way to navigate your filesystem
eval "$(zoxide init zsh --cmd j)"

# fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# starship prompt
eval "$(starship init zsh)"

# codex
eval "$(codex completion zsh)"
