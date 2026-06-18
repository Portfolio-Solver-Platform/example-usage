#!/usr/bin/env bash

set -euo pipefail

assume_yes=false
[[ "${1:-}" == "-y" || "${1:-}" == "--yes" ]] && assume_yes=true

# Log in only if not already authenticated.
if ! psp auth status >/dev/null 2>&1; then
  echo "Not logged in — logging in..."
  psp auth login
fi

ids=$(psp problems list --json | jq -r '.[].id')

if [[ -z "$ids" ]]; then
  echo "No problems to delete."
  exit 0
fi

count=$(wc -w <<<"$ids" | tr -d ' ')
echo "Found $count problem(s) to delete: $(tr '\n' ' ' <<<"$ids")"

if ! $assume_yes; then
  read -rp "Delete ALL $count problem(s)? This cannot be undone. [y/N] " reply
  [[ "$reply" == [yY] ]] || { echo "Aborted."; exit 1; }
fi

for id in $ids; do
  echo "Deleting problem $id..."
  psp problems delete "$id" -y
done

echo "Done."
