terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }

  required_version = ">= 1.1"
}

provider "azurerm" {
  features {}

  subscription_id = "72daf5f5-5e14-4eca-b3fb-82dfc44f2e08"
}
