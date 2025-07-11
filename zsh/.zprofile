# Homebrew on macOS
if [[ $(uname -s) == 'Darwin' ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)

  ## Ruby
  if [ -d "$(brew --prefix ruby)/bin" ]; then
    export PATH="$(brew --prefix ruby)/bin:$PATH"
    export PATH="$(gem environment gemdir)/bin:$PATH"
  fi

  ## Python
  if [ -d "$(brew --prefix python)/libexec/bin" ]; then
    export PATH="$(brew --prefix python)/libexec/bin:$PATH"
  fi
fi
