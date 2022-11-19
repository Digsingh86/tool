resource "aws_vpc" "vpc" {
  cidr_block = var.VPC_CIDR_BLOCK
  tags       = var.VPC_TAGS 
}
