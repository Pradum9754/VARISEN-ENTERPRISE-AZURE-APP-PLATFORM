# Defines the Pre-Production Azure Bastion configuration consumed by the child module.
variable "preprod-bastion" {
  description = "Preprod Azure Bastion configuration"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    # Defines the network and Public IP configuration for the Bastion host.
    ip_configuration = object({
      name                 = string
      subnet_id            = string
      public_ip_address_id = optional(string)
    })
  }))
}

# Receives subnet IDs from the networking child module for Bastion subnet association.
variable "subnets_ids" {
  type = map(map(string))
}