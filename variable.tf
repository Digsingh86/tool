variable "VPC_CIDR_BLOCK" {
  default = ""
  type    = string
}
variable "VPC_TAGS" {
  default = {}
  type    = map(string)
}
variable "PUB_SUBNET_CIDR_BLOCK" {
  type    = string
  default = ""
}
variable "PUB_SUBNET_TAGS" {
  default = {}
  type    = map(string)
}
variable "PUB_SUBNET_AZ" {
  default = {}
}
variable "public_routeTable_id" {
  default = {}
}
variable "vpc_id" {
  default = ""
  type    = string
}
#####################
variable "IGW_TAGS" {
  default = {
    Name  = "mongo-igw"
    Owner = "digvijay singh"
  }
}
##################
variable "PUBLIC_ROUTE_TABLE_TAGS" {
  default = {
    Name  = "mongo-pub-routeTB"
    Owner = "digvijay singh"
  }
}
#######################
variable "PVT_SUBNET1_CIDR" {
  type    = string
  default = ""
}
variable "PVT_SUBNET1_AZ" {
  default = {}
}

variable "PVT_SUBNET1_TAGS" {
  default = {}
  type    = map(string)
}
variable "PVT_SUBNET2_CIDR" {
  type    = string
  default = ""
}
variable "PVT_SUBNET2_AZ" {
  default = {}
}
variable "PVT_SUBNET2_TAGS" {
  default = {}
  type    = map(string)
}
variable "PVT_ROUTE_TABLE_TAGS" {
  default = {
    Name  = "mongo-private-routeTB"
    Owner = "digvijay singh"
  }
}
########################
variable "NGW_TAGS" {
  default = {
    Name  = "mongo-nat"
    Owner = "digvijay singh"
  }
}
####################
variable "PUB_SG_NAME" {
  type    = string
  default = "mongo-public-sg"
}
variable "HTTPS_PORT" {
  type    = string
  default = "443"
}
variable "PUB_SG_TAGS" {
  default = {}
  type    = map(string)
}
####################
variable "PVT_SG_NAME" {
  type    = string
  default = "mongo-private-sg"
}
variable "PVT_SG_TAGS" {
  default = {}
  type    = map(string)
}
#############################
variable "AMI" {
  type    = string
  default = ""
}
variable "MAIN_INSTANCE_TAGS" {
  type    = map(string)
  default = {}
}
variable "INSTANCE_TYPE" {
  type    = any
  default = {}
}
####################
variable "NODE1_INSTANCE_TAGS" {
  type    = map(string)
  default = {}
}
###################
variable "NODE2_INSTANCE_TAGS" {
  type    = map(string)
  default = {}
}
###################
variable "KEY_NAME" {
default = ""
}
variable "PUBLIC_KEY" {
default = ""
}

