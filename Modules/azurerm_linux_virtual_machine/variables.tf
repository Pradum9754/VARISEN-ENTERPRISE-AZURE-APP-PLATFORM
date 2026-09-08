# Defines the Pre-Production Linux Virtual Machine configuration consumed by the child module.
variable "preprod-vms" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string
    admin_username      = string
    admin_ssh_key       = string
    nic_key             = string

    # Defines the operating system disk configuration for the VM.
    os_disk = object({
      caching              = string
      storage_account_type = string
    })

    # Defines the source image reference used to create the VM.
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}

# Receives network interface IDs from the networking child module for VM association.
variable "network_interface_ids" {
  type = map(string)
}