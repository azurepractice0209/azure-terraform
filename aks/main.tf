resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "devopstesting"

  kubernetes_version = "1.33.3"

  default_node_pool {
    name                        = "system"
    node_count                  = 1
    vm_size                     = "Standard_B2ms"
    orchestrator_version        = "1.33.3"
    temporary_name_for_rotation = "tempnp"
  }

  identity {
    type = "SystemAssigned"
  }
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
