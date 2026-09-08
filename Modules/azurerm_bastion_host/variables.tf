variable "preprod-bastion" {
  description = "Preprod Azure Bastion configuration"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    ip_configuration = object({
      name                 = string
      subnet_id            = string
      public_ip_address_id = optional(string)
    })
  }))
}

variable "subnets_ids" {
  type = map(map(string))
}