output "WAS Admin Console DNS URL" {
  value = "http://${var.Workflow01-name}:9060/ibm/console"
}

output "WAS Admin Console IP URL" {
  value = "http://${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}:9060/ibm/console"
}

output "Process Admin DNS URL" {
  value = "https://${var.Workflow01-name}:9443/ProcessAdmin"
}

output "Process Admin IP URL" {
  value = "https://${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}:9443/ProcessAdmin"
}

output "Process Center DNS URL" {
  value = "https://${var.Workflow01-name}:9443/ProcessCenter"
}

output "Process Center IP URL" {
  value = "https://${vsphere_virtual_machine.Workflow01.clone.0.customize.0.network_interface.0.ipv4_address}:9443/ProcessCenter"
}
