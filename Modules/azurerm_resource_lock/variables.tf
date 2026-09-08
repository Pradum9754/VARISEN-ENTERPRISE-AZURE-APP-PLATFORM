# Defines the Pre-Production Azure resource lock configuration consumed by the child module.
variable "preprod-resource-locks" {
  description = "Preprod Azure resource locks"
  type = map(object({
    name       = string
    scope_type = string
    scope_key  = string
    lock_level = string
    notes      = optional(string)
  }))
}

# Receives Resource Group IDs for resolving resource lock scopes.
variable "resource_group_ids" {
  type = map(string)
}

# Receives Virtual Network IDs for resolving resource lock scopes.
variable "virtual_network_ids" {
  type = map(string)
}

# Receives Virtual Machine IDs for resolving resource lock scopes.
variable "virtual_machine_ids" {
  type = map(string)
}

# Receives Key Vault IDs for resolving resource lock scopes.
variable "key_vault_ids" {
  type = map(string)
}

# Receives Bastion IDs for resolving resource lock scopes.
variable "bastion_ids" {
  type = map(string)
}