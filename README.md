# dotfiles

Sam's personal dotfiles.

## Bootstrap
To set up the dotfiles and bootstrap the environment, you can run the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/samraytian/dotfiles/main/scripts/bootstrap.sh | bash
```

## Managing symlinks

The Makefile manages symlinks from `$HOME` and `~/.config` to the configuration packages with `ln -s`. Application configurations are stored at the root of their package directories. Packages such as `packages/tmux/` and `packages/ghostty/` are linked as complete configuration directories; Zed links only `packages/zed/settings.json` to `~/.config/zed/settings.json`, leaving local prompt databases and other untracked files outside the repository.

```bash
# Create all symlinks
cd ~/dotfiles && make link

# Remove all symlinks
cd ~/dotfiles && make unlink
```

`make unlink` removes only links that point to the corresponding package. Creating links fails safely if a target already contains a real file or an unrelated symlink; resolve that conflict manually before retrying.

### Zed

Before the first `make link`, back up an existing regular Zed settings file:

```bash
mv -i ~/.config/zed/settings.json ~/.config/zed/settings.json.backup
make link
```

After linking, changes to Zed's user settings are stored in `packages/zed/settings.json`. Review them before committing: do not add credentials, private settings, or machine-specific paths. Local prompt databases under `~/.config/zed/prompts/` are not tracked.
