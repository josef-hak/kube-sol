#!/bin/bash
set -euo pipefail

helm upgrade --install metallb \
  oci://ghcr.io/k0rdent/catalog/charts/metallb \
  --version 0.15.3 \
  -n metallb \
  --create-namespace

kubectl apply -f manifests/metallb.yaml
