resource "aws_key_pair" "key" {
 key_name   = var.KEY_NAME
 public_key = var.PUBLIC_KEY
}
