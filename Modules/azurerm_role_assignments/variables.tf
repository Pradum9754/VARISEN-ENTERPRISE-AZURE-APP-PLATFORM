# Defines the Pre-Production Azure RBAC role assignment configuration consumed by the child module.
variable "preprod-role-assignments" {
  description = "Preprod Azure RBAC role assignments"
  type = map(object({
    name                 = string
    scope_type           = string
    scope_key            = string
    role_definition_name = string
    principal_id         = string
    principal_type       = optional(string)
    description          = optional(string)
  }))
}

# Receives Resource Group IDs for resolving RBAC assignment scopes.
variable "resource_group_ids" {
  type = map(string)
}

# Receives Virtual Machine IDs for resolving RBAC assignment scopes.
variable "virtual_machine_ids" {
  type = map(string)
}

# Receives Key Vault IDs for resolving RBAC assignment scopes.
variable "key_vault_ids" {
  type = map(string)
}

# Receives Bastion IDs for resolving RBAC assignment scopes.
variable "bastion_ids" {
  type = map(string)
}