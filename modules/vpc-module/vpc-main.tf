#create vpc
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

#create public-subnet at AZ-a
resource "aws_subnet" "public-a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_block-a
  availability_zone = "eu-west-1a"

  tags = {
    Name = "public-a"
  }
}

#create private-subnet at AZ-a
resource "aws_subnet" "private-a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block-a
  availability_zone = "eu-west-1a"


  tags = {
    Name = "private-a"
  }
}
#===================================================

#create public-subnet at AZ-c
resource "aws_subnet" "public-c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_block-c
  availability_zone = "eu-west-1c"

  tags = {
    Name = "public-c"
  }
}

#create private-subnet at AZ-c
resource "aws_subnet" "private-c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block-c
  availability_zone = "eu-west-1c"


  tags = {
    Name = "private-c"
  }
}
#=============================================

#create IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
   
   tags = {
    Name = "myIGW"
   }
}


#============================================
# create route tables
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route   {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }
  

  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table" "private1_rt" {
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  # route {
  #   # The CIDR block of the route.
  #   cidr_block = "0.0.0.0/0"

  #   # Identifier of a VPC NAT gateway.
  #   nat_gateway_id = aws_nat_gateway.gw1.id
  # }

  # A map of tags to assign to the resource.
  tags = {
    Name = "private1_rt"
  }
}

resource "aws_route_table" "private2_rt" {
  # The VPC ID.
  vpc_id = aws_vpc.main.id

  # route {
  #   # The CIDR block of the route.
  #   cidr_block = "0.0.0.0/0"

  #   # Identifier of a VPC NAT gateway.
  #   nat_gateway_id = aws_nat_gateway.gw2.id
  # }

  # A map of tags to assign to the resource.
  tags = {
    Name = "private2_rt"
  }
}





#==========================================================================
resource "aws_route_table_association" "public1" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public-a.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public2" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.public-c.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private1" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private-a.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private1_rt.id
}

resource "aws_route_table_association" "private2" {
  # The subnet ID to create an association.
  subnet_id = aws_subnet.private-c.id

  # The ID of the routing table to associate with.
  route_table_id = aws_route_table.private2_rt.id
}


# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.main.id

#   # route   {
#   #     cidr_block = "0.0.0.0/0"
#   #     gateway_id = aws_internet_gateway.igw.id
#   #   }
  

#   tags = {
#     Name = "private_rt"
#   }
# }


# resource "aws_route_table_association" "pri" {
#  subnet_id = aws_subnet.private.id
#  route_table_id = aws_route_table.private_rt.id
# }








# resource "aws_route_table" "rt_main_vpc_public" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "rt_main_vpc_public"
#   }
# }

# resource "aws_route_table_association" "a" {
#  subnet_id = aws_subnet.public.id
#  route_table_id = aws_route_table.rt_main_vpc_public.id
# }