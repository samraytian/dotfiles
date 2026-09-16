# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal macOS dotfiles. Configuration lives in `packages/<name>/` and is deployed by symlinking into `$HOME` and `~/.config`; edits are live immediately. There is no build, test, or lint step for the repo itself.

The Neovim configuration lives in a separate private repository, `samraytian/nvim` (its history was extracted from this repo); clone it to `~/.config/nvim` manually.

## Commands

- `make link` / `make unlink` — create / remove dotfile symlinks. Both are safe: linking refuses to overwrite real files or unrelated symlinks, unlinking removes only links that point back into this repo.
- `scripts/bootstrap.sh` — full environment bootstrap (Xcode CLT, Homebrew, Brewfile, symlinks, macOS defaults). macOS-only. It does not clone the private nvim configuration repository — do that manually.

## Architecture

### Symlink model

Link targets are defined in the `Makefile`, in two styles:

- Single files: `packages/git/.gitconfig` and `packages/zsh/.zsh*` → `$HOME`; `packages/starship/starship.toml` → `~/.config/starship.toml`
- Whole directories: `packages/{ghostty,tmux,neovide,zed}` → `~/.config/<name>`

Adding or removing a package means editing both the `link` and `unlink` targets.

## Commits

Use Conventional Commits: `<type>(<scope>): <summary>`. Types: `feat`, `fix`, `refactor`, `chore`, `docs`, `test`. Scope is the package name (`zsh`, `git`, ...); omit it when not applicable. Keep each commit focused and write the summary in imperative English.

## Security

Never commit credentials, tokens, machine-specific paths, or private settings; `.secrets` is local-only (gitignored, sourced by `.zshrc`). Review changes to `scripts/bootstrap.sh`, `scripts/macos-defaults.sh`, and the `Makefile` especially carefully — they alter a contributor's shell environment and symlinked files.
