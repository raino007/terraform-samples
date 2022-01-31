#VPC

resource "aws_vpc" "main" {
cidr_block = var.cidr_block
instance_tenancy = "default"
enable_dns_hostnames = true
tags = {
    Name = var.environment
  }
}


#IGW
resource "aws_internet_gateway" "main_igw" {
vpc_id = aws_vpc.main.id
tags = {
    Name = var.environment
  }
}


#nat1 gateway

resource "aws_eip" "nat1_eip" {
vpc = true
tags = {
    Name = "${var.environment}-nat1"
  }
}

resource "aws_nat_gateway" "nat1" {
allocation_id = aws_eip.nat1_eip.id
subnet_id = aws_subnet.pub_net1.id
tags = {
    Name = var.environment
  }
}

#nat2 gateway

resource "aws_eip" "nat2_eip" {
vpc = true
tags = {
    Name = "${var.environment}-nat2"
  }
}

resource "aws_nat_gateway" "nat2" {
allocation_id = aws_eip.nat2_eip.id
subnet_id = aws_subnet.pub_net2.id
tags = {
    Name = var.environment
  }
}

#public subnets

resource "aws_subnet" "pub_net1" {
vpc_id = aws_vpc.main.id
availability_zone = var.availability_zones[0]
cidr_block = var.public1-cidr_block
map_public_ip_on_launch = "true"
lifecycle {
    ignore_changes = [
      tags
    ]
  }
tags = {
    Name = "${var.environment}-pub-net1"
  }
}

resource "aws_subnet" "pub_net2" {
vpc_id = aws_vpc.main.id
availability_zone = var.availability_zones[1]
cidr_block = var.public2-cidr_block
map_public_ip_on_launch = "true"
lifecycle {
    ignore_changes = [
      tags
    ]
  }
tags = {
    Name = "${var.environment}-pub-net2"
  }
}

#private subnets

resource "aws_subnet" "pvt_net1" {
vpc_id = aws_vpc.main.id
availability_zone = var.availability_zones[0]
cidr_block = var.private1-cidr_block
lifecycle {
    ignore_changes = [
      tags
    ]
  }
tags = {
    Name = "${var.environment}-pvt-net1"
  }
}

resource "aws_subnet" "pvt_net2" {
vpc_id = aws_vpc.main.id
availability_zone = var.availability_zones[1]
cidr_block = var.private2-cidr_block
lifecycle {
    ignore_changes = [
      tags
    ]
  }
tags = {
    Name = "${var.environment}-pvt-net2"
  }
}

#data subnets

resource "aws_subnet" "data_net1" {
vpc_id = aws_vpc.main.id
availability_zone = var.availability_zones[0]
cidr_block = var.data1-cidr_block
lifecycle {
    ignore_changes = [
      tags
    ]
  }
tags = {
    Name = "${var.environment}-data-net1"
  }
}

resource "aws_subnet" "data_net2" {
vpc_id = aws_vpc.main.id
availability_zone = var.availability_zones[1]
cidr_block = var.data2-cidr_block
lifecycle {
    ignore_changes = [
      tags
    ]
  }
tags = {
    Name = "${var.environment}-data-net2"
  }
}

#route table for private subnet

resource "aws_route_table" "pvt_net1" {
vpc_id = aws_vpc.main.id

route {
cidr_block = "0.0.0.0/0"
nat_gateway_id = aws_nat_gateway.nat1.id
}
tags = {
    Name = "${var.environment}-pvt-net1"
  }
lifecycle {
    ignore_changes = [
      route
    ]
  }
}

resource "aws_route_table" "pvt_net2" {
vpc_id = aws_vpc.main.id

route {
cidr_block = "0.0.0.0/0"
nat_gateway_id = aws_nat_gateway.nat2.id
}
tags = {
    Name = "${var.environment}-pvt-net2"
  }
lifecycle {
    ignore_changes = [
      route
    ]
  }

}

#route table for public

resource "aws_route_table" "pub_net1" {
vpc_id = aws_vpc.main.id

route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.main_igw.id
}

tags = {
    Name = "${var.environment}-pub-net1"
  }
lifecycle {
    ignore_changes = [
      route
    ]
  }
}



resource "aws_route_table" "pub_net2" {
vpc_id = aws_vpc.main.id

route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.main_igw.id
}

tags = {
    Name = "${var.environment}-pub-net2"
  }
lifecycle {
    ignore_changes = [
      route
    ]
  }
}


#route table for data

resource "aws_route_table" "data_net1" {
vpc_id = aws_vpc.main.id

tags = {
    Name = "${var.environment}-data-net1"
  }
lifecycle {
    ignore_changes = [
      route
    ]
  }
}

resource "aws_route_table" "data_net2" {
vpc_id = aws_vpc.main.id

tags = {
    Name = "${var.environment}-data-net2"
  }
lifecycle {
    ignore_changes = [
      route
    ]
  }

}
#route table association of public subnets

resource "aws_route_table_association" "pub_net1" {
subnet_id = aws_subnet.pub_net1.id
route_table_id = aws_route_table.pub_net1.id
}

resource "aws_route_table_association" "pub_net2" {
subnet_id = aws_subnet.pub_net2.id
route_table_id = aws_route_table.pub_net2.id
}

#route table association of private subnets

resource "aws_route_table_association" "pvt_net1" {
subnet_id = aws_subnet.pvt_net1.id
route_table_id = aws_route_table.pvt_net1.id
}

resource "aws_route_table_association" "pvt_net2" {
subnet_id = aws_subnet.pvt_net2.id
route_table_id = aws_route_table.pvt_net2.id
}


#route table association of data subnets

resource "aws_route_table_association" "data_net1" {
subnet_id = aws_subnet.data_net1.id
route_table_id = aws_route_table.data_net1.id
}

resource "aws_route_table_association" "data_net2" {
subnet_id = aws_subnet.data_net2.id
route_table_id = aws_route_table.data_net2.id
}
