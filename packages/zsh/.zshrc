set -o emacs

# ====================
# Environment
# ====================
LANG=en_US.UTF-8

export SHELL_SESSIONS_DISABLE=1
export ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

export TERMINFO=/usr/share/terminfo/
export LESSHISTFILE="$XDG_STATE_HOME"/less/history

[ -f "$HOME/dotfiles/.secrets" ] && source "$HOME/dotfiles/.secrets"

# ====================
# History
# ====================
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=20000  # number of history entries kept in memory for the current session
SAVEHIST=20000  # number of history entries persisted to HISTFILE (keep in sync with HISTSIZE to avoid truncation on exit)

# Drop entries whose first word is not a known command (avoid typos entering history)
zshaddhistory() {
  whence ${${(z)1}[1]} >/dev/null || return 1
}

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS    # new entries delete older duplicates
setopt HIST_SAVE_NO_DUPS       # deduplicate when saving to file
setopt HIST_FIND_NO_DUPS       # don't show duplicates when searching
setopt HIST_REDUCE_BLANKS      # strip excess whitespace

# ====================
# Alias
# ====================

# linux common tools
alias ls='eza'
alias la='eza -a --git'
alias ll='eza -la --git'
alias tree="eza --tree -a -I '.git|.vendor'"
alias cat='bat'

# ====================
# Editor
# ====================

# Use neovim as the default editor; fall back to vim if not available
if (( $+commands[nvim] )); then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi
export VISUAL="$EDITOR"

alias vi='nvim'
alias vim='nvim'

# ====================
# Plugins
# ====================

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice wait"0" lucid

zinit light-mode for \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    OMZP::git \
    wfxr/forgit

# ====================
# Utilities
# ====================

if type brew &>/dev/null; then
	FPATH="$HOMEBREW_PREFIX/share/zsh-completions:$FPATH"
	autoload -Uz compinit
	compinit -d "$ZSH_COMPDUMP"
fi

# zoxide, a faster way to navigate your filesystem
eval "$(zoxide init zsh --cmd j)"

# fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# starship prompt
eval "$(starship init zsh)"

# codex completions
eval "$(codex completion zsh)"

# bun completions
[ -s "/Users/samray/.local/share/bun/_bun" ] && source "/Users/samray/.local/share/bun/_bun"
