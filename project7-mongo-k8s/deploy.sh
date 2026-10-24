#!/bin/bash
set -e
cd "$(dirname "$0")"
kubectl apply -f mongo-secret.yaml -f mongo-configmap.yaml
kubectl apply -f mongo.yaml
kubectl apply -f mongo-express.yaml
kubectl rollout status deployment/mongodb-deployment --timeout=180s
kubectl get all
echo "Opening Mongo Express (login admin/pass if asked: admin / pass)..."
minikube service mongo-express-service
