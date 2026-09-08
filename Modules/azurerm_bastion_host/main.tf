# Creates a Static Standard Public IP for each Pre-Production Azure Bastion host.
resource "azurerm_public_ip" "preprod_bastion_pip" {
  for_each = var.preprod-bastion
  name                = "${each.value.name}-pip"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method = "Static"
  sku               = "Standard"
}

# Creates and configures Azure Bastion hosts for the Pre-Production environment.
resource "azurerm_bastion_host" "preprod_bastions" {
  for_each = var.preprod-bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku = "Standard"
  # Associates the Bastion host with the required subnet and Public IP address.
  ip_configuration {
    name = each.value.ip_configuration.name
    subnet_id = var.subnets_ids["preprod-vnet"][
      each.value.ip_configuration.subnet_id
    ]
    public_ip_address_id = azurerm_public_ip.preprod_bastion_pip[each.key].id
  }
}


