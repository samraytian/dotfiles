# dotfiles

Sam's personal dotfiles.

## Bootstrap
To set up the dotfiles and bootstrap the environment, you can run the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/samraytian/dotfiles/main/scripts/bootstrap.sh | bash
```

## Managing symlinks

The `symlinks.sh` command manages the symlinks from `~/.config` (and `$HOME`) to the configs in `packages/`.

```bash
# Create all symlinks
~/dotfiles/scripts/symlinks.sh install

# Remove all symlinks
~/dotfiles/scripts/symlinks.sh uninstall
```

`uninstall` only removes entries that are symlinks, so your real config files are left untouched.
