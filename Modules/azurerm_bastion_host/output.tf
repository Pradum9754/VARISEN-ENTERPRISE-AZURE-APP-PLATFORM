# Exposes the IDs of all Pre-Production Bastion hosts for downstream module references.
output "bastion_ids" {
  value = { for k, bastion in azurerm_bastion_host.preprod_bastions : k => bastion.id
  }
}

# Exposes the names of all Pre-Production Bastion hosts for downstream module references.
output "bastion_names" {
  value = { for k, bastion in azurerm_bastion_host.preprod_bastions : k => bastion.name
  }
}
