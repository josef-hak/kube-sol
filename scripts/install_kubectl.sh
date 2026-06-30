#!/usr/bin/env bash
set -euo pipefail

OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"

case "${ARCH}" in
    x86_64|amd64)
        ARCH="amd64"
        ;;
    aarch64|arm64)
        ARCH="arm64"
        ;;
    armv7l)
        ARCH="arm"
        ;;
    *)
        echo "Unsupported architecture: ${ARCH}"
        exit 1
        ;;
esac

VERSION="$(curl -fsSL https://dl.k8s.io/release/stable.txt)"

curl -fL -o kubectl \
    "https://dl.k8s.io/release/${VERSION}/bin/${OS}/${ARCH}/kubectl"

chmod +x kubectl
sudo mv kubectl /usr/local/bin/

echo "kubectl ${VERSION} installed for ${OS}/${ARCH}"
kubectl version --client
