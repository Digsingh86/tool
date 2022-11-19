resource "aws_instance" "ec2" {
  ami                    = var.AMI
  instance_type          = var.INSTANCE_TYPE
  tags                   = var.INSTANCE_TAGS
  key_name               = "tool"
vpc_security_group_ids = [var.security_group]
  subnet_id              = var.SUBNET
}
