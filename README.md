# Verified Kubernetes Solutions

## Install Headlamp
~~~bash
./scripts/install_headlamp.sh
./scripts/install_headlamp_token.sh

# get token value, copy and use in headlamp UI to sign in
kubectl get secrets headlamp-token -n headlamp -o jsonpath='{.data.token}' | base64 -d; echo
~~~
