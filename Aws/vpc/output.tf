
output "subnet-pvt_id-1" {
  value       = aws_subnet.pvt_net1.id
  description = "The id of subnet Group"
}

output "subnet-pvt_id-2" {
  value       = aws_subnet.pvt_net2.id
  description = "The id of subnet Group"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The id of VPC"
}

output "subnet-data_id-1" {
  value       = aws_subnet.data_net1.id
  description = "The id of subnet Group"
}

output "subnet-data_id-2" {
  value       = aws_subnet.data_net2.id
  description = "The id of subnet Group"
}


output "subnet-pub_id-1" {
  value       = aws_subnet.pub_net1.id
  description = "The id of subnet Group"
}

output "subnet-pub_id-2" {
  value       = aws_subnet.pub_net2.id
  description = "The id of subnet Group"
}

output "route-pub_id-1" {
  value       = aws_route_table.pub_net1.id
  description = "The id of subnet Group"
}

output "route-pub_id-2" {
  value       = aws_route_table.pub_net2.id
  description = "The id of subnet Group"
}

output "route-pvt_id-1" {
  value       = aws_route_table.pvt_net1.id
  description = "The id of subnet Group"
}

output "route-pvt_id-2" {
  value       = aws_route_table.pvt_net2.id
  description = "The id of subnet Group"
}


output "route-data_id-1" {
  value       = aws_route_table.data_net1.id
  description = "The id of subnet Group"
}

output "route-data_id-2" {
  value       = aws_route_table.data_net2.id
  description = "The id of subnet Group"
}
