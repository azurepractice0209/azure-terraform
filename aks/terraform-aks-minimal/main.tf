resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

module "aks" {
  source = "./modules/aks"

  resource_group_name = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  cluster_name        = "Devops_testing"
  node_count          = var.node_count
  vm_size             = var.vm_size
  dns_prefix          = "devops"
}