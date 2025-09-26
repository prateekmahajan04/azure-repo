# --------------------
# Resource Groups
# --------------------
rg_count   = 1
rg_prefix  = "prateekrg"
rg_exclude = []
location   = "eastus"

# --------------------
# Virtual Machines
# --------------------
vm_count    = 1
vm_prefix   = "vm"
vm_admin    = "azureuser"
vm_password = "P@ssw0rd123"

# --------------------
# Network
# --------------------
vnet_address_space = "10.0.0.0/16"
subnet_prefix      = "10.0.1.0/24"

# --------------------
# Tags
# --------------------
tags = {
  Owner       = "Prateek"
  Environment = "dev"
}

# --------------------
# Boot diagnostics (optional)
# --------------------
boot_diagnostics_storage_uri = ""  # agar storage account diagnostic ke liye chahiye to URI daalna
