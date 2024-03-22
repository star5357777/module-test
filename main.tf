provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region = var.region
}

module "vpc" {
  source  = "app.terraform.io/example-org-3f1fdf/vpc/aws"
  version = "1.0.0"
  # insert required variables here

  vpc_cidr = "10.5.0.0/16"
  vpc_name = "module-test-vpc"
}

module "subnet" {
  source  = "app.terraform.io/example-org-3f1fdf/subnet/aws"
  version = "1.0.0"
  # insert required variables here
  vpc_id = module.vpc.vpc_id
  subnet = var.subnet
}

module "subnets" {
  source  = "app.terraform.io/example-org-3f1fdf/subnets/aws"
  version = "1.0.0"
  # insert required variables here
  vpc_id = module.vpc.vpc_id
  subnet = var.subnet
  create_route_table = var.create_route_table
  route_table_name = var.route_table_name
}
