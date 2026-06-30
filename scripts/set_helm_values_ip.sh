#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 <hostname-or-ip>"
    echo "Example: $0 myserver.192.168.1.2.sslip.io"
    exit 1
fi

NEW_VALUE="$1"

find helm -type f \( -name "*.yaml" -o -name "*.yml" \) -print0 |
while IFS= read -r -d '' file; do
    sed -i.bak "s/MY_SERVER\.MY_IP/${NEW_VALUE//\//\\/}/g" "$file"
    rm -f "${file}.bak"
done

echo "Replaced MY_SERVER.MY_IP -> ${NEW_VALUE}"
