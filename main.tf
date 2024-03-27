provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
}

module "vpc" {
  source  = "app.terraform.io/Enterprise_Test/vpc/aws"
  version = "1.0.0"
  # insert required variables here
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnets" {
  source  = "app.terraform.io/Enterprise_Test/subnets/aws"
  version = "1.0.0"
  # insert required variables here
  vpc_id = module.vpc.vpc_id
  subnet = var.subnet
  create_route_table = var.create_route_table
  route_table_name = var.route_table_name
}

module "route-association" {
  source  = "app.terraform.io/Enterprise_Test/route-association/aws"
  version = "1.0.0"
  # insert required variables here
  route_table_id = module.subnets.route_table_id.0
  subnet_id = module.subnets.subnet_id
}

module "security-group" {
  source  = "app.terraform.io/Enterprise_Test/security-group/aws"
  version = "1.0.0"
  # insert required variables here
  vpc_id = module.vpc.vpc_id
  sg_name = var.sg_name
  sg_tag_name = var.sg_tag_name
}

module "security-rule" {
  source  = "app.terraform.io/Enterprise_Test/security-rule/aws"
  version = "1.0.0"
  # insert required variables here
  sg_id = module.security-group.sg_id
  sg_rule = var.sg_rule
}

module "ec2" {
  source  = "app.terraform.io/Enterprise_Test/ec2/aws"
  version = "1.0.0"
  # insert required variables here
  nic_info = var.nic_info
  ebs_info = var.ebs_info
  ec2 = var.ec2
  nic_attachment_info = var.nic_attachment_info
  ebs_attachment_info = var.ebs_attachment_info
}
