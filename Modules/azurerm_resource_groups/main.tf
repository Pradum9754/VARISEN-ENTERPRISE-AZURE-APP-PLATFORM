resource "azurerm_resource_group" "preprod-rgs" {
  for_each   = var.preprod-rgs
  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by
  tags = {
    environment = each.value.tags.environment
    owner       = each.value.tags.owner
    project     = each.value.tags.project
    criticality = each.value.tags.Criticality
  }
}
