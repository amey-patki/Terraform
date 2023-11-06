# Define the provider (AWS)
provider "aws" {
  region = "us-east-1" # Specify your desired AWS region
}

# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.31.0.0/16" # Define your VPC's IP address range
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "my-vpc"
  }
}

# Create a subnet within the VPC
resource "aws_subnet" "my_subnet" {
  count = 1
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "172.31.0.0/20" # Define your subnet's IP address range
  availability_zone = "us-east-1c" # Specify the availability zone
  tags = {
    Name = "my-subnet"
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create a route table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "my-route-table"
  }
}

# Associate the route table with the subnet
resource "aws_route_table_association" "my_route_table_association" {
  subnet_id      = aws_subnet.my_subnet[0].id
  route_table_id = aws_route_table.my_route_table.id
}
