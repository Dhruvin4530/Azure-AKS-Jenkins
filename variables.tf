# resource group name
variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

# region
variable "region" {
  type        = string
  description = "Region"
}

# Virtual Network CIDR
variable "vnetCIDR" {
  type        = list(string)
  description = "Virtual Network CIDR"
}

# subnet CIDRs
variable "subnetCIDRs" {
  type        = list(string)
  description = "Subnet CIDRs"
}

# environment
variable "environment" {
  type        = string
  description = "Environment"
}

# max node count 
variable "max_node_count" {
  type        = number
  description = "Maximun node count for worker node"
}

# min node count 
variable "min_node_count" {
  type        = number
  description = "Minimum node count for worker node"
}

# size of worker node
variable "node_vm_size" {
  type        = string
  description = "Size of worker node"
}

# client ID
variable "client_id" {
  type = string
  description = "Client ID"
}

# client secret
variable "client_secret" {
  type = string
  description = "Client secret"
}

# Subscription ID
variable "subscription_id" {
  type = string
  description = "Subscription ID"
}

# Tenant ID
variable "tenant_id" {
  type = string
  description = "Tenant ID"
}