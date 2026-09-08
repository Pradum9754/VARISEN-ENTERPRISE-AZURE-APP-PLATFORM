# Defines the Pre-Production Network Security Group configuration consumed by the child module.
variable "preprod-nsgs" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    tags                = optional(map(string))

    # Defines the security rules that will be dynamically created for each NSG.
    security_rules = map(object({
      name                        = string
      priority                    = number
      direction                   = string
      access                      = string
      protocol                    = string
      source_port_range           = string
      destination_port_range      = string
      source_address_prefix       = string
      destination_address_prefix  = string
    }))
  }))
}