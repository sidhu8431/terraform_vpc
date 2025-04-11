
resource "aws_db_subnet_group" "mysql_db_subnet_group" {

  subnet_ids = aws_subnet.database_subnet_cidr[*].id

  tags = merge(var.common_tags,
    var.mysql_db_subnet_group_tags,
    {
      Name = "${local.vpc_name}-mysql_db_subnet_group"
    }
  )
}

resource "aws_subnet" "public_subnet_cidr" {
  count             = length(var.public_subnet)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet[count.index]
  availability_zone = local.az_avail_zone[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    {
      Name = "${local.vpc_name}-public-subnet-${count.index}"
    }
  )
}

resource "aws_subnet" "private_subnet_cidr" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = local.az_avail_zone[count.index]

  tags = merge(
    var.common_tags,
    {
      Name = "${local.vpc_name}-private-subnet-${count.index}"
    }
  )
}

resource "aws_subnet" "database_subnet_cidr" {
  count             = length(var.database_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.database_subnet_cidr[count.index]
  availability_zone = local.az_avail_zone[count.index]

  tags = merge(
    var.common_tags,
    {
      Name = "${local.vpc_name}-database-subnet-${count.index}"
    }
  )
}
