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

`<leader>` is Space. Keys use normal mode unless another mode or context is noted.
LSP mappings require an attached language server; Git hunk mappings require Gitsigns
to be attached to the buffer.

### General editing and windows

| Keys | Action |
| --- | --- |
| `Ctrl-s` | Save the file (normal, insert, visual) |
| `Ctrl-c` | Wipe the current buffer |
| `U` | Redo the last undone change |
| `gl` | Move to the end of the line (normal, visual, operator-pending) |
| `<leader>l` | Clear search highlights |
| `Ctrl-h`, `Ctrl-j`, `Ctrl-k`, `Ctrl-l` | Focus the left / lower / upper / right window |
| `Ctrl-j`, `Ctrl-k` | Move selected lines down / up and keep the selection (visual) |

### Files and search

| Keys | Action |
| --- | --- |
| `-`, `<leader>e` | Open the current file's parent directory in Oil |
| `q`, `Ctrl-c` | Close Oil (normal mode in Oil) |
| `Ctrl-p` | Toggle file preview (normal mode in Oil) |
| `<leader><leader>`, `<leader>ff` | Find project files ranked by frequency and recency, including hidden files |
| `<leader>fb` | Find open buffers |
| `<leader>fo` | Find recently opened files |
| `<leader>sg` | Search text from the current working directory |
| `<leader>sw` | Search for the word under the cursor |
| `<leader>sh` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>sn` | Search message history |
| `<leader>?` | Show buffer-local keybindings |

### Motions and structural editing

| Keys | Action |
| --- | --- |
| `s`, `S` | Flash jump / Tree-sitter selection (normal, visual, operator-pending) |
| `r` | Perform an operator at a remote Flash target (operator-pending) |
| `R` | Search Tree-sitter nodes with Flash (visual, operator-pending) |
| `Ctrl-s` | Toggle Flash search (command-line) |
| `gsa` | Add surrounding delimiters to a motion or selection (normal, visual) |
| `gsd`, `gsr` | Delete / replace surrounding delimiters |
| `gsf`, `gsF`, `gsh` | Find surrounding delimiters right / left / highlight them |
| `<leader>cm`, `<leader>cj` | Toggle split / join, or join a code structure (TreeSJ) |
| `<leader>cs` | Split a code structure (TreeSJ) |

### Language navigation and code actions

| Keys | Action |
| --- | --- |
| `gd`, `gD` | Go to definition / declaration |
| `grr` | Find references |
| `gI`, `gy` | Go to implementation / type definition |
| `K` | Show hover documentation |
| `<leader>cS` | Find document symbols |
| `<leader>ca` | Preview and select a code action (normal, visual) |
| `<leader>cr` | Rename the symbol |
| `<leader>cf` | Format the buffer or selection (normal, visual) |

### Completion and snippets

These keys apply in insert mode.

| Keys | Action |
| --- | --- |
| `Ctrl-Space` | Open the completion menu |
| `Ctrl-y`, `Ctrl-e` | Accept / cancel completion |
| `Tab`, `Shift-Tab` | Jump to the next / previous snippet placeholder, otherwise tab out forward / backward |
| `Ctrl-k` | Show LSP signature help |

### Diagnostics

| Keys | Action |
| --- | --- |
| `[d`, `]d` | Jump to the previous / next diagnostic (Neovim defaults) |
| `<leader>cd` | Show line diagnostics in a floating window |
| `<leader>cw` | Request diagnostics for unopened workspace files |
| `<leader>xx`, `<leader>xd` | Search collected workspace / current-buffer diagnostics |
| `<leader>xt` | Toggle inline diagnostic messages |

### Git

| Keys | Action |
| --- | --- |
| `<leader>gg` | Open Neogit status (`?` for actions) |
| `[c`, `]c` | Jump to the previous / next Git hunk, or change in a diff window |
| `<leader>gs` | Stage / unstage the hunk or selected lines (normal, visual) |
| `<leader>gr` | Reset the hunk or selected lines (normal, visual) |
| `<leader>gS` | Stage the current buffer |
| `<leader>gp` | Preview the current hunk |
| `<leader>gb`, `<leader>gB` | Show current-line blame / toggle inline blame |
| `ih` | Select a Git hunk (visual, operator-pending) |
| `<leader>gd`, `<leader>gc` | Open / close repository diff |
| `<leader>gh`, `<leader>gH` | View current-file / repository file history |

## Useful commands

- `:FormatDisable` / `:FormatEnable`: turn format-on-save off / on; add `!` for the current buffer only.
- `:WorkspaceDiagnostics`: request diagnostics for unopened workspace files.
- `:TSJToggle` / `:TSJSplit` / `:TSJJoin`: toggle / split / join supported code structures; requires the language's Tree-sitter parser.
- `:TaboutToggle`: enable / disable tabbing out of brackets and quotes; requires the language's Tree-sitter parser.
- `:lua vim.pack.update()`: update plugins; run `:TSUpdate` afterward to update syntax parsers.
- `:checkhealth`: check the environment when something is not working.
