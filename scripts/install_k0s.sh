#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://get.k0s.sh | sudo sh
sudo k0s version
sudo k0s install controller --single # single: can not add workers later
sudo k0s start
sudo k0s status

sudo k0s kubectl get pod -A # use builtin kubectl, event. create alias to ~/.zshrc
mkdir ~/.kube
sudo k0s kubectl config view --minify --raw > ~/.kube/config # export kubeconfig
sudo chmod 0600 ~/.kube/config
