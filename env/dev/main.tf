# --------------------
# 1️⃣ Resource Groups
# --------------------
module "rg" {
  source = "../../modules/rg"

  rg = {
    for i in range(var.rg_count) :
    "rg${i}" => {
      name     = "${var.rg_prefix}${i}"
      location = var.location
    } if !(contains(var.rg_exclude, i))
  }

  tags = var.tags
}

# --------------------
# 2️⃣ Key Vault per RG
# --------------------
module "keyvault" {
  source = "../../modules/kv"

  for_each = module.rg.rg

  kv_map = {
    "${each.key}" = {
      kv_name  = "kv-${each.key}"
      rg_name  = each.value.name
      location = each.value.location
    }
  }
}

# --------------------
# 3️⃣ Secrets per KV
# --------------------
module "vm_secret" {
  source = "../../modules/secret"

  for_each = module.keyvault

  secret_map = {
    "${each.key}" = {
      kv_id        = each.value.kv_id
      secret_name  = "vmPassword"
      secret_value = var.vm_password
    }
  }
}

# --------------------
# 4️⃣ Network Modules
# --------------------
module "vnet" {
  source = "../../modules/vnet"

  for_each = module.rg.rg

  vnet_map = {
    "${each.key}" = {
      name          = "vnet-${each.key}"
      rg_name       = each.value.name
      location      = each.value.location
      address_space = var.vnet_address_space
    }
  }
}

module "subnet" {
  source = "../../modules/subnet"

  for_each = module.vnet

  subnet_map = {
    "${each.key}" = {
      name     = "subnet-${each.key}"
      vnet_name= each.value.vnet_id
      rg_name  = module.rg.rg[each.key].name
      prefix   = var.subnet_prefix
    }
  }
}

module "nsg" {
  source = "../../modules/nsg"

  for_each = module.rg.rg

  nsg_map = {
    "${each.key}" = {
      name     = "nsg-${each.key}"
      rg_name  = each.value.name
      location = each.value.location
    }
  }
}

module "pip" {
  source = "../../modules/pip"

  for_each = module.rg.rg

  pip_map = {
    "${each.key}" = {
      name              = "pip-${each.key}"
      rg_name           = each.value.name
      location          = each.value.location
      allocation_method = "Static"
    }
  }
}

module "nic" {
  source = "../../modules/nic"

  for_each = module.rg.rg

  nic_map = {
    "${each.key}" = {
      name      = "nic-${each.key}"
      subnet_id = module.subnet[each.key].subnet_id
      nsg_id    = module.nsg[each.key].nsg_id
      pip_id    = module.pip[each.key].pip_id
      rg_name   = each.value.name
      location  = each.value.location
    }
  }
}

# --------------------
# 5️⃣ Virtual Machines
# --------------------
module "vm" {
  source = "../../modules/vm"

  for_each = module.nic

  vm_map = {
    "${each.key}" = {
      name           = "vm-${each.key}-0"
      nic_id         = each.value.nic_id
      admin_username = var.vm_admin
      admin_password = module.vm_secret[each.key].secret_value
      rg_name        = module.rg.rg[each.key].name
      location       = each.value.location
      size           = "Standard_B2s"
    }
  }
}
