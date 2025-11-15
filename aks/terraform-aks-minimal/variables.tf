variable "resource_group_name" {
  type    = string
  default = "Resgrpoup-Devops"
}

variable "location" {
  type    = string
  default = "East US 2"
}

variable "node_count" {
  type    = number
  default = 1
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}