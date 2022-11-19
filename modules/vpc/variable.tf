variable "VPC_CIDR_BLOCK" {
  default = ""
  type	  = string
}
variable "VPC_TAGS" {
  default     = {}
  type        = map(string)
}
