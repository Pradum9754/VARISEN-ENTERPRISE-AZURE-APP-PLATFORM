variable "preprod-nics" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    ip_configuration = object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation = string
    })
  }))
  
}

variable "subnets_ids" {
  type = map(map(string))
}
