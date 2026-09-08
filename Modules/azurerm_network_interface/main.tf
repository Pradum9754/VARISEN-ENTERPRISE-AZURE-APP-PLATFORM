# resource "azurerm_network_interface" "preprod-nics" {
#     for_each            = var.preprod-nics
#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name

#   ip_configuration {
#     name                          = each.value.ip_configuration.name
#     subnet_id = var.subnets_ids["preprod-vnet"][each.value.ip_configuration.subnet_id]
#     private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
#   }
# }

resource "azurerm_network_interface" "preprod-nics" {
  for_each = var.preprod-nics

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name = each.value.ip_configuration.name

    subnet_id = var.subnets_ids["preprod-vnet"][
      each.value.ip_configuration.subnet_id
    ]

    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
  }
}