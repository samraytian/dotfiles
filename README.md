# dotfiles

Sam's personal dotfiles.

## Bootstrap
To set up the dotfiles and bootstrap the environment, you can run the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/samraytian/dotfiles/main/scripts/bootstrap.sh | bash
```

## Managing symlinks

The Makefile uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks from `~/.config` (and `$HOME`) to the configs in `packages/`.

```bash
# Create all symlinks
cd ~/dotfiles && make link

# Remove all symlinks
cd ~/dotfiles && make unlink
```

`make unlink` removes only links managed by Stow, so real config files are left untouched. Creating links fails safely if a target already contains a real file or an unrelated symlink; resolve that conflict manually before retrying.
