#!/bin/bash
set -euo pipefail

helm upgrade --install headlamp-token \
  oci://ghcr.io/k0rdent/catalog/charts/raw \
  --version 2.0.2 \
  -n headlamp \
  --create-namespace \
  -f helm/headlamp-token.yaml
