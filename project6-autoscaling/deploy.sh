#!/bin/bash
set -e
cd "$(dirname "$0")"
minikube addons enable metrics-server
kubectl apply -f app.yaml -f hpa.yaml
echo "Wait ~1 min for metrics, then in terminal 1 run:  kubectl get hpa php-apache -w"
echo "In terminal 2 run:  bash load.sh   (Ctrl+C to stop load; replicas scale back down after ~5 min)"
