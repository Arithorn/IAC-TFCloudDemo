resource "aws_vpc" "private" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "private_vpc"
  }
}
resource "aws_vpc" "public" {
  cidr_block       = "10.1.0.0/16"
  tags = {
    Name = "public_vpc"
  }
}

resource "aws_subnet" "public_subnets" {
 count      = length(var.public_subnet_cidrs)
 vpc_id     = aws_vpc.public.id
 cidr_block = element(var.public_subnet_cidrs, count.index)
 availability_zone = element(var.azs,count.index)
 
 tags = {
   Name = "Public Subnet ${count.index + 1}"
 }
}

resource "aws_subnet" "private_subnets" {
 count      = length(var.private_subnet_cidrs)
 vpc_id     = aws_vpc.private.id
 cidr_block = element(var.private_subnet_cidrs, count.index)
 availability_zone = element(var.azs,count.index)
 tags = {
   Name = "Private Subnet ${count.index + 1}"
 }
}
