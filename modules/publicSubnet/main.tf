resource "aws_subnet" "public_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.PUB_SUBNET_CIDR_BLOCK
  tags              = var.PUB_SUBNET_TAGS
  availability_zone = var.PUB_SUBNET_AZ
  map_public_ip_on_launch = true
}
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = var.public_routeTable_id
}
