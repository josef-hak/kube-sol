#!/bin/bash
set -euo pipefail

helm upgrade --install cert-manager \
  oci://ghcr.io/k0rdent/catalog/charts/cert-manager \
  --version 1.20.2 \
  -n cert-manager \
  --create-namespace \
  -f helm/cert-manager.yaml
