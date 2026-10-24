# Project 8: 5-pod-group application (frontend + 3 microservices + MongoDB)
One tiny Node image (`microservice:1.0`) is deployed as 4 separate Deployments/Services
(frontend, user-service, product-service, order-service) plus MongoDB, with a shared ConfigMap and Secret.
Only `frontend` is exposed (NodePort). Run: `minikube start --driver=docker && bash deploy.sh`.
The frontend JSON response shows it reaching the other services through their Service DNS names.
