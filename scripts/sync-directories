#!/usr/bin/env bash

set -euo pipefail

print_usage() {
  cat <<'EOF'
Usage: sync-directories.sh [options] <dir-a> <dir-b>

Bidirectionally synchronise two directories using rsync.

Options:
  --exclude PATTERN    Add an rsync exclude pattern (may be repeated)
  -h, --help           Show this message and exit
EOF
}

error() {
  echo "Error: $1" >&2
  exit 1
}

command -v rsync >/dev/null 2>&1 || error "rsync is required but not found in PATH"

EXCLUDE_PATTERNS=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --exclude)
      [[ $# -lt 2 ]] && error "--exclude requires a pattern"
      EXCLUDE_PATTERNS+=("$2")
      shift 2
      ;;
    -h|--help)
      print_usage
      exit 0
      ;;
    --)
      shift
      break
      ;;
    -*)
      error "Unknown option: $1"
      ;;
    *)
      break
      ;;
  esac

done

if [[ $# -ne 2 ]]; then
  echo "Error: Two directory paths are required."
  print_usage
  exit 1
fi

DIR_A="$1"
DIR_B="$2"

[[ -d "$DIR_A" ]] || error "Directory not found: $DIR_A"
[[ -d "$DIR_B" ]] || error "Directory not found: $DIR_B"

DIR_A=$(cd "$DIR_A" && pwd)
DIR_B=$(cd "$DIR_B" && pwd)

RSYNC_OPTS=(
  --archive
  --update
  --human-readable
  --compress
  --progress
  --prune-empty-dirs
)

EXCLUDES=()
if [[ ${#EXCLUDE_PATTERNS[@]} -gt 0 ]]; then
  for pattern in "${EXCLUDE_PATTERNS[@]}"; do
    EXCLUDES+=(--exclude "$pattern")
  done
fi

run_sync() {
  local from="$1"
  local to="$2"
  echo "Synchronising $(basename "$from") -> $(basename "$to")"
  rsync "${RSYNC_OPTS[@]}" "${EXCLUDES[@]}" "$from/" "$to/"
}

run_sync "$DIR_A" "$DIR_B"
run_sync "$DIR_B" "$DIR_A"

echo "Sync complete."
