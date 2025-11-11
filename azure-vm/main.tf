# Configure the Azure provider and backend
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.1"
    }
  }

  required_version = ">= 1.1.0"
  backend "azurerm" {
  resource_group_name  = "ResourceGroupDemo"
  storage_account_name = "mystatestorageacct123"  # <-- your actual storage account name
  container_name       = "tfstate"
  key                  = "terraform.tfstate"
 }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
