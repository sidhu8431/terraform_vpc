variable "cidr_block" {
  default = "10.30.0.0/16"
}
variable "project" {
  default = "my_project"
}
variable "environment" {
  default = "dev"
}
variable "vpc_tags" {
  default = {
    VPC_environment = "created by terraform"
  }
}
variable "common_tags" {
  default = {

    Maninter = "terraform"

  }
}
variable "region" {
  default = "us-east-2"
}
variable "enable_dns_hostnames" {
  default = true
}
variable "public_subnet" {
  default = ["10.30.11.0/24", "10.30.12.0/24"]
}
variable "private_subnet_cidr" {
  default = ["10.30.21.0/24", "10.30.22.0/24"]
}
variable "database_subnet_cidr" {
  default = ["10.30.31.0/24", "10.30.32.0/24"]
}
variable "public_subnet_tags" {
  default = {
    Name      = "public_subnet_tags",
    terraform = true
  }
}
variable "mysql_db_subnet_group_tags" {
  default = {
    compound = "mysql_db_subnet_group_tags"
  }
}
variable "igw_tags" {
  default = {
    compound = "Internet_Gateway"
  }
}
variable "vpc_peering_connection_id" {
  default = false
}