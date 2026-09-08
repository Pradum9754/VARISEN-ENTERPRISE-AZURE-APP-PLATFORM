variable "preprod-nat-gateway" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
    idle_timeout_in_minutes = number
    zones               = optional(list(string))
  }))
}