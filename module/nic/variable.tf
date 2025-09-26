variable "nic_map" {
  type = map(object({
    name      : string  # NIC ka naam
    rg_name   : string  # Resource Group jisme NIC create hoga
    location  : string  # Region
    subnet_id : string  # Subnet jisme NIC attach hoga
    nsg_id    : string  # NSG ID jo attach karna hai
    pip_id    : string  # Public IP ID attach karna hai
  }))
}
