# Exposes the IDs of all Pre-Production Virtual Machines for downstream module references.
output "virtual_machine_ids" {
  value = {
    for k, vm in azurerm_linux_virtual_machine.preprod-vms :
    k => vm.id
  }
}

# Exposes the names of all Pre-Production Virtual Machines for downstream module references.
output "virtual_machine_names" {
  value = {
    for k, vm in azurerm_linux_virtual_machine.preprod-vms :
    k => vm.name
  }
}