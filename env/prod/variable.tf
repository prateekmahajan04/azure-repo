variable "rg" {
  type = map(any)
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}
variable "rg_exclude" {
  
}