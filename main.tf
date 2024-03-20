provider "aws" {
  access_key = "AKIA5ZBREE6G2DHCSTHJ"
  secret_key = "hI28/04mO4OrfhKouoqec/XpoQpnApxKyWRevooR"
  region = "ap-northeast-2"
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
