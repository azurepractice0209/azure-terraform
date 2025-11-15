# AKS Minimal Terraform Project

This project sets up a minimal Azure Kubernetes Service (AKS) cluster using Terraform. It is designed for testing purposes and includes the necessary configurations to host a Docker image that is publicly accessible.

## Project Structure

- **modules/aks/**: Contains the Terraform module for creating the AKS cluster.
  - `main.tf`: Main configuration for the AKS cluster.
  - `variables.tf`: Input variables for the AKS module.
  - `outputs.tf`: Outputs of the AKS module.

- **k8s/**: Contains Kubernetes resource definitions.
  - `deployment.yaml`: Kubernetes deployment configuration for the Docker image.
  - `service-loadbalancer.yaml`: Service definition to expose the deployment publicly.
  - `ingress.yaml`: Ingress resource for routing external traffic.

- **scripts/**: Contains scripts for building and deploying.
  - `build_and_push.sh`: Script to build and push the Docker image to a container registry.
  - `deploy.sh`: Script to deploy Kubernetes resources to the AKS cluster.

- **main.tf**: Main Terraform configuration file for the project.
- **providers.tf**: Specifies the providers used in the Terraform configuration.
- **variables.tf**: Input variables for the overall Terraform project.
- **outputs.tf**: Outputs of the Terraform project.
- **versions.tf**: Specifies required Terraform and provider versions.

## Setup Instructions

1. **Prerequisites**:
   - Install Terraform.
   - Install Azure CLI and log in to your Azure account.
   - Ensure you have access to create resources in your Azure subscription.

2. **Configure Variables**:
   - Update the `variables.tf` file with your desired settings for the AKS cluster, such as cluster name, location, and node count.

3. **Build and Push Docker Image**:
   - Run the `scripts/build_and_push.sh` script to build your Docker image and push it to your container registry.

4. **Deploy to AKS**:
   - Run the `scripts/deploy.sh` script to deploy the Kubernetes resources defined in the `k8s` directory to your AKS cluster.

5. **Access Your Application**:
   - After deployment, you can access your application using the external IP provided by the LoadBalancer service defined in `service-loadbalancer.yaml`.

## Notes

- This project is intended for testing and may require adjustments for production use.
- Ensure that your Docker image is properly configured to run in the Kubernetes environment.