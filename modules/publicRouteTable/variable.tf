variable "vpc_id" {
  default     = ""
  type        = string
}
variable "igw_id" {
    default = ""
}
variable "PUBLIC_ROUTE_TABLE_TAGS" {
  type        = map(string)
  default = {}
}
