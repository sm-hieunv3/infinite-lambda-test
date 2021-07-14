data "aws_availability_zones" "available" {
  state = "available"
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "${var.project}-vpc"
  cidr = var.cidr

##create private subnet in production !!!
  azs             =  data.aws_availability_zones.available.names
#  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = [var.cicd_subnet, var.db_subnet]
  enable_dns_hostnames = true
  enable_dns_support = true

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}