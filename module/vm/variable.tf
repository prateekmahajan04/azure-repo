variable "vm_map" {
  type = map(object({
    name           : string
    location       : string
    rg_name        : string
    size           : string
    admin_username : string
    admin_password : string
    nic_id         : string
    tags           : map(string)
    boot_diagnostics_storage_uri : string
  }))
}
