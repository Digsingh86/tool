module "vpc" {
  source         = "./modules/vpc"
  VPC_CIDR_BLOCK = var.VPC_CIDR_BLOCK
  VPC_TAGS       = var.VPC_TAGS
}
module "pb_subnet" {
  source                = "./modules/publicSubnet"
  vpc_id                = module.vpc.vpc_id
  PUB_SUBNET_CIDR_BLOCK = var.PUB_SUBNET_CIDR_BLOCK
  PUB_SUBNET_TAGS       = var.PUB_SUBNET_TAGS
  PUB_SUBNET_AZ         = var.PUB_SUBNET_AZ
  public_routeTable_id  = module.pb_rt_table.public_routeTable_id
}
module "igw" {
  source   = "./modules/igw"
  vpc_id   = module.vpc.vpc_id
  IGW_TAGS = var.IGW_TAGS
}
module "pb_rt_table" {
  source                  = "./modules/publicRouteTable"
  vpc_id                  = module.vpc.vpc_id
  igw_id                  = module.igw.igw_id
  PUBLIC_ROUTE_TABLE_TAGS = var.PUBLIC_ROUTE_TABLE_TAGS
}
module "pvt_subnet1" {
  source                = "./modules/privateSubnet"
  vpc_id                = module.vpc.vpc_id
  PVT_SUBNET_TAGS       = var.PVT_SUBNET1_TAGS
  PVT_SUBNET_CIDR       = var.PVT_SUBNET1_CIDR
  PVT_SUBNET_AZ         = var.PVT_SUBNET1_AZ
  private_routeTable_id = module.pvt_rt_table.private_routeTable_id
}
module "pvt_subnet2" {
  source                = "./modules/privateSubnet"
  vpc_id                = module.vpc.vpc_id
  PVT_SUBNET_TAGS       = var.PVT_SUBNET2_TAGS
  PVT_SUBNET_CIDR       = var.PVT_SUBNET2_CIDR
  PVT_SUBNET_AZ         = var.PVT_SUBNET2_AZ
  private_routeTable_id = module.pvt_rt_table.private_routeTable_id
}
module "pvt_rt_table" {
  source               = "./modules/privateRouteTable"
  vpc_id               = module.vpc.vpc_id
  ngw_id               = module.nat.ngw_id
  PVT_ROUTE_TABLE_TAGS = var.PVT_ROUTE_TABLE_TAGS
}
module "nat" {
  source           = "./modules/ngw"
  public_subnet_id = module.pb_subnet.public_subnet_id
  NGW_TAGS         = var.NGW_TAGS
}
module "pub_sg" {
  source      = "./modules/pubSG"
  PUB_SG_NAME = var.PUB_SG_NAME
  vpc_id      = module.vpc.vpc_id
  PUB_SG_TAGS = var.PUB_SG_TAGS
}
module "pvt_sg" {
  source      = "./modules/pvtSG"
  PVT_SG_NAME = var.PVT_SG_NAME
  vpc_id      = module.vpc.vpc_id
  CIDR        = var.VPC_CIDR_BLOCK
  PVT_SG_TAGS = var.PVT_SG_TAGS
}

module "bastion_host" {
  source         = "./modules/bastionHost"
  AMI            = var.AMI
  INSTANCE_TYPE  = var.INSTANCE_TYPE
  SUBNET         = module.pb_subnet.public_subnet_id
  security_group = module.pub_sg.public_sg_id
  INSTANCE_TAGS  = var.MAIN_INSTANCE_TAGS
  #  key_name = "${aws_key_pair.bastion.key_name}"
}
module "main" {
  source         = "./modules/instances"
  AMI            = var.AMI
  INSTANCE_TYPE  = var.INSTANCE_TYPE
  SUBNET         = module.pb_subnet.public_subnet_id
  security_group = module.pub_sg.public_sg_id
  INSTANCE_TAGS  = var.MAIN_INSTANCE_TAGS
  #  KEY_ID = module.access_key.key
  #  KEY_NAME = var.KEY_NAME
}
module "node1" {
  source         = "./modules/instances"
  AMI            = var.AMI
  INSTANCE_TYPE  = var.INSTANCE_TYPE
  SUBNET         = module.pvt_subnet1.private_subnet_id
  security_group = module.pvt_sg.private_sg_id
  INSTANCE_TAGS  = var.NODE1_INSTANCE_TAGS
  #  KEY_ID = module.access_key.key
}
module "node2" {
  source         = "./modules/instances"
  AMI            = var.AMI
  INSTANCE_TYPE  = var.INSTANCE_TYPE
  SUBNET         = module.pvt_subnet2.private_subnet_id
  security_group = module.pvt_sg.private_sg_id
  INSTANCE_TAGS  = var.NODE2_INSTANCE_TAGS
  #  KEY_ID = module.access_key.key
}
#module "access_key" {
# source     = "./modules/keypair"
#KEY_NAME   = var.KEY_NAME
#PUBLIC_KEY   = var.PUBLIC_KEY
#}
