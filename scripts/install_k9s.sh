#!/bin/bash

# Install k9s to Ubuntu 24.04 LTS

arch="$(uname -m)"

case "${arch}" in
    x86_64|amd64)
        arch="amd64"
        ;;
    aarch64|arm64)
        arch="arm64"
        ;;
    armv7l)
        arch="arm"
        ;;
    *)
        echo "Unsupported architecture: ${arch}"
        exit 1
        ;;
esac

debfile="k9s_linux_${arch}.deb"

wget https://github.com/derailed/k9s/releases/latest/download/${debfile}
sudo apt install ./${debfile}
rm ${debfile}

echo "export TERM=xterm" >> ~/.bashrc
