#!/bin/bash

set -euo pipefail

## =====================
## Check for ssh key
## =====================

if [ ! -f "$HOME/.ssh/github_ed25519" ]; then
  echo "No SSH key found for GitHub. Please generate one and add it to your GitHub account."
  echo "You can generate an SSH key with the following command:"
  echo "ssh-keygen -t ed25519 -C 'samray.tian@gmail.com' -f \$HOME/.ssh/github_ed25519"
  exit 1
fi

## =====================
## Xcode Command Line Tools
## =====================
if [[ "$(uname)" == "Darwin" ]]; then
  if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    # Wait until the Xcode Command Line Tools are installed
    until xcode-select -p &>/dev/null; do
      sleep 5
    done
    echo "Xcode Command Line Tools installed."
  else
    echo "✅ Xcode Command Line Tools already installed"
  fi
fi

## =====================
## Install Homebrew and packages
## =====================

# Check if Homebrew is installed, if not install it
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew analytics off
  brew update
else
  echo "✅ Homebrew already installed"
fi

echo "Installing must-have packages..."
brew install git
brew install tmux
brew install stow
brew install bat                    # cat 的增强版本，支持语法高亮和 Git 状态
brew install cmake                  # 跨平台的开源构建系统，支持多种编译器和平台
brew install eza                    # ls 的增强版本，支持 Git 状态和图标
brew install fzf                    # 模糊查找工具
brew install fd                     # find 的增强版本，更快且更易用
brew install mole                   # CleanMyMac 的命令行替代
brew install ripgrep                # rg 的增强版本，递归搜索目录中的正则表达式，同时尊重 .gitignore
brew install shellcheck             # Shell 脚本的静态分析工具
brew install shfmt                  # Shell 脚本的格式化工具
brew install bash-language-server   # Bash 语言服务器，提供代码补全、错误检查等功能
brew install watchexec              # 监视文件系统的变化，并在变化发生时执行指定的命令，适用于自动化构建、测试和部署等场景
brew install zoxide                 # 更智能的 cd 命令，学习你的习惯，轻松跳转到常用目录

echo "Installing terminal utilities..."
brew install neovim
brew install starship
brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

echo "Installing DevOps tools ..."
brew install asc        # App Store Connect API 的命令行工具 https://asccli.sh/
brew install awscli     # AWS Command Line Interface
brew install gh         # GitHub CLI
brew install chezscheme # Chez Scheme 是一个高性能的 Scheme 实现
brew install sqlite
brew install tree-sitter
brew install tree-sitter-cli

echo "Setting up Node.js ..."
brew install node

echo "Setting up Python ..."
brew install python

echo "Setting up Ruby ..."
brew install ruby

echo "Setting up Rust ..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Setting up Lua ..."
brew install lua
brew install luajit
brew install luarocks
brew install stylua

echo "Setting up Flutter ..."
brew install --cask flutter
brew install fvm

echo "Installing applications with Homebrew Cask..."
brew install --cask ghostty
brew install --cask iterm2
brew install --cask raycast
brew install --cask visual-studio-code
brew install --cask input-source-pro
brew install --cask font-hack-nerd-font
brew install --cask font-source-code-pro
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask rectangle-pro
brew install --cask mac-mouse-fix

## =====================
## Install AI tools
## =====================

echo "Installing AI tools..."

brew install --cask cc-switch
brew install --cask codex
curl -fsSL https://claude.ai/install.sh | bash
curl -fsSL https://herdr.dev/install.sh | sh
curl -fsSL https://pi.dev/install.sh | sh

## =====================
## MacOS settings
## =====================

echo "Set key repeat rate and delay..."
defaults write NSGlobalDomain KeyRepeat -int 2         # 设置按键重复的速度，数值越小速度越快
defaults write NSGlobalDomain InitialKeyRepeat -int 15 # 设置按键重复的延迟，数值越小延迟越短

echo "Set trackpad and mouse tracking speed..."
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2 # 设置触控板的跟踪速度，数值越大速度越快
defaults write NSGlobalDomain com.apple.mouse.scaling -float 2    # 设置鼠标的跟踪速度，数值越大速度越快

echo "Enable trackpad tap to click..."
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Enable trackpad three-finger drag..."
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

killall Dock &>/dev/null || true

## =====================
## Clone dotfiles repository
## =====================

if [ ! -d "$HOME/dotfiles" ]; then
  echo "Cloning dotfiles repository..."
  git clone git@github.com:samraytian/dotfiles.git "$HOME/dotfiles"
else
  echo "✅ Dotfiles repository already cloned, pulling latest..."
  cd "$HOME/dotfiles" && git pull origin main
fi

# Navigate to dotfiles directory and stow configurations
echo "Stowing dotfiles configurations..."
cd "$HOME/dotfiles" || exit 1

stow -R -t "$HOME" ghostty git rime starship tmux zsh

echo "✅ Dotfiles installation complete!"
