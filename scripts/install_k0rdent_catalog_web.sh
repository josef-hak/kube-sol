#!/bin/bash
set -euo pipefail

helm upgrade --install headlamp \
  oci://ghcr.io/k0rdent/catalog/charts/headlamp \
  --version 0.40.0 \
  -n headlamp \
  --create-namespace \
  -f helm/headlamp.yaml

