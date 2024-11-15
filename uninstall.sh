#!/usr/bin/env bash

set -e

PACKAGES=""
EXCLUDES=". .. .git icons"

for dir in */; do
  dir=${dir%/}
  if [[ ! "$EXCLUDES" =~ $dir ]]; then
    if [[ -z "$PACKAGES" ]]; then
      PACKAGES="$dir"
    else
      PACKAGES="$PACKAGES $dir"
    fi
  fi
done

stow --verbose --delete --target="$HOME" --dir=. $PACKAGES --ignore='\.DS_Store'