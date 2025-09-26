resource "azurerm_network_interface" "nic" {
  for_each = var.nic_map

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  dynamic "ip_configuration" {
    for_each = [each.value] # agar sirf 1 IP config ho, still dynamic block ka use better hai
    content {
      name                          = "ipconfig1"
      subnet_id                     = ip_configuration.value.subnet_id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = ip_configuration.value.pip_id
    }
  }

  lifecycle { prevent_destroy = true }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  for_each                  = var.nic_map
  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = each.value.nsg_id
}