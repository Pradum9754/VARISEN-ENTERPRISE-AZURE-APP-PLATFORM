# Creates Pre-Production Virtual Networks with configurable address spaces and subnets.
resource "azurerm_virtual_network" "preprod-vnet-subnets" {
  for_each = var.preprod-vnet-subs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space

  # Applies environment, ownership, project, and criticality metadata to the VNET.
  tags = {
    environment = each.value.tags.environment
    owner       = each.value.tags.owner
    project     = each.value.tags.project
    criticality = each.value.tags.Criticality
  }

  # Dynamically creates subnets based on the provided VNET subnet configuration.
  dynamic "subnet" {
    for_each = each.value.subnets

    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}