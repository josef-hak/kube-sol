#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <hostname-or-ip>"
    exit 1
fi

NEW_VALUE="$1"

find helm -type f \( -name "*.yaml" -o -name "*.yml" \) -print0 |
while IFS= read -r -d '' file; do
    if grep -n 'MY_SERVER\.MY_IP' "$file"; then
        echo "Updating: $file"
        sed -i.bak "s/MY_SERVER\.MY_IP/${NEW_VALUE//\//\\/}/g" "$file"
        rm -f "${file}.bak"
    fi
done
