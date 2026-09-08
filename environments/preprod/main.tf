# Resource Groups - Creates and manages dedicated Resource Groups for organizing and isolating Pre-Production resources.
module "preprod-modules-rgs" {
  source      = "../../Modules/azurerm_resource_groups"
  preprod-rgs = var.preprod-rgs
}

# Virtual Networks & Subnets - Provides the core network architecture with segmented subnets for secure workload isolation.
module "preprod-modules-vnets" {
  depends_on        = [module.preprod-modules-rgs]
  source            = "../../Modules/azurerm_virtual_subnets_networks"
  preprod-vnet-subs = var.preprod-vnet-subs
}

# Network Security Groups - Defines inbound and outbound network security rules to control and restrict traffic.
module "preprod-modules-nsgs" {
  depends_on   = [module.preprod-modules-rgs]
  source       = "../../Modules/azurerm_network_security_group"
  preprod-nsgs = var.preprod-nsgs
}

# NAT Gateways - Provides controlled outbound internet connectivity for resources deployed within private subnets.
module "preprod-modules-nat-gateways" {
  depends_on          = [module.preprod-modules-rgs]
  source              = "../../Modules/azurerm_nat_gateway"
  preprod-nat-gateway = var.preprod-nat-gateway
}

# Network Interfaces - Creates NICs to provide network connectivity between Virtual Machines and their assigned subnets.
module "preprod-modules-nics" {
  depends_on   = [module.preprod-modules-rgs, module.preprod-modules-vnets]
  source       = "../../Modules/azurerm_network_interface"
  preprod-nics = var.preprod-nics
  subnets_ids  = module.preprod-modules-vnets.subnets_ids
}

# Linux Virtual Machines - Deploys Linux-based compute workloads connected to the configured network interfaces.
module "preprod-modules-vms" {
  depends_on = [
    module.preprod-modules-rgs,
    module.preprod-modules-nics
  ]
  source                = "../../Modules/azurerm_linux_virtual_machine"
  preprod-vms           = var.preprod-vms
  network_interface_ids = module.preprod-modules-nics.network_interface_ids
}

# Azure Bastion - Provides secure browser-based SSH/RDP access to Virtual Machines without exposing them through public IP addresses.
module "preprod-modules-bastion" {
  depends_on = [
    module.preprod-modules-rgs,
    module.preprod-modules-vnets
  ]

  source          = "../../Modules/azurerm_bastion_host"
  preprod-bastion = var.preprod-bastion
  subnets_ids     = module.preprod-modules-vnets.subnets_ids
}

# Azure Key Vaults - Provides centralized and secure management of secrets, keys, certificates, and sensitive configuration data.
module "preprod-modules-key-vaults" {
  depends_on = [
    module.preprod-modules-rgs
  ]

  source             = "../../Modules/azurerm_key_vault"
  preprod-key-vaults = var.preprod-key-vaults
}

# Log Analytics - Provides centralized collection, storage, and analysis of logs and telemetry from the Azure environment.
module "preprod-modules-log-analytics" {
  depends_on = [
    module.preprod-modules-rgs
  ]

  source                = "../../Modules/azurerm_log_analytics"
  preprod-log-analytics = var.preprod-log-analytics
}

# Monitoring - Configures monitoring and observability for Virtual Machines using the centralized Log Analytics Workspace.
module "preprod-modules-monitoring" {
  depends_on = [
    module.preprod-modules-vms,
    module.preprod-modules-log-analytics
  ]

  source             = "../../Modules/azurerm_monitoring"
  preprod-monitoring = var.preprod-monitoring

  # preprod-log-analytics = var.preprod-log-analytics 

  virtual_machine_ids        = module.preprod-modules-vms.virtual_machine_ids
  log_analytics_workspace_id = module.preprod-modules-log-analytics.log_analytics_ids["preprod-log-analytics"]
}

# Azure Backup - Configures backup protection for Virtual Machines to support recovery and business continuity.
module "preprod-modules-backup" {
  source = "../../Modules/azurerm_backup"
  depends_on = [
    module.preprod-modules-vms
  ]

  preprod-backup      = var.preprod-backup
  virtual_machine_ids = module.preprod-modules-vms.virtual_machine_ids
}

# Role Assignments / RBAC - Implements role-based access control with appropriate permissions across Azure resources.
module "preprod-modules-role-assignments" {
  source = "../../Modules/azurerm_role_assignments"
  depends_on = [
    module.preprod-modules-rgs,
    module.preprod-modules-vms,
    module.preprod-modules-key-vaults,
    module.preprod-modules-bastion
  ]

  preprod-role-assignments = var.preprod-role-assignments
  resource_group_ids       = module.preprod-modules-rgs.resource_group_ids
  virtual_machine_ids      = module.preprod-modules-vms.virtual_machine_ids
  key_vault_ids            = module.preprod-modules-key-vaults.key_vault_ids
  bastion_ids              = module.preprod-modules-bastion.bastion_ids
}

# Azure Policy - Enforces governance, compliance, and organizational standards across Pre-Production resources.
module "preprod-modules-policy" {
  source         = "../../Modules/azurerm_policy"
  preprod-policy = var.preprod-policy
  depends_on = [
    module.preprod-modules-rgs,
    module.preprod-modules-vnets,
    module.preprod-modules-key-vaults
  ]

  resource_group_ids  = module.preprod-modules-rgs.resource_group_ids
  virtual_network_ids = module.preprod-modules-vnets.virtual_network_ids
  key_vault_ids       = module.preprod-modules-key-vaults.key_vault_ids
}

# Resource Locks - Protects critical Azure resources from accidental deletion or unauthorized modification.
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
#   resource_group_ids     = module.preprod-modules-rgs.resource_group_ids
#   virtual_network_ids    = module.preprod-modules-vnets.virtual_network_ids
#   virtual_machine_ids    = module.preprod-modules-vms.virtual_machine_ids
#   key_vault_ids          = module.preprod-modules-key-vaults.key_vault_ids
#   bastion_ids            = module.preprod-modules-bastion.bastion_ids
# }