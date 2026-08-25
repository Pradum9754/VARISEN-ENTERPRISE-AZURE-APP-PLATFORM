output "bastion_ids" {
  value = { for k, bastion in azurerm_bastion_host.preprod_bastions : k => bastion.id
  }
}

output "bastion_names" {
  value = { for k, bastion in azurerm_bastion_host.preprod_bastions : k => bastion.name
  }
}
