#!/bin/bash

# Variables
ECR_REPO_URI="<your-ecr-repo-uri>"
DOCKER_IMAGE_TAG="latest"
HELM_CHART_DIR="helm-chart"

# Build Docker image
docker build -t $ECR_REPO_URI:$DOCKER_IMAGE_TAG .

# Push Docker image to ECR
docker push $ECR_REPO_URI:$DOCKER_IMAGE_TAG

# Package and deploy Helm chart
helm package $HELM_CHART_DIR
helm upgrade --install my-app $HELM_CHART_DIR --set image.repository=$ECR_REPO_URI --set image.tag=$DOCKER_IMAGE_TAG