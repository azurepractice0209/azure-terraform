output "aks_cluster_name" {
  value = module.aks.cluster_name
}

output "kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}

output "resource_group_name" {
  value = module.aks.resource_group_name
}

output "aks_name" {
  value = module.aks.cluster_name
}
