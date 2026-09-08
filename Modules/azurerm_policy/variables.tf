# Defines the Pre-Production Azure Policy configuration consumed by the child module.
variable "preprod-policy" {
  description = "Preprod Azure Policy configuration"
  type = map(object({
    name             = string
    display_name     = string
    description      = optional(string)
    policy_name      = string
    scope_type       = string
    scope_key        = string
    enforcement_mode = optional(string, "Default")
    parameters       = optional(string)
  }))
}

# Receives Resource Group IDs for resolving Resource Group policy assignment scopes.
variable "resource_group_ids" {
  type = map(string)
}

# Receives Virtual Network IDs for resolving Virtual Network policy scopes.
variable "virtual_network_ids" {
  type = map(string)
}

# Receives Key Vault IDs for resolving Key Vault policy scopes.
variable "key_vault_ids" {
  type = map(string)
}