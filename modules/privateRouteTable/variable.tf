variable "PVT_ROUTE_TABLE_TAGS" {
  type        = map(string)
  default = {
    Name    = "mongo-private-routeTable"
    Owner   = "Rakesh Chauhan"
  }
}
variable "vpc_id" {
  default     = ""
  type        = string
}
variable "ngw_id" {
  default     = ""
  type        = string
}
