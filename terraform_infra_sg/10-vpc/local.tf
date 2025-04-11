locals {
  vpc_name        = "${var.project}-${var.environment}"
  vpc_environment = var.environment
  public_subnet   = "${var.project}-${var.environment}"
  private_subnet  = "${var.project}-${var.environment}"
  database_subnet = "${join(",", var.database_subnet_cidr)}-${var.environment}"
  az_avail_zone   = slice(data.aws_availability_zones.available.names, 0, 2)
}
