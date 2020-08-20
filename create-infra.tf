/*
  Set requirements to Terraform version
*/
terraform {
  required_version = ">= 0.12"
//  backend "s3" { }
}

/*
  Set AWS Region for provisioning of infrastructure
*/
provider "aws" {
  profile = "saml"
  region = var.default-region
}

/*
  Create VPC
  We sill use Terraform module from the Terraform Registry
  https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/2.33.0
*/
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.23.0"

  // Name to be used on all the resources as identifier
  name = "TerraformFundamentals"

  // A list of availability zones specified as argument to this module
  azs = [
    "eu-central-1a",
    "eu-central-1b",
    "eu-central-1c"
  ]

  // The CIDR block for the VPC
  cidr = "10.0.0.0/16"

  // A list of public subnets inside the VPC
  public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]

  // A list of private subnets inside the VPC
  private_subnets = [
    "10.0.100.0/24",
    "10.0.101.0/24",
    "10.0.102.0/24"
  ]

  // Support IPv6 addresses
  enable_ipv6 = true
  assign_ipv6_address_on_creation = true
  private_subnet_assign_ipv6_address_on_creation = false
  public_subnet_ipv6_prefixes = [0, 1, 2]
  private_subnet_ipv6_prefixes  = [3, 4, 5]

  // Sinle NAT gateway for all availability zones
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false
}


