resource "aws_subnet" "private_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.PVT_SUBNET_CIDR
  tags              = var.PVT_SUBNET_TAGS
  availability_zone = var.PVT_SUBNET_AZ
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = var.private_routeTable_id
}
