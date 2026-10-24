# Project 7: Mongo + Mongo Express
`minikube start --driver=docker && bash deploy.sh`. Secret holds credentials, ConfigMap holds the DB host,
mongodb-service is internal (ClusterIP), mongo-express-service is external (NodePort 30000).
