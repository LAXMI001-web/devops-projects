#!/bin/bash
set -e
cd "$(dirname "$0")"
docker build -t microservice:1.0 ./app
minikube image load microservice:1.0
kubectl apply -f k8s/00-config.yaml
kubectl apply -f k8s/01-mongodb.yaml
kubectl apply -f k8s/02-services.yaml
kubectl -n shop rollout status deployment/frontend --timeout=180s
kubectl -n shop get all
echo "Opening frontend (it calls the other 3 services by name)..."
minikube service frontend -n shop
