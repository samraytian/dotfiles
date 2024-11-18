# Homebrew
if [[ $(uname -s) == 'Darwin' ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

# Ruby
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# Python
export PATH="$(brew --prefix python)/libexec/bin:$PATH"

# Added by Toolbox App
export PATH="$PATH:/Users/samray/Library/Application Support/JetBrains/Toolbox/scripts"

