# Creates Pre-Production Linux Virtual Machines using the provided VM configuration.
resource "azurerm_linux_virtual_machine" "preprod-vms" {
  for_each = var.preprod-vms
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username

  # Associates the VM with the corresponding network interface.
  network_interface_ids = [
    var.network_interface_ids[each.value.nic_key]
  ]

  # Configures SSH authentication for secure VM access.
  admin_ssh_key {
    username   = each.value.admin_username
    public_key = each.value.admin_ssh_key
  }

  # Defines the operating system disk configuration.
  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }

  # Defines the source image used to provision the Linux VM.
  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}