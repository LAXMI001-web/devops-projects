# Handy kubectl commands
```
kubectl scale deployment apache --replicas=4
kubectl logs <pod>
kubectl describe deployment apache
kubectl port-forward deployment/apache 8080:80   # http://localhost:8080
kubectl delete deployment apache && kubectl delete svc apache
```
