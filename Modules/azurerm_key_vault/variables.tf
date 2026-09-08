variable "preprod-key-vaults" {
  description = "Preprod Azure Key Vault configuration"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    sku_name = string

    soft_delete_retention_days = number
    purge_protection_enabled   = bool
    enable_rbac_authorization  = bool

    tags = optional(map(string))
  }))
}