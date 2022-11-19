variable "PUB_SUBNET_CIDR_BLOCK" {
  type        = string
  default     = ""
}
variable "PUB_SUBNET_TAGS" {
  default     = {}
  type        = map(string)
}
variable "PUB_SUBNET_AZ" {
  default     = {}
}
variable "public_routeTable_id" {
  default     = {}
}
variable "vpc_id" {
  default     = ""
  type        = string
}
