# Defines the input schema for Pre-Production Azure Resource Groups and their metadata.
variable "preprod-rgs" {
  type = map(object({
    name       = string
    location   = string
    tags       = optional(map(string))
    managed_by = optional(string)
  }))
}

# Defines the input schema for the Pre-Production Virtual Network and its subnet configuration.
variable "preprod-vnet-subs" {
  description = "Configuration for pre-production VNET"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    tags                = optional(map(string))
    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

# Defines the input schema for Pre-Production Network Security Groups and their security rules.
variable "preprod-nsgs" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    tags                = optional(map(string))

    security_rules = map(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

# Defines the input schema for Pre-Production NAT Gateway resources and their network connectivity settings.
variable "preprod-nat-gateway" {
  type = map(object({
    name                    = string
    location                = string
    resource_group_name     = string
    sku_name                = string
    idle_timeout_in_minutes = number
    zones                   = optional(list(string))
  }))
}

# Defines the input schema for Pre-Production Network Interfaces and their IP configuration.
variable "preprod-nics" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    ip_configuration = object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation = string
    })
  }))
}

# Defines the input schema for Pre-Production Virtual Machines, including compute, authentication, networking, storage, and OS image configuration.
variable "preprod-vms" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string
    admin_username      = string
    admin_ssh_key       = string
    nic_key             = string

    os_disk = object({
      caching              = string
      storage_account_type = string
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}

# Defines the input schema for the Pre-Production Azure Bastion host and its IP configuration.
variable "preprod-bastion" {
  description = "Preprod Azure Bastion configuration"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    ip_configuration = object({
      name                 = string
      subnet_id            = string
      public_ip_address_id = optional(string)
    })
  }))
}

# Defines the input schema for the Pre-Production Azure Key Vault and its security configuration.
variable "preprod-key-vaults" {
  description = "Preprod Azure Key Vault configuration"
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    sku_name                   = string
    soft_delete_retention_days = number
    purge_protection_enabled   = bool
    enable_rbac_authorization  = bool
    tags                       = optional(map(string))
  }))
}

# Defines the input schema for the Pre-Production Log Analytics Workspace and its data retention configuration.
variable "preprod-log-analytics" {
  description = "Preprod Log Analytics Workspace configuration"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string
    retention_in_days   = number
    tags                = optional(map(string))
  }))
}

# Defines the input schema for Pre-Production Azure Monitor Diagnostic Settings for VM logs and metrics.
variable "preprod-monitoring" {
  description = "Preprod Azure Monitor Diagnostic Settings"
  type = map(object({
    name   = string
    vm_key = string

    logs = list(object({
      category = string
    }))

    metrics = list(object({
      category = string
    }))
  }))
}

# Defines the input schema for Pre-Production Azure Backup, including protected VMs, schedules, and retention policies.
variable "preprod-backup" {
  description = "Preprod Azure Backup configuration"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    vm_keys             = list(string)
    backup_policy = object({
      name                      = string
      frequency                 = string
      time                      = string
      retention_daily_count     = number
      retention_weekly_count    = number
      retention_weekly_weekdays = list(string)
      retention_weekly_time     = string
    })
  }))
}

# Defines the input schema for Pre-Production Azure RBAC role assignments and identity-based access control.
variable "preprod-role-assignments" {
  description = "Preprod Azure RBAC role assignments"
  type = map(object({
    name                 = string
    scope_type           = string
    scope_key            = string
    role_definition_name = string
    principal_id         = string
    principal_type       = optional(string)
    description          = optional(string)
  }))
}

# Defines the input schema for Pre-Production Azure Policy assignments and governance enforcement configuration.
variable "preprod-policy" {
  description = "Preprod Azure Policy configuration"
  type = map(object({
    name             = string
    display_name     = string
    description      = optional(string)
    policy_name      = string
    scope_type       = string
    scope_key        = string
    enforcement_mode = optional(string, "Default")
    parameters       = optional(string)
  }))
}

# Defines the input schema for Pre-Production Azure Resource Locks used to protect critical infrastructure resources.
variable "preprod-resource-locks" {
  description = "Preprod Azure resource locks"
  type = map(object({
    name       = string
    scope_type = string
    scope_key  = string
    lock_level = string
    notes      = optional(string)
  }))
}
