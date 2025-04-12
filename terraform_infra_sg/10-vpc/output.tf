output "mysql_db_subnet_group" {
  value = aws_db_subnet_group.mysql_db_subnet_group.id
}
output "vpc_id" {
  value = aws_vpc.main.id
}
output "public_subnet_cidr" {
  value = aws_subnet.public_subnet_cidr
}
output "private_subnet_cidr" {
  value = aws_subnet.private_subnet_cidr
}
output "database_subnet_cidr" {
  value = aws_subnet.database_subnet_cidr
}
output "vpc_peering_connection_id" {
    value = aws_vpc_peering_connection.vpc_peering_connection_id
}
output "default_vpc" {
  value = data.aws_vpc.default
}