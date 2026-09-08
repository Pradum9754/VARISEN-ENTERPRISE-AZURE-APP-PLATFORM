# Defines the Pre-Production Virtual Network and subnet configuration consumed by the child module.
variable "preprod-vnet-subs" {
  description = "Configuration for pre-production VNET"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))

    # Defines the subnet configuration for each Pre-Production Virtual Network.
    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}