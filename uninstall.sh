#!/usr/bin/env bash

set -e

EXCLUDES=""

for dir in */; do
  dir=${dir%/}
  if [[ ! "$EXCLUDES" =~ $dir ]]; then
    stow --verbose --delete --target="$HOME" --dir=. "$dir" --ignore='\.DS_Store'
  fi
done

