set -o emacs

# ====================
# Environment
# ====================
LANG=en_US.UTF-8

export TERMINFO=/usr/share/terminfo/
export LESSHISTFILE="$XDG_STATE_HOME"/less/history

# ====================
# History
# ====================
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=20000  # 当前会话内存中保留的历史条数
SAVEHIST=20000  # 写入 HISTFILE 持久化的历史条数（与 HISTSIZE 保持一致，避免退出时被截断）

# 过滤掉首个词不是已知命令的条目（避免 typo 进入历史）
zshaddhistory() {
  whence ${${(z)1}[1]} >/dev/null || return 1
}

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS    # 新条目会删除旧的相同条目
setopt HIST_SAVE_NO_DUPS       # 保存到文件时去重
setopt HIST_FIND_NO_DUPS       # 搜索时不显示重复
setopt HIST_REDUCE_BLANKS      # 去除多余空格

# ====================
# Alias
# ====================

# linux common tools
alias ls='eza .'
alias la='eza . -a --git'
alias ll='eza . -la --git'
alias tree="eza . --tree -a -I '.git|.vendor'"
alias cat='bat'

# git
alias gst='git status'
alias gaa='git add --all'
alias gco='git checkout'
alias gcmsg="git commit -m"
alias gca="git commit --amend --no-edit"
alias gcam="git commit --amend -m"

# ====================
# Editor
# ====================

export EDITOR='nvim'
export VISUAL="$EDITOR"

alias vi='nvim'
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

# codex completions
eval "$(codex completion zsh)"

# bun completions
[ -s "/Users/samray/.local/share/bun/_bun" ] && source "/Users/samray/.local/share/bun/_bun"
