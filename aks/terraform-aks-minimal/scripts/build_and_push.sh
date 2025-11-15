#!/bin/bash

# Variables
IMAGE_NAME="your-docker-image-name"
REGISTRY_NAME="your-container-registry-name"
REGISTRY_URL="$REGISTRY_NAME.azurecr.io"
TAG="latest"

# Build the Docker image
docker build -t $IMAGE_NAME:$TAG .

# Log in to Azure Container Registry
az acr login --name $REGISTRY_NAME

# Tag the image
docker tag $IMAGE_NAME:$TAG $REGISTRY_URL/$IMAGE_NAME:$TAG

# Push the image to Azure Container Registry
docker push $REGISTRY_URL/$IMAGE_NAME:$TAG

echo "Docker image $IMAGE_NAME:$TAG has been built and pushed to $REGISTRY_URL."