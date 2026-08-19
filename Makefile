.DEFAULT_GOAL := help
SHELL := /bin/sh

PKG_DIR := $(CURDIR)/packages

.PHONY: help link unlink

help:
	@printf '%s\n' 'Usage: make <target>' '' 'Targets:' '  link    Create dotfile symlinks' '  unlink  Remove dotfile symlinks'

# Create a link only when the destination is absent or already points to source.
define create_link
	@source="$(1)"; target="$(2)"; \
	if [ ! -e "$$source" ]; then \
		echo "Source path does not exist: $$source" >&2; exit 1; \
	elif [ -L "$$target" ]; then \
		if [ "$$(/usr/bin/readlink "$$target")" != "$$source" ]; then \
			echo "Refusing to replace unrelated symlink: $$target" >&2; exit 1; \
		fi; \
	elif [ -e "$$target" ]; then \
		echo "Refusing to replace existing path: $$target" >&2; exit 1; \
	else \
		/bin/mkdir -p "$$(/usr/bin/dirname "$$target")"; \
		/bin/ln -s "$$source" "$$target"; \
	fi
endef

# Remove a link only when it points to the corresponding source path.
define remove_link
	@source="$(1)"; target="$(2)"; \
	if [ -L "$$target" ] && [ "$$(/usr/bin/readlink "$$target")" = "$$source" ]; then \
		/bin/rm "$$target"; \
	fi
endef

link:
	$(call create_link,$(PKG_DIR)/git/.gitconfig,$(HOME)/.gitconfig)
	$(call create_link,$(PKG_DIR)/zsh/.zprofile,$(HOME)/.zprofile)
	$(call create_link,$(PKG_DIR)/zsh/.zshenv,$(HOME)/.zshenv)
	$(call create_link,$(PKG_DIR)/zsh/.zshrc,$(HOME)/.zshrc)
	$(call create_link,$(PKG_DIR)/starship/starship.toml,$(HOME)/.config/starship.toml)
	$(call create_link,$(PKG_DIR)/ghostty,$(HOME)/.config/ghostty)
	$(call create_link,$(PKG_DIR)/tmux,$(HOME)/.config/tmux)
	$(call create_link,$(PKG_DIR)/neovide,$(HOME)/.config/neovide)
	@/bin/echo '✅ Dotfiles symlinks created'

unlink:
	$(call remove_link,$(PKG_DIR)/git/.gitconfig,$(HOME)/.gitconfig)
	$(call remove_link,$(PKG_DIR)/zsh/.zprofile,$(HOME)/.zprofile)
	$(call remove_link,$(PKG_DIR)/zsh/.zshenv,$(HOME)/.zshenv)
	$(call remove_link,$(PKG_DIR)/zsh/.zshrc,$(HOME)/.zshrc)
	$(call remove_link,$(PKG_DIR)/starship/starship.toml,$(HOME)/.config/starship.toml)
	$(call remove_link,$(PKG_DIR)/ghostty,$(HOME)/.config/ghostty)
	$(call remove_link,$(PKG_DIR)/tmux,$(HOME)/.config/tmux)
	$(call remove_link,$(PKG_DIR)/neovide,$(HOME)/.config/neovide)
	@/bin/echo '✅ Dotfiles symlinks removed'
