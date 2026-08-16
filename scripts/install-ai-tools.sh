#!/usr/bin/env bash

set -euo pipefail

## =====================
## Install AI tools
## =====================

darwin() {
  # Ensure Homebrew is available
  if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Please install Homebrew first."
    exit 1
  fi

  echo "Installing AI tools..."

  # Claude Code
  brew install --cask claude-code@latest
  npm install -g @agentclientprotocol/claude-agent-acp

  # ChatGPT
  brew install --cask codex
  brew install --cask chatgpt
  npm install -g @agentclientprotocol/codex-acp

  # Pi Coding Agent
  brew install pi-coding-agent
  pi install npm:pi-web-access
  pi install npm:@plannotator/pi-extension
  npm install -g pi-acp

  # Others
  brew install --cask cc-switch
  brew install codeburn

  echo "✅ AI tools installed."
}

linux() {
  echo "Linux support not yet implemented."
}

windows() {
  echo "Windows support not yet implemented."
}

case "$(uname)" in
  Darwin)  darwin ;;
  Linux)   linux ;;
  MINGW*|MSYS*|CYGWIN*)  windows ;;
  *)       echo "Unsupported OS: $(uname)" && exit 1 ;;
esac
