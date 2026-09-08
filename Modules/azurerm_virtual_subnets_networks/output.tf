output "virtual_network_ids" {
  value = {
    for k, vnet in azurerm_virtual_network.preprod-vnet-subnets :
    k => vnet.id
  }
}

output "virtual_network_names" {
  value = {
    for k, vnet in azurerm_virtual_network.preprod-vnet-subnets :
    k => vnet.name
  }
}

# output "subnets_names" {
#   value = {
#     for k, vnet in azurerm_virtual_network.preprod-vnet-subnets :
#     k => [for subnet in vnet.subnet : subnet.name]
#   }
# }

# output "subnets_ids" {
#   value = {
#     for k, vnet in azurerm_virtual_network.preprod-vnet-subnets :
#     k => [for subnet in vnet.subnet : subnet.id]
#   }
# }

output "subnets_ids" {
  value = {
    for k, vnet in azurerm_virtual_network.preprod-vnet-subnets :
    k => {
      for subnet in vnet.subnet :
      subnet.name => subnet.id
    }
  }
}

output "subnets_names" {
  value = {
    for k, vnet in azurerm_virtual_network.preprod-vnet-subnets :
    k => {
      for subnet in vnet.subnet :
      subnet.name => subnet.name
    }
  }
}