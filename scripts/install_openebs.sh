#!/bin/bash
set -euo pipefail

helm upgrade --install openebs \
  oci://ghcr.io/k0rdent/catalog/charts/openebs \
  --version 4.5.0 \
  -n openebs \
  --create-namespace \
  -f helm/openebs.yaml
