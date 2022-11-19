resource "aws_nat_gateway" "ngw" {
  connectivity_type = "public"
  allocation_id     = aws_eip.elasticIP.id
  subnet_id         = var.public_subnet_id
  tags              = var.NGW_TAGS
}
resource "aws_eip" "elasticIP" {
}
