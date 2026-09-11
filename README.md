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
