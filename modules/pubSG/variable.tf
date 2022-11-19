variable "PUB_SG_NAME" {
  type        = string
  default     = "mongo-public-sg"
}
variable "HTTPS_PORT" {
  type        = string
  default     = "443"
}
variable "vpc_id" {
  default     = ""
  type        = string
}
variable "PUB_SG_TAGS" {
  default     = {}
  type        = map(string)
}

variable "ssh_port" {
  type        = string
  default     = "22"
}
variable "os_dashboard_port" {
  type        = string
  default     = "27017"
}