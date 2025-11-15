#!/bin/bash

# Set variables
RESOURCE_GROUP="<your-resource-group>"
CLUSTER_NAME="<your-cluster-name>"
K8S_MANIFESTS_DIR="../k8s"

# Get AKS credentials
az aks get-credentials --resource-group $RESOURCE_GROUP --name $CLUSTER_NAME

# Deploy Kubernetes resources
kubectl apply -f $K8S_MANIFESTS_DIR/deployment.yaml
kubectl apply -f $K8S_MANIFESTS_DIR/service-loadbalancer.yaml
kubectl apply -f $K8S_MANIFESTS_DIR/ingress.yaml

echo "Deployment completed. Check the status of your resources using 'kubectl get all'."