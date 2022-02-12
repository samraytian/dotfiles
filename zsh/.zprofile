
if [[ $(uname -s) == 'Darwin' ]]; then

    if [[ $(uname -m) == 'arm64' ]]; then
        eval $(/opt/homebrew/bin/brew shellenv)
    fi

fi


