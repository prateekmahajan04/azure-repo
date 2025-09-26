variable "rg_count" {
  description = "Number of resource groups to create"
  type        = number
}

variable "rg_prefix" {
  description = "Prefix for resource group names"
  type        = string
}

variable "location" {
  description = "Azure location for all resource groups"
  type        = string
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}
variable "rg_exclude" {
  
}