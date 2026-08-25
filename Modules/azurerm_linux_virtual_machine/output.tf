output "virtual_machine_ids" {
  value = {
    for k, vm in azurerm_linux_virtual_machine.preprod-vms :
    k => vm.id
  }
}

output "virtual_machine_names" {
  value = {
    for k, vm in azurerm_linux_virtual_machine.preprod-vms :
    k => vm.name
  }
}