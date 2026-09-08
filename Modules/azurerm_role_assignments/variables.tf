variable "preprod-role-assignments" {
  description = "Preprod Azure RBAC role assignments"

  type = map(object({
    name                  = string
    scope_type            = string
    scope_key             = string
    role_definition_name  = string
    principal_id          = string
    principal_type        = optional(string)
    description           = optional(string)
  }))
}

variable "resource_group_ids" {
  type = map(string)
}

variable "virtual_machine_ids" {
  type = map(string)
}

variable "key_vault_ids" {
  type = map(string)
}

variable "bastion_ids" {
  type = map(string)
}