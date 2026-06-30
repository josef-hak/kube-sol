#!/usr/bin/env bash
set -euo pipefail

curl --proto '=https' --tlsv1.2 -sSf https://get.k0s.sh | sudo sh

sudo k0s version

# sudo k0s install controller --single # no future workers allowed
sudo k0s install controller --enable-worker --no-taints
sudo k0s start

# Wait for k0s service/status socket
until sudo k0s status >/dev/null 2>&1; do
  echo "Waiting for k0s to start..."
  sleep 3
done

# Wait for admin kubeconfig
until sudo test -f /var/lib/k0s/pki/admin.conf; do
  echo "Waiting for k0s admin.conf..."
  sleep 3
done

# Wait for Kubernetes API
until sudo k0s kubectl get nodes >/dev/null 2>&1; do
  echo "Waiting for Kubernetes API..."
  sleep 5
done

sudo k0s status
sudo k0s kubectl get nodes
sudo k0s kubectl get pods -A

mkdir -p ~/.kube
sudo cp /var/lib/k0s/pki/admin.conf ~/.kube/config
sudo chown "$USER:$USER" ~/.kube/config
chmod 0600 ~/.kube/config

echo "k0s is ready"
