variable "resource_prefix" {
  description = "Prefix used for resource names"
  type        = string
  default     = "demo"
}

variable "location" {
  description = "Azure region to create resources in"
  type        = string
  default     = "centralindia"
}

variable "vm_name" {
  description = "Name of the Linux VM"
  type        = string
  default     = "ubuntu-vm"
}

variable "vm_size" {
  description = "Size of the VM (use a free-tier eligible size like Standard_B1s)"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the Linux VM"
  type        = string
  default     = "azureuser"
}

variable "admin_ssh_public_key" {
  description = "SSH public key for the admin user (ssh-rsa ...). Provide via TF_VAR_admin_ssh_public_key or terraform.tfvars"
  type        = string
}
