variable "vpc_id" {
  default     = ""
  type        = string
}
variable "PVT_SUBNET_CIDR" {
  type        = string
    default     = ""
}
variable "PVT_SUBNET_TAGS" {
  default     = {}
  type        = map(string)
}
variable "PVT_SUBNET_AZ" {
  default     = {}
}
variable "private_routeTable_id" {
  default     = {}
}
variable "PVT_SUBNET_" {
  default     = {}
}