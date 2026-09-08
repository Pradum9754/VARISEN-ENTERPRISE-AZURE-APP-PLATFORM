variable "preprod-log-analytics" {
  description = "Preprod Log Analytics Workspace configuration"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string
    retention_in_days   = number
    tags                = optional(map(string))
  }))
}

