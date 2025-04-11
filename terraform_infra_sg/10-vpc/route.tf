resource "aws_route_table" "public_RT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${local.vpc_name}-Public-RT"
  }
}

resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "${local.vpc_name}-Private_RT"
  }
}

resource "aws_route_table" "database_RT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "${local.vpc_name}-database_RT"
  }
}



resource "aws_route_table_association" "public_subnet_assoc" {
  count          = length(var.public_subnet)
  subnet_id      = aws_subnet.public_subnet_cidr[count.index].id
  route_table_id = aws_route_table.public_RT.id
}

resource "aws_route_table_association" "private_subnet_assoc" {
  count = length(var.public_subnet)

  subnet_id      = aws_subnet.private_subnet_cidr[count.index].id
  route_table_id = aws_route_table.private_RT.id
}
resource "aws_route_table_association" "database_subnet_assoc" {
  count          = length(var.database_subnet_cidr)
  subnet_id      = aws_subnet.database_subnet_cidr[count.index].id
  route_table_id = aws_route_table.database_RT.id
}