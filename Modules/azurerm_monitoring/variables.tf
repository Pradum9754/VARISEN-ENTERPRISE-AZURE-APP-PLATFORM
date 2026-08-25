# variable "preprod-log-analytics" {
#   description = "Preprod Log Analytics Workspace configuration"

#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string
#     sku                 = string
#     retention_in_days   = number
#     tags                = optional(map(string))
#   }))
# }

variable "preprod-monitoring" {
  description = "Preprod Azure Monitor Diagnostic Settings"

  type = map(object({
    name   = string
    vm_key = string

    logs = list(object({
      category = string
    }))

    metrics = list(object({
      category = string
    }))
  }))
}

variable "virtual_machine_ids" {
  type = map(string)
}

variable "log_analytics_workspace_id" {
  type = string
}