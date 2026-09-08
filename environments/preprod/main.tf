module "preprod-modules-rgs" {
  source      = "../../Modules/azurerm_resource_groups"
  preprod-rgs = var.preprod-rgs
}

module "preprod-modules-vnets" {
  depends_on        = [module.preprod-modules-rgs]
  source            = "../../Modules/azurerm_virtual_subnets_networks"
  preprod-vnet-subs = var.preprod-vnet-subs
}

module "preprod-modules-nsgs" {
  depends_on   = [module.preprod-modules-rgs]
  source       = "../../Modules/azurerm_network_security_group"
  preprod-nsgs = var.preprod-nsgs
}

module "preprod-modules-nat-gateways" {
  depends_on          = [module.preprod-modules-rgs]
  source              = "../../Modules/azurerm_nat_gateway"
  preprod-nat-gateway = var.preprod-nat-gateway
}

module "preprod-modules-nics" {
  depends_on   = [module.preprod-modules-rgs, module.preprod-modules-vnets]
  source       = "../../Modules/azurerm_network_interface"
  preprod-nics = var.preprod-nics
  subnets_ids  = module.preprod-modules-vnets.subnets_ids
}

module "preprod-modules-vms" {
  depends_on = [
    module.preprod-modules-rgs,
    module.preprod-modules-nics
  ]
  source                = "../../Modules/azurerm_linux_virtual_machine"
  preprod-vms           = var.preprod-vms
  network_interface_ids = module.preprod-modules-nics.network_interface_ids
}

module "preprod-modules-bastion" {
  depends_on = [
    module.preprod-modules-rgs,
    module.preprod-modules-vnets
  ]

  source          = "../../Modules/azurerm_bastion_host"
  preprod-bastion = var.preprod-bastion
  subnets_ids     = module.preprod-modules-vnets.subnets_ids
}

module "preprod-modules-key-vaults" {
  depends_on = [
    module.preprod-modules-rgs
  ]

  source             = "../../Modules/azurerm_key_vault"
  preprod-key-vaults = var.preprod-key-vaults
}

module "preprod-modules-log-analytics" {
  depends_on = [
    module.preprod-modules-rgs
  ]

  source = "../../Modules/azurerm_log_analytics"

  preprod-log-analytics = var.preprod-log-analytics
}

module "preprod-modules-monitoring" {
  depends_on = [
    module.preprod-modules-vms,
    module.preprod-modules-log-analytics
  ]

  source = "../../Modules/azurerm_monitoring"

  preprod-monitoring = var.preprod-monitoring
  # preprod-log-analytics = var.preprod-log-analytics

  virtual_machine_ids = module.preprod-modules-vms.virtual_machine_ids

  log_analytics_workspace_id = module.preprod-modules-log-analytics.log_analytics_ids["preprod-log-analytics"]
}

# module "preprod-modules-backup" {
#   source = "../../Modules/azurerm_backup"

#   depends_on = [
#     module.preprod-modules-vms
#   ]

#   preprod-backup = var.preprod-backup

#   virtual_machine_ids = module.preprod-modules-vms.virtual_machine_ids
# }

# module "preprod-modules-role-assignments" {
#   source = "../../Modules/azurerm_role_assignments"

#   depends_on = [
#     module.preprod-modules-rgs,
#     module.preprod-modules-vms,
#     module.preprod-modules-key-vaults,
#     module.preprod-modules-bastion
#   ]

#   preprod-role-assignments = var.preprod-role-assignments

#   resource_group_ids = module.preprod-modules-rgs.resource_group_ids
#   virtual_machine_ids = module.preprod-modules-vms.virtual_machine_ids
#   key_vault_ids = module.preprod-modules-key-vaults.key_vault_ids
#   bastion_ids = module.preprod-modules-bastion.bastion_ids
# }

# module "preprod-modules-policy" {
#   source = "../../Modules/azurerm_policy"

#   depends_on = [
#     module.preprod-modules-rgs,
#     module.preprod-modules-vnets,
#     module.preprod-modules-key-vaults
#   ]

#   preprod-policy = var.preprod-policy

#   resource_group_ids = module.preprod-modules-rgs.resource_group_ids

#   virtual_network_ids = module.preprod-modules-vnets.virtual_network_ids

#   key_vault_ids = module.preprod-modules-key-vaults.key_vault_ids
# }

# module "preprod-modules-resource-lock" {
#   source = "../../Modules/azurerm_resource_lock"

#   depends_on = [
#     module.preprod-modules-rgs,
#     module.preprod-modules-vnets,
#     module.preprod-modules-vms,
#     module.preprod-modules-key-vaults,
#     module.preprod-modules-bastion
#   ]

#   preprod-resource-locks = var.preprod-resource-locks

#   resource_group_ids = module.preprod-modules-rgs.resource_group_ids

#   virtual_network_ids = module.preprod-modules-vnets.virtual_network_ids

#   virtual_machine_ids = module.preprod-modules-vms.virtual_machine_ids

#   key_vault_ids = module.preprod-modules-key-vaults.key_vault_ids

#   bastion_ids = module.preprod-modules-bastion.bastion_ids
# }