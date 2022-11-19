VPC_CIDR_BLOCK = "10.0.0.0/16"
VPC_TAGS = {
  Name  = "mongo-vpc"
  Owner = "digvijay singh"
}
PUB_SUBNET_CIDR_BLOCK = "10.0.1.0/24"
PUB_SUBNET_AZ         = "ap-southeast-1a"
PUB_SUBNET_TAGS = {
  Name  = "mongo-subnet"
  Owner = "digvijay singh"
}
#PUB_AZ2 = "ap-southeast-1b"
PVT_SUBNET1_CIDR = "10.0.2.0/24"
PVT_SUBNET1_AZ   = "ap-southeast-1b"
PVT_SUBNET1_TAGS = {
  Name  = "data-node1"
  Owner = "digvijay singh"
}
PVT_SUBNET2_CIDR = "10.0.3.0/24"
PVT_SUBNET2_AZ   = "ap-southeast-1c"
PVT_SUBNET2_TAGS = {
  Name  = "data-node2"
  Owner = "digvijay singh"
}
PUB_SG_TAGS = {
  Name  = "mongo-public-sg"
  Owner = "digvijay singh"
}
PVT_SG_TAGS = {
  Name  = "mongo-private-sg"
  Owner = "digvijay singh"
}
AMI           = "ami-07651f0c4c315a529"
INSTANCE_TYPE = "t2.micro"
MAIN_INSTANCE_TAGS = {
  Name  = "mongo-Main"
  Owner = "digvijay singh"
}
NODE1_INSTANCE_TAGS = {
  Name  = "mongo-Node1"
  Owner = "digvijay singh"
}
NODE2_INSTANCE_TAGS = {
  Name  = "mongo-Node2"
  Owner = "digvijay singh"
}
KEY_NAME = "digvijay"
PUBLIC_KEY = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCXDMPbsGKftcFDnciAxWvKmZPOnBiIo40bLEtKf5uhIFWwtyxIwG7QAS/3CLLolHNXEhCoGSISlIgyulFws9n4Pzq3gbpSWmJRuqYP3rfDSvR3RGjnrkBkHYm/zjBlrYjZi5YJMQ8KMdG9sAGIXgIVGOs6iW0WGG8E3g1YxdhTEn9GljZyospJG8z6nFW7TBSiIMAzCRfsHHjT+1A8nWctUzOZk4ooZWSU72le/tRtIAj+twm5qw8pkgSBJjqLEC41ym/HO1cXSqHGLbi3MFe0sl5MlUpyPm0MlVeiMud2882pKq1p1KK+bzZ3cTDRcEP33UyTiHgXPAn5pHmnAfgX0BmVT/cZChk4oZiZO8RnaboDd9dhF4xY0vetmgWtH85zBEEO+ru1K6Al7KuIV7B6vKD+5s41ERZyrCVhd8c5zNaV2/QFhN/n82tMblj/e++nm3efWX60R4ANK5l31KI+z/gXFcvNMMvgKFDvcx/59BebtLuDATnsyyrsOpkfn2s= digvijay@digvijay-HP-240-G5-Notebook-PC"
