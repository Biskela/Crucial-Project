# VPC
resource "aws_vpc" "Final-Proj-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "Final-proj-vpc"
  }
}

#PUBLIC SUBNET 1
resource "aws_subnet" "Final-proj-Pub-Sub" {
  vpc_id            = aws_vpc.Final-Proj-vpc.id
  cidr_block        = var.Final-proj-Pub-Sub_cidr
  availability_zone = "us-west-1a"

  tags = {
    Name = "Final-proj-Pub-Sub"
  }
}


#PUBLIC SUBNET 2
resource "aws_subnet" "Final-proj-Pub-Sub-2" {
  vpc_id            = aws_vpc.Final-Proj-vpc.id
  cidr_block        = var.Final-proj-Pub-Sub_cidr-2
  availability_zone = "us-west-1b"

  tags = {
    Name = "Final-proj-Pub-Sub-2"
  }
}


#PRIVATE SUBNET 1
resource "aws_subnet" "Final-proj-Pri-Sub" {
  vpc_id     = aws_vpc.Final-Proj-vpc.id
  cidr_block = var.Final-proj-Pri-Sub_cidr
   availability_zone = "us-west-1a"

  tags = {
    Name = "Final-proj-Pri-Sub"
  }
}


#PRIVATE SUBNET 2
resource "aws_subnet" "Final-proj-Pri-Sub-2" {
  vpc_id     = aws_vpc.Final-Proj-vpc.id
  cidr_block = var.Final-proj-Pri-Sub_cidr-2
  availability_zone = "us-west-1b"

  tags = {
    Name = "Final-proj-Pri-Sub-2"
  }
}

# PUBLIC ROUTE TABLE
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.Final-Proj-vpcc.id


  tags = {
    Name = "public-route-table"
  }
}


# PRIVATE ROUTE TABLE
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.Final-Proj-vpc.id


  tags = {
    Name = "private-route-table"
  }
}


# PUBLIC  ROUTE TABLE ASSOCIATION 1
resource "aws_route_table_association" "Public-route-association" {
  subnet_id      = aws_subnet.Final-proj-Pri-Sub.id
  route_table_id = aws_route_table.public-route-table.id
}


# PUBLIC  ROUTE TABLE ASSOCIATION 2
resource "aws_route_table_association" "Public-route-association-2" {
  subnet_id      = aws_subnet.Final-proj-Pri-Sub-2.id
  route_table_id = aws_route_table.public-route-table.id
}



#  PRIVATE ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "Private-route-association" {
  subnet_id      = aws_subnet.Final-proj-Pri-Sub.id
  route_table_id = aws_route_table.private-route-table.id
}

#  PRIVATE ROUTE TABLE ASSOCIATION 2
resource "aws_route_table_association" "Private-route-association-2" {
  subnet_id      = aws_subnet.Final-proj-Pri-Sub-2.id
  route_table_id = aws_route_table.private-route-table.id
}


# INTERNET GATEWAY
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.Final-Proj-vpc.id

  tags = {
    Name = "IGW"
  }
}


# ROUTE

resource "aws_route" "Public-IGW-route" {
  route_table_id         = aws_route_table.public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.IGW.id

}
