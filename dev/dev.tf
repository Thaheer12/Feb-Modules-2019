provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket = "mptech-666"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

module "my_vpc" {
  source   = "../modules/vpc"
  vpc_cidr = "196.123.0.0/16"
  tendency = "default"
  vpc_name = "Wipro_VPC"
}

module "my_subnet" {
  source      = "../modules/subnet"
  subnet_cidr = "196.123.1.0/26"
  azs         = "ap-south-1a"
  subnet_name = "Wipro_Subnet"
  vpc_id      = "${module.my_vpc.vpc_id}"
}

module "my_ec2" {
  source        = "../modules/ec2"
  ami           = "ami-0ad42f4f66f6c1cc9"
  instance_type = "t2.micro"
  ec2_name      = "Wipro_ec2"
  subnet_id     = "${module.my_subnet.subnet_id}"
}
