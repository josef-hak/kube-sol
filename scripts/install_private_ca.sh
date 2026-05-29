#!/bin/bash
set -euo pipefail

helm upgrade --install private-ca \
  oci://ghcr.io/k0rdent/catalog/charts/raw \
  --version 2.0.2 \
  -n cert-manager \
  -f helm/private-ca.yaml

kubectl get certificate -A
# NAMESPACE      NAME              READY   SECRET                   AGE
# cert-manager   private-root-ca   True    private-root-ca-secret   9s
