# Neovim

Personal Neovim configuration with completion, language support, format-on-save,
syntax highlighting, fuzzy search, and Git tools.

## Setup

Requires Neovim 0.12+, Git 2.31+, and language tools available on `PATH`.
See [the repository README](../../README.md) for setup and
[the Brewfile](../../scripts/Brewfile) for tools.

Plugins install on first launch. Automatic syntax parser installation requires
Tree-sitter CLI 0.26.1+ and a C compiler.

Language support includes Lua, Python, Rust, Swift, and Dart / Flutter, with
formatting for shell scripts as well.

## Common keys

`<leader>` is Space.

| Keys | Action |
| --- | --- |
| `<leader>l` | Clear search highlights |
| `gd`, `grr` | Go to definition / find references |
| `K` | Show documentation |
| `<leader>ca`, `<leader>cr` | Code action / rename |
| `<leader>cf` | Format buffer or selection |
| `[d`, `]d` | Previous / next diagnostic |
| `<leader>xx`, `<leader>xd` | Search workspace / buffer diagnostics |
| `Ctrl-Space` | Open completion menu |
| `Ctrl-y`, `Ctrl-e` | Accept / cancel completion |
| `<leader>gg` | Open Git status (`?` for actions) |
| `<leader>gd`, `<leader>gc` | Open / close Git diff |
| `<leader>gh` | View file history |
| `<leader>sn` | Search message history |

## Useful commands

- `:FormatDisable` / `:FormatEnable`: turn format-on-save off / on; add `!` for the current buffer only.
- `:WorkspaceDiagnostics`: request diagnostics for unopened workspace files.
- `:lua vim.pack.update()`: update plugins; run `:TSUpdate` afterward to update syntax parsers.
- `:checkhealth`: check the environment when something is not working.
