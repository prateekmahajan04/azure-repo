resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vm_map

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  network_interface_ids = [each.value.nic_id]
  computer_name       = each.value.name
  disable_password_authentication = false
  provision_vm_agent  = true
  tags                = each.value.tags

  # ----------------
  # Lifecycle
  # ----------------
  lifecycle {
    create_before_destroy = true
    ignore_changes = [tags]
  }

  # ----------------
  # Optional: OS Disk
  # ----------------
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

}

# ----------------
# Output
# ----------------
