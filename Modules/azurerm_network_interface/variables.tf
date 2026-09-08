# Defines the Pre-Production Network Interface configuration consumed by the child module.
variable "preprod-nics" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    # Defines the IP configuration and subnet association for the Network Interface.
    ip_configuration = object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation = string
    })
  }))
}

# Receives subnet IDs from the networking child module for NIC subnet association.
variable "subnets_ids" {
  type = map(map(string))
}