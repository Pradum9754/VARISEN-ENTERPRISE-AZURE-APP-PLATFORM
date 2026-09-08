# Resource Groups - Defines the Pre-Production Resource Groups used to logically organize and manage Azure resources.
preprod-rgs = {
  Frontend-preprod-rg = {                    # Child output block reference K = prepeprod-rg1
    name       = "VARISON-AI-APP-preprod-rg" # k = preprod-rg1
    location   = "central india"             # rg = azurerm_resource_group.preprod-rgs["preprod-rg1"]
    managed_by = "VARISEN AI TEAM"
    tags = {
      environment = "VARISON PREPROD PRODUCTION"
      owner       = "VARISON GROUP"
      project     = "VARISON AI APP"
      Criticality = "High"
    }
  }
  # Backend-preprod-rg = {                             # Child output block reference K = prepeprod-rg1
  #   name       = "VARISON-AI-APP-preprod-backend-rg" # k = preprod-rg1
  #   location   = "central india"                     # rg = azurerm_resource_group.preprod-rgs["preprod-rg1"]
  #   managed_by = "VARISEN AI TEAM"
  #   tags = {
  #     environment = "VARISON PREPROD PRODUCTION"
  #     owner       = "VARISON GROUP"
  #     project     = "VARISON AI APP"
  #     Criticality = "High"
  #   }
  # }
}

# Virtual Network & Subnets - Defines the Pre-Production VNet address space and segregates frontend, backend, and Bastion workloads into dedicated subnets.
preprod-vnet-subs = {
  preprod-vnet = {
    name                = "VARISON-AI-APP-preprod-vnet"
    location            = "central india"
    resource_group_name = "VARISON-AI-APP-preprod-rg"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "VARISON PREPROD PRODUCTION"
      owner       = "VARISON GROUP"
      project     = "VARISON AI APP"
      Criticality = "High"
    }

    subnets = {
      frontend-preprod-subnet = {
        name             = "VARISON-AI-APP-preprod-frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      backend-preprod-subnet = {
        name             = "VARISON-AI-APP-preprod-backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
      bastion-preprod-subnet = {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.3.0/26"]
      }
    }
  }
}

# Network Security Groups - Defines inbound security rules for frontend and backend workloads to control HTTP, HTTPS, SSH, and RDP traffic.
preprod-nsgs = {
  Frontend-preprod-nsg = {
    name                = "VARISON-AI-APP-preprod-frontend-nsg"
    location            = "Central India"
    resource_group_name = "VARISON-AI-APP-preprod-rg"

    security_rules = {
      http = {
        name                       = "Allow-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      https = {
        name                       = "Allow-HTTPS"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      ssh = {
        name                       = "Allow-SSH"
        priority                   = 120
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      rdp = {
        name                       = "Allow-RDP"
        priority                   = 130
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }

    tags = {
      environment = "VARISON PREPROD PRODUCTION"
      owner       = "VARISON GROUP"
      project     = "VARISON AI APP"
      Criticality = "High"
    }
  }
  Backend-preprod-nsg = {
    name                = "VARISON-AI-APP-preprod-backend-nsg"
    location            = "Central India"
    resource_group_name = "VARISON-AI-APP-preprod-rg"

    security_rules = {
      http = {
        name                       = "Allow-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      https = {
        name                       = "Allow-HTTPS"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      ssh = {
        name                       = "Allow-SSH"
        priority                   = 120
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      rdp = {
        name                       = "Allow-RDP"
        priority                   = 130
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }

    tags = {
      environment = "VARISON PREPROD PRODUCTION"
      owner       = "VARISON GROUP"
      project     = "VARISON AI APP"
      Criticality = "High"
    }
  }
}

# NAT Gateways - Provides controlled outbound internet connectivity for frontend and backend workloads.
preprod-nat-gateway = {
  Frontend-preprod-nat-gateway = {
    name                    = "VARISON-AI-APP-preprod-frontend-nat-gateway"
    location                = "Central India"
    resource_group_name     = "VARISON-AI-APP-preprod-rg"
    sku_name                = "Standard"
    idle_timeout_in_minutes = 10
    zones                   = ["1"]
  }
  Backend-preprod-nat-gateway = {
    name                    = "VARISON-AI-APP-preprod-backend-nat-gateway"
    location                = "Central India"
    resource_group_name     = "VARISON-AI-APP-preprod-rg"
    sku_name                = "Standard"
    idle_timeout_in_minutes = 10
    zones                   = ["1"]
  }
}

# Network Interfaces - Defines NICs for frontend and backend VMs and connects them to their respective application subnets.
preprod-nics = {
  frontend-preprod-nic = {
    name                = "VARISON-AI-APP-preprod-frontend-nic"
    location            = "Central India"
    resource_group_name = "VARISON-AI-APP-preprod-rg"
    ip_configuration = {
      name                          = "frontend-ip-config"
      subnet_id                     = "VARISON-AI-APP-preprod-frontend-subnet"
      private_ip_address_allocation = "Dynamic"
    }
  }
  backend-preprod-nic = {
    name                = "VARISON-AI-APP-preprod-backend-nic"
    location            = "Central India"
    resource_group_name = "VARISON-AI-APP-preprod-rg"
    ip_configuration = {
      name                          = "backend-ip-config"
      subnet_id                     = "VARISON-AI-APP-preprod-backend-subnet"
      private_ip_address_allocation = "Dynamic"
    }
  }
}

# Linux Virtual Machines - Defines the frontend and backend Linux compute workloads using Ubuntu 22.04 LTS Gen2 images.
preprod-vms = {
  frontend-preprod-vm = {
    name                = "VARISON-AI-APP-preprod-frontend-vm"
    resource_group_name = "VARISON-AI-APP-preprod-rg"
    location            = "Central India"
    size                = "Standard_D2s_v3"
    admin_username      = "Varisenenterprises"
    admin_ssh_key       = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtlgu+aIwz35YyS8nVc2a/96+U5zE9jTs4P5tyo790cpIdocxPKIGIHRM5fkojl9+ebOb9xZEwRHK2zbcQiqcKTX5wPsFfrlLDe9NCv8D0GkcAdHcIPVFRWU056yD3GAGVBzVUuI98uA+YB1nAdUuW3sz08RzZxRG6uG6I3Ec5NwEXzdGlbulKpkMisF94jnDCIDSVQchazBET4pBH5xjFcKeUr+SRxJ+s8Hu63cwX/FLCazakPswosMKjRnsfK3Kw/bXog2CUHSuUCeQ60xE1QP5XYoozWEOuDakximcGMcZtXMkIzn/oiSy9B/tIKAFrEMQL1PBTnDz/hELE1kzN pradu@Pradum"
    nic_key             = "frontend-preprod-nic"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts-gen2"
      version   = "latest"
    }
  }

  backend-preprod-vm = {
    name                = "VARISON-AI-APP-preprod-backend-vm"
    resource_group_name = "VARISON-AI-APP-preprod-rg"
    location            = "Central India"
    size                = "Standard_D2s_v3"
    admin_username      = "Varisenenterprises"
    admin_ssh_key       = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtlgu+aIwz35YyS8nVc2a/96+U5zE9jTs4P5tyo790cpIdocxPKIGIHRM5fkojl9+ebOb9xZEwRHK2zbcQiqcKTX5wPsFfrlLDe9NCv8D0GkcAdHcIPVFRWU056yD3GAGVBzVUuI98uA+YB1nAdUuW3sz08RzZxRG6uG6I3Ec5NwEXzdGlbulKpkMisF94jnDCIDSVQchazBET4pBH5xjFcKeUr+SRxJ+s8Hu63cwX/FLCazakPswosMKjRnsfK3Kw/bXog2CUHSuUCeQ60xE1QP5XYoozWEOuDakximcGMcZtXMkIzn/oiSy9B/tIKAFrEMQL1PBTnDz/hELE1kzN pradu@Pradum"
    nic_key             = "backend-preprod-nic"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts-gen2"
      version   = "latest"
    }
  }
}

# Azure Bastion - Defines secure administrative access to Pre-Production Virtual Machines without requiring direct public VM access.
preprod-bastion = {
  preprod-bastion1 = {
    name                = "VARISON-AI-APP-preprod-bastion"
    location            = "Central India"
    resource_group_name = "VARISON-AI-APP-preprod-rg"

    ip_configuration = {
      name      = "bastion-ip-config"
      subnet_id = "AzureBastionSubnet"
    }
  }
}

# Azure Key Vault - Defines secure storage and management configuration for secrets, keys, and certificates.
preprod-key-vaults = {
  preprod-key-vault = {
    name                = "varison-preprod-kv"
    location            = "Central India"
    resource_group_name = "VARISON-AI-APP-preprod-rg"

    sku_name                   = "standard"
    soft_delete_retention_days = 90
    purge_protection_enabled   = true
    enable_rbac_authorization  = true

    tags = {
      environment = "VARISON PREPROD PRODUCTION"
      owner       = "VARISON GROUP"
      project     = "VARISON AI APP"
      Criticality = "High"
    }
  }
}

# Log Analytics Workspace - Defines centralized log collection and analysis for the Pre-Production environment.
preprod-log-analytics = {
  preprod-log-analytics = {
    name                = "varison-preprod-law"
    location            = "Central India"
    resource_group_name = "VARISON-AI-APP-preprod-rg"

    sku               = "PerGB2018"
    retention_in_days = 30

    tags = {
      environment = "VARISON PREPROD PRODUCTION"
      owner       = "VARISON GROUP"
      project     = "VARISON AI APP"
      Criticality = "High"
    }
  }
}

# Monitoring - Defines diagnostic monitoring configuration for frontend and backend Virtual Machines and collects available VM metrics.
preprod-monitoring = {
  frontend-vm-monitoring = {
    name   = "frontend-vm-diagnostic"
    vm_key = "frontend-preprod-vm"

    logs = []

    metrics = [
      {
        category = "AllMetrics"
      }
    ]
  }

  backend-vm-monitoring = {
    name   = "backend-vm-diagnostic"
    vm_key = "backend-preprod-vm"

    logs = []

    metrics = [
      {
        category = "AllMetrics"
      }
    ]
  }
}

# Azure Backup - Defines daily VM backup configuration with daily and weekly retention for recovery and business continuity.
preprod-backup = {
  preprod-backup = {
    name                = "VARISON-AI-APP-preprod-backup"
    location            = "Central India"
    resource_group_name = "VARISON-AI-APP-preprod-rg"

    vm_keys = [
      "frontend-preprod-vm",
      "backend-preprod-vm"
    ]

    backup_policy = {
      name      = "VARISON-AI-APP-preprod-vm-backup-policy"
      frequency = "Daily"
      time      = "23:00"

      retention_daily_count = 30

      retention_weekly_count    = 4
      retention_weekly_weekdays = ["Sunday"]
      retention_weekly_time     = "23:00"
    }
  }
}

# Role Assignments / RBAC - Defines Azure RBAC permissions for controlled access to Pre-Production resources.
preprod-role-assignments = {
  preprod-vm-reader = {
    name                 = "varison-preprod-vm-reader"
    scope_type           = "resource_group"
    scope_key            = "Frontend-preprod-rg"
    role_definition_name = "Reader"
    principal_id         = "YOUR-PRINCIPAL-ID"
    principal_type       = "ServicePrincipal"
    description          = "Preprod Reader access"
  }
}

# Azure Policy - Defines governance configuration to restrict resource deployment to approved Azure locations.
preprod-policy = {
  preprod-allowed-locations = {
    name             = "preprod-allowed-locations"
    display_name     = "Preprod Allowed Locations"
    policy_name      = "Allowed locations"
    scope_type       = "resource_group"
    scope_key        = "Frontend-preprod-rg"
    enforcement_mode = "Default"
  }
}

# Resource Locks - Defines CanNotDelete locks to protect critical Pre-Production infrastructure from accidental deletion.
preprod-resource-locks = {
  preprod-resource-group-lock = {
    name       = "varison-preprod-resource-group-lock"
    scope_type = "resource_group"
    scope_key  = "Frontend-preprod-rg"
    lock_level = "CanNotDelete"
    notes      = "Protect preprod resource group from accidental deletion"
  }

  preprod-vnet-lock = {
    name       = "varison-preprod-vnet-lock"
    scope_type = "virtual_network"
    scope_key  = "preprod-vnet"
    lock_level = "CanNotDelete"
    notes      = "Protect preprod VNet from accidental deletion"
  }

  preprod-key-vault-lock = {
    name       = "varison-preprod-key-vault-lock"
    scope_type = "key_vault"
    scope_key  = "preprod-key-vault"
    lock_level = "CanNotDelete"
    notes      = "Protect preprod Key Vault from accidental deletion"
  }

  preprod-frontend-vm-lock = {
    name       = "varison-preprod-frontend-vm-lock"
    scope_type = "virtual_machine"
    scope_key  = "frontend-preprod-vm"
    lock_level = "CanNotDelete"
    notes      = "Protect frontend preprod VM from accidental deletion"
  }

  preprod-backend-vm-lock = {
    name       = "varison-preprod-backend-vm"
    scope_type = "virtual_machine"
    scope_key  = "backend-preprod-vm"
    lock_level = "CanNotDelete"
    notes      = "Protect backend preprod VM from accidental deletion"
  }

  preprod-bastion-lock = {
    name       = "varison-preprod-bastion-lock"
    scope_type = "bastion"
    scope_key  = "preprod-bastion1"
    lock_level = "CanNotDelete"
    notes      = "Protect preprod Bastion from accidental deletion"
  }
}