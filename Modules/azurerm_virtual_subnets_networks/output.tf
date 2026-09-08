# Exposes the IDs of all Pre-Production Virtual Networks for downstream module references.
output "virtual_network_ids" {
  value = {
    for k, vnet in azurerm_virtual_network.preprod-vnet-subnets :
    k => vnet.id
  }
}

# Exposes the names of all Pre-Production Virtual Networks for downstream module references.
output "virtual_network_names" {
  value = {
    for k, vnet in azurerm_virtual_network.preprod-vnet-subnets :
    k => vnet.name
  }
}

# Exposes subnet IDs grouped by their corresponding Virtual Network for downstream module references.
output "subnets_ids" {
  value = {
    for k, vnet in azurerm_virtual_network.preprod-vnet-subnets :
    k => {
      for subnet in vnet.subnet :
      subnet.name => subnet.id
    }
  }
}

# Exposes subnet names grouped by their corresponding Virtual Network for downstream module references.
output "subnets_names" {
  value = {
    for k, vnet in azurerm_virtual_network.preprod-vnet-subnets :
    k => {
      for subnet in vnet.subnet :
      subnet.name => subnet.name
    }
  }
}