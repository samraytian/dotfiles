# Repository Guidelines

## Project Structure & Module Organization
This is a private personal dotfiles repository managed with GNU Stow. It is intended for the owner's local environment, not as a general-purpose shared configuration template.

- `zsh/`, `git/`, `starship/`, `ghostty/`: package directories that mirror target paths in `$HOME` (for example `zsh/.zshrc` becomes `~/.zshrc`).
- `scripts/`: helper automation scripts, currently focused on local environment bootstrap.
- `setup.sh`: main entrypoint to stow core packages.
- `README.md`: quick-start usage.
- `.stowrc`: global stow ignore rules; update this when adding non-stow assets.

Keep new config grouped by tool/package, and preserve home-relative directory layout inside each package.

## Build and Development Commands
- `./setup.sh` — stow core packages (`zsh`, `git`, `starship`, `ghostty`) into `$HOME`.
- `stow -R -v <package> --target="$HOME"` — restow one package during iterative edits.
- `bash scripts/bootstrap-macos.sh` — install required CLI tools on macOS via Homebrew.
- `stow -n -v <package> --target="$HOME"` — dry-run to preview symlink changes before applying.

## Coding Style & Naming Conventions
- Shell scripts use Bash (`#!/bin/bash`) with `set -e` for fail-fast behavior.
- Prefer 2-space indentation in shell scripts and keep logic POSIX-friendly unless Bash features are required.
- Name scripts in lowercase kebab-case (example: `bootstrap-macos.sh`).
- Keep aliases and exports in `zsh/.zshrc` grouped by section headers (Environment, Alias, Utilities).

## Commit Guidelines
Follow Conventional Commits style visible in history:

- Format: `type(scope): short description` (examples: `fix(zsh): ...`, `refactor(macos): ...`).
- Common types: `feat`, `fix`, `refactor`, `chore`.
- Keep commits scoped to one package or script when possible.
