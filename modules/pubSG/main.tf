resource "aws_security_group" "public_security_group" {
  name        = var.PUB_SG_NAME
  description = "security group of mongo"
  vpc_id      = var.vpc_id

  ingress {
    description = "Traffic from VPC"
    from_port   = var.HTTPS_PORT
    to_port     = var.HTTPS_PORT
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    description = "Traffic from VPC"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
ingress {
    description = "port for os-dashboard "
    from_port   = var.os_dashboard_port
    to_port     = var.os_dashboard_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.PUB_SG_TAGS
}


