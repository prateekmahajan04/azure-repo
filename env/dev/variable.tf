# RG variables
variable "rg_count" { type = number }
variable "rg_prefix" { type = string }
variable "rg_exclude" { type = list(number) }
variable "location" { type = string }

# VM variables
variable "vm_count" { type = number }
variable "vm_prefix" { type = string }
variable "vm_admin" { type = string }
variable "vm_password" { type = string }

# Network variables
variable "vnet_address_space" { type = string }
variable "subnet_prefix" { type = string }

# Common tags
variable "tags" { type = map(string) }
