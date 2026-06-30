#!/bin/bash
set -euo pipefail

helm upgrade --install k0rdent-catalog-web \
  oci://ghcr.io/k0rdent/catalog/charts/k0rdent-catalog-web
  -n k0rdent-catalog-web \
  --create-namespace \
  -f helm/k0rdent-catalog-web.yaml
