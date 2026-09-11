# dotfiles

Sam's personal dotfiles.

## Bootstrap
To set up the dotfiles and bootstrap the environment, you can run the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/samraytian/dotfiles/main/scripts/bootstrap.sh | bash
```

## Managing symlinks

The Makefile manages symlinks from `$HOME` and `~/.config` to the configuration packages with `ln -s`. Application configurations are stored at the root of their package directories. Packages such as `packages/tmux/`, `packages/ghostty/`, `packages/nvim/`, and `packages/zed/` are linked as complete configuration directories.

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

The entire `packages/zed/` directory is linked to `~/.config/zed`, including settings, keymaps, and themes.

Before the first `make link`, or when migrating from the previous settings-only link, quit Zed and back up the existing configuration directory:

```bash
mv -i ~/.config/zed ~/.config/zed.backup
make link
```

Use an unused backup path, and ensure the original directory was moved successfully before running `make link`. Restore any needed keymaps, themes, or local `prompts/` data from the backup into `packages/zed/`. Do not copy the old `settings.json` symlink back: it already points to the repository's settings file. If the backup contains a regular settings file, compare and merge it instead of overwriting the repository's version.

After linking, configuration edits under `~/.config/zed` are stored in `packages/zed/`. Review them before committing: do not add credentials, private settings, or machine-specific paths. Local prompt databases under `packages/zed/prompts/` are ignored by Git.
