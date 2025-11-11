# Terraform Azure Configuration with Remote State

This Terraform configuration creates an Ubuntu VM and stores its state in Azure Blob Storage.

## Backend Configuration

The state file is stored in Azure Blob Storage for better security and team collaboration. To set up the backend:

1. Make sure you're logged into Azure CLI:
```bash
az login
```

2. Create the storage account and container (if not already done):
```bash
RESOURCE_GROUP_NAME="ResourceGroupDemo"
STORAGE_ACCOUNT_NAME="tfstate$(date +%s)"
CONTAINER_NAME="tfstate"

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY
```

3. Set environment variables for backend access:
```bash
export ARM_ACCESS_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
```

4. Update the backend configuration in `main.tf` with your storage account name:
```hcl
backend "azurerm" {
  resource_group_name  = "ResourceGroupDemo"
  storage_account_name = "your_storage_account_name"  # Replace with actual name
  container_name      = "tfstate"
  key                = "terraform.tfstate"
}
```

5. Initialize Terraform with the new backend:
```bash
terraform init -reconfigure
```

## Security Notes

- The storage account key is sensitive. Never commit it to version control.
- Use environment variables or Azure Key Vault for storing sensitive values.
- Consider using Managed Identities for authentication in production environments.