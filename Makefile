.DEFAULT_GOAL := help

PKG_DIR := $(CURDIR)/packages
HOME_PKGS := git zsh

.PHONY: help link unlink check-stow

help:
	@printf '%s\n' 'Usage: make <target>' '' 'Targets:' '  link    Create dotfile symlinks' '  unlink  Remove dotfile symlinks'

check-stow:
	@command -v stow >/dev/null 2>&1 || { echo 'GNU Stow is required; install it with: brew install stow' >&2; exit 1; }

link: check-stow
	@mkdir -p "$(HOME)/.config/ghostty" "$(HOME)/.config/tmux"
	@stow --dir="$(PKG_DIR)" --target="$(HOME)" --restow $(HOME_PKGS)
	@stow --dir="$(PKG_DIR)" --target="$(HOME)/.config/ghostty" --restow ghostty
	@stow --dir="$(PKG_DIR)" --target="$(HOME)/.config/tmux" --restow tmux
	@stow --dir="$(PKG_DIR)" --target="$(HOME)/.config" --restow starship
	@echo '✅ Dotfiles symlinks created'

unlink: check-stow
	@stow --dir="$(PKG_DIR)" --target="$(HOME)" --delete $(HOME_PKGS)
	@if [ -d "$(HOME)/.config/ghostty" ]; then stow --dir="$(PKG_DIR)" --target="$(HOME)/.config/ghostty" --delete ghostty; fi
	@if [ -d "$(HOME)/.config/tmux" ]; then stow --dir="$(PKG_DIR)" --target="$(HOME)/.config/tmux" --delete tmux; fi
	@if [ -d "$(HOME)/.config" ]; then stow --dir="$(PKG_DIR)" --target="$(HOME)/.config" --delete starship; fi
	@echo '✅ Dotfiles symlinks removed'
