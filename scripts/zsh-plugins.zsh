# Shared by .zshrc and install-zsh-plugins.sh.
# Bump the version when the plugin list changes so the installer can be rerun.
typeset -g DOTFILES_ZSH_PLUGINS_VERSION=1
typeset -ga DOTFILES_ZSH_PLUGINS=(
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  OMZP::git
  wfxr/forgit
)
