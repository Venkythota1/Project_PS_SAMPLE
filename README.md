# Project_PS_SAMPLE

This project is a **FastAPI-based application** designed to interact with a Kubernetes cluster. It retrieves and displays a list of pods using the Kubernetes API. The project is containerized using Docker, deployed to AWS Elastic Container Registry (ECR), and managed using Helm charts for Kubernetes deployment. The build and deployment processes are automated using AWS CodePipeline and CodeBuild.

---

## Architecture

### 1. **FastAPI Application**
   - **Purpose**: The FastAPI application serves as the backend service that connects to the Kubernetes API to fetch and display pod information.
   - **Key Features**:
     - Lightweight and fast web framework.
     - Connects to Kubernetes using the official Python Kubernetes client library.
     - Exposes RESTful endpoints for interacting with the Kubernetes cluster.

### 2. **Docker**
   - **Purpose**: The application is containerized using Docker to ensure consistency across environments.
   - **Key Features**:
     - Dockerfile builds the application image.
     - The image is pushed to AWS ECR for deployment.

### 3. **Helm Charts**
   - **Purpose**: Helm charts are used to define Kubernetes resources and manage the deployment of the application.
   - **Key Components**:
     - `values.yaml`: Contains configurable parameters like image repository, tag, and service details.
     - `templates/`: Includes Kubernetes manifests for deployment, service, ingress, config maps, and RBAC resources.
     - `chart.yaml`: Metadata about the Helm chart.

### 4. **AWS CodePipeline and CodeBuild**
   - **Purpose**: Automates the build and deployment process.
   - **Build Phase**:
     - `buildspec-build.yaml`: Defines steps to build the Docker image, push it to ECR, and package the Helm chart.
   - **Deploy Phase**:
     - `buildspec-deploy.yaml`: Defines steps to deploy the Helm chart to the Kubernetes cluster.

### 5. **Kubernetes**
   - **Purpose**: Orchestrates the deployment and scaling of the application.
   - **Key Resources**:
     - **Deployment**: Manages the pods running the FastAPI application.
     - **Service**: Exposes the application within the cluster.
     - **Ingress**: Provides external access to the application.
     - **ConfigMap**: Stores configuration data.
     - **RBAC**: Ensures secure access to Kubernetes resources.

---

## What Does It Mean?

### 1. **Containerization**:
   - The application is packaged with all its dependencies into a Docker image. This ensures that the application runs consistently across different environments.

### 2. **Kubernetes**:
   - Kubernetes is used to deploy and manage the application. It ensures high availability, scalability, and fault tolerance.

### 3. **Helm Charts**:
   - Helm simplifies Kubernetes deployments by templating resource definitions and managing configurations.

### 4. **AWS CodePipeline**:
   - Automates the CI/CD process, ensuring that changes to the codebase are automatically built, tested, and deployed.

### 5. **Microservices Architecture**:
   - The FastAPI application is a microservice that interacts with Kubernetes. This architecture allows for modularity and scalability.

---

## Summary

This project demonstrates a modern cloud-native application architecture. It leverages FastAPI for the backend, Docker for containerization, Kubernetes for orchestration, Helm for deployment management, and AWS CodePipeline for CI/CD automation. This setup ensures a scalable, reliable, and automated deployment pipeline for the application.
