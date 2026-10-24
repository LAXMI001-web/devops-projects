#!/bin/bash
# Node (cluster) autoscaling needs a cloud provider. GKE example (needs gcloud + billing):
gcloud container clusters create social-cluster --num-nodes=2 \
  --enable-autoscaling --min-nodes=1 --max-nodes=5 --zone=asia-south1-a
gcloud container clusters get-credentials social-cluster --zone=asia-south1-a
# then: kubectl apply -f app.yaml -f hpa.yaml ; run load ; watch nodes: kubectl get nodes -w
# cleanup: gcloud container clusters delete social-cluster --zone=asia-south1-a
# AKS : az aks create -g <rg> -n social --enable-cluster-autoscaler --min-count 1 --max-count 5
# EKS : use Cluster Autoscaler or Karpenter
