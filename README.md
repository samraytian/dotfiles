# dotfiles

Sam's dotfiles managed with `stow`.

## Usage

To use these dotfiles, clone the repository and run `stow` for the desired directories. For example:

```bash
git clone git@github.com:samraytian/dotfiles.git ~/.dotfiles

cd ~/.dotfiles

stow -v -S \
  ghostty \
  karabiner \
  kitty \
  git \
  starship \
  yazi \
  zsh
```

This will create symlinks in your home directory for the specified configurations.
