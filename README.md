# dotfiles

Samray's personal configurations and scripts managed using Stow.

## Install

- You will need `homebrew` installed on your system.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Clone into your `$HOME` directory:

```bash
git clone https://github.com/samraytian/dotfiles.git ~/.dotfiles
```

- Run the `install.sh` script:

```bash
cd ~/dotfiles
./install.sh
```

## Uninstall

- Run the `uninstall.sh` script:

```bash
cd ~/dotfiles
./uninstall.sh
```

## Stow Usage

- To install a package:

```bash
stow -v <package>
```

- To uninstall a package:

```bash
stow -vD <package>
```
