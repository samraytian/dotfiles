# Bash $PATH

export PATH="$PATH:/usr/local/bin"

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:$HOME/Projects/flutter/bin"

if [[ $(uname -s) == 'Darwin' ]]; then
    export PATH="/usr/local/opt/bison/bin:$PATH"
fi

# TERM Color
export TERM=xterm-256color

# Oh-My-ZSH

export ZSH="$HOME/.oh-my-zsh"

export UPDATE_ZSH_DAYS=7

# ZSH_THEME="spaceship"

DISABLE_AUTO_TITLE="false"

ENABLE_CORRECTION="false"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Install zsh-autosuggestions & zsh-syntax-highlighting
#
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# 
plugins=(git tmux macos xcode autojump colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

# Theme for zsh-syntax-highlighting
# Dracula
# source $HOME/.config/zsh-syntax-highlighting-themes/dracula.yml

source $ZSH/oh-my-zsh.sh

# User Configurations

export LANG=en_US.UTF-8
export ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# alias

alias vim='nvim'
alias tree='tree -N'

alias vimzshrc='nvim ~/.zshrc'
alias vimyabairc='nvim ~/.config/yabai/yabairc'
alias vimskhdrc='nvim ~/.config/skhd/skhdrc'

alias codezshrc='code ~/.zshrc'
alias codeyabairc='code ~/.config/yabai/yabairc'
alias codeskhdrc='code ~/.config/skhd/skhdrc'

alias proxyon_clash='export https_proxy=http://127.0.0.1:7890; export http_proxy=http://127.0.0.1:7890; export all_proxy=socks5://127.0.0.1:7890'
alias proxyon_surge='export https_proxy=http://127.0.0.1:8888; export http_proxy=http://127.0.0.1:8888; export all_proxy=socks5://127.0.0.1:8889'
alias proxyoff='unset https_proxy; unset http_proxy; unset all_proxy'

fpath+=${ZDOTDIR:-~}/.zsh_functions

# fzf
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# thefuck
eval $(thefuck --alias)

# gitignore
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# starship
eval "$(starship init zsh)"
