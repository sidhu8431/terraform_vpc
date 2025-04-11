resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.igw_tags,
    {
      Name = "${local.vpc_name}-IGW"
    }
  )
}

resource "aws_eip" "elastic_ip" {
  domain = "vpc"

  tags = {
    Name = "${local.vpc_name}-eip"
  }

}

resource "aws_nat_gateway" "nat_gw" {

  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnet_cidr[0].id

  tags = {
    Name = "${local.vpc_name}-NAT_GateWay"
  }

  depends_on = [aws_internet_gateway.igw]
}