variable "AMI" {
  type        = string
  default     = ""
}
variable "INSTANCE_TAGS" {
  type        = map(string)
  default = {
    Name    = "mongo manager"
    Owner   = "digvijay singh"
  }
}
variable "security_group" {
  type        = string
  default     = ""
}
variable "SUBNET" {
  type        = string
  default     = ""
}
variable "INSTANCE_TYPE" {
default = ""
}


