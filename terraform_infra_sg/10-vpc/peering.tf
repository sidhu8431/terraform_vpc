resource "aws_vpc_peering_connection" "vpc_peering_connection_id" {
  count = var.vpc_peering_connection_id ? 1 : 0
  peer_vpc_id   = data.aws_vpc.default.id
  vpc_id        = aws_vpc.main.id
  auto_accept = true 
  tags = merge(
    var.common_tags,
    {
        Name = "${local.vpc_name}-peering-default"
    }
  )
}

resource "aws_route" "public_RT_peering" {
    count = var.vpc_peering_connection_id ? 1 : 0
  route_table_id            = aws_route_table.public_RT.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection_id[count.index].id
}

resource "aws_route" "private_RT_peering" {
    count = var.vpc_peering_connection_id ? 1 : 0
  route_table_id            = aws_route_table.private_RT.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection_id[count.index].id
}

resource "aws_route" "logistic-database-rt" {
    count = var.vpc_peering_connection_id ? 1 : 0
  route_table_id            = aws_route_table.database_RT.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection_id[count.index].id
}

resource "aws_route" "default" {
    count = var.vpc_peering_connection_id ? 1 : 0
  route_table_id            = data.aws_vpc.default.main_route_table_id
  destination_cidr_block    = aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection_id[count.index].id
}