# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal macOS dotfiles. Configuration lives in `packages/<name>/` and is deployed by symlinking into `$HOME` and `~/.config`; edits are live immediately. There is no build, test, or lint step for the repo itself.

## Commands

- `make link` / `make unlink` — create / remove dotfile symlinks. Both are safe: linking refuses to overwrite real files or unrelated symlinks, unlinking removes only links that point back into this repo.
- `stylua --check packages/nvim` — verify Lua formatting (style in `packages/nvim/.stylua.toml`, 2-space indent); drop `--check` to fix.
- `scripts/bootstrap.sh` — full environment bootstrap (Xcode CLT, Homebrew, Brewfile, symlinks, macOS defaults). macOS-only.
- Inside Neovim: `:checkhealth` to diagnose the environment; `:lua vim.pack.update()` (then `:TSUpdate`) to update plugins and parsers.

## Architecture

### Symlink model

Link targets are defined in the `Makefile`, in two styles:

- Single files: `packages/git/.gitconfig` and `packages/zsh/.zsh*` → `$HOME`; `packages/starship/starship.toml` → `~/.config/starship.toml`
- Whole directories: `packages/{ghostty,tmux,nvim,neovide,zed}` → `~/.config/<name>`

Adding or removing a package means editing both the `link` and `unlink` targets.

### Neovim (`packages/nvim/` — the largest package)

Built on Neovim 0.12+'s `vim.pack` — there is no plugin manager like lazy.nvim or packer.

- Plugins are declared as full Git URLs in `lua/plugins/init.lua` via `vim.pack.add()`. A cleanup pass at the bottom deletes installed plugins no longer in that list, so removing a plugin is just removing its URL line (plus its config module and require).
- Each plugin has a config module `lua/plugins/<name>.lua`, required explicitly at the bottom of `plugins/init.lua`. **Load order matters** — e.g. `tabout` must be required before `blink` so Blink does not capture Tab as a snippet fallback.
- `lua/config/{options,autocmds,keymaps}.lua` hold global settings, loaded from `init.lua`.
- `after/ftplugin/{lua,dart,python,rust,swift}.lua` set per-filetype indentation (2 spaces for Lua/Dart, 4 for Python/Rust/Swift) with `undo_ftplugin` support.
- LSP uses the `vim.lsp.config()` / `vim.lsp.enable()` API. Servers and formatters are expected on `PATH` and installed via `scripts/Brewfile` — not via Mason. In Python, responsibilities are split: basedpyright owns hover/type info, ruff owns linting, imports, and formatting.
- Tree-sitter parsers auto-install on first use via a custom `FileType` autocmd in `lua/plugins/treesitter.lua`; this requires the tree-sitter CLI.

### Documentation convention

`packages/nvim/README.md` documents every user-facing keymap and command. When adding or changing keymaps or commands, update that README in the same change.

## Commits

Use Conventional Commits: `<type>(<scope>): <summary>`. Types: `feat`, `fix`, `refactor`, `chore`, `docs`, `test`. Scope is the package name (`nvim`, `zsh`, `git`, ...); omit it when not applicable. Keep each commit focused and write the summary in imperative English.

## Security

Never commit credentials, tokens, machine-specific paths, or private settings; `.secrets` is local-only (gitignored, sourced by `.zshrc`). Review changes to `scripts/bootstrap.sh`, `scripts/macos-defaults.sh`, and the `Makefile` especially carefully — they alter a contributor's shell environment and symlinked files.
