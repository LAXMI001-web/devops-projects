#!/bin/bash
set -e
kubectl create deployment apache --image=httpd:2.4 --replicas=2 --dry-run=client -o yaml | kubectl apply -f -
kubectl rollout status deployment/apache --timeout=120s
kubectl expose deployment apache --type=NodePort --port=80 2>/dev/null || true
kubectl get pods,svc -l app=apache
POD=$(kubectl get pods -l app=apache -o jsonpath='{.items[0].metadata.name}')
kubectl exec $POD -- /bin/sh -c 'echo "<h1>Hello from Kubernetes Apache</h1>" > /usr/local/apache2/htdocs/index.html'
echo "Access from host:  minikube service apache --url    OR    kubectl port-forward deployment/apache 8080:80"
minikube service apache --url
