# dotfiles

Sam's personal dotfiles.

## Bootstrap
To set up the dotfiles and bootstrap the environment, you can run the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/samraytian/dotfiles/main/scripts/bootstrap.sh | bash
```

## Managing symlinks

The Makefile manages symlinks from `$HOME` and `~/.config` to the configuration packages with `ln -s`. Application configurations are stored at the root of their package directories. Packages such as `packages/tmux/`, `packages/ghostty/`, and `packages/nvim/` are linked as complete configuration directories; Zed links only `packages/zed/settings.json` to `~/.config/zed/settings.json`, leaving local prompt databases and other untracked files outside the repository.

```bash
# Create all symlinks
cd ~/dotfiles && make link

# Remove all symlinks
cd ~/dotfiles && make unlink
```

`make unlink` removes only links that point to the corresponding package. Creating links fails safely if a target already contains a real file or an unrelated symlink; resolve that conflict manually before retrying.

### Neovim

Neovim's configuration is stored in `packages/nvim/`, with `init.lua` loading the modules under `lua/config/`. The entire directory is linked to `~/.config/nvim`.

Before the first `make link`, back up an existing Neovim configuration directory:

```bash
mv -i ~/.config/nvim ~/.config/nvim.backup
make link
```

Use an unused backup path, and ensure the original directory was moved successfully before running `make link`. After linking, configuration edits under `~/.config/nvim` are stored in `packages/nvim/`. Review them before committing; keep credentials, private settings, and machine-specific paths out of the repository.

### Zed

Before the first `make link`, back up an existing regular Zed settings file:

```bash
mv -i ~/.config/zed/settings.json ~/.config/zed/settings.json.backup
make link
```

After linking, changes to Zed's user settings are stored in `packages/zed/settings.json`. Review them before committing: do not add credentials, private settings, or machine-specific paths. Local prompt databases under `~/.config/zed/prompts/` are not tracked.
