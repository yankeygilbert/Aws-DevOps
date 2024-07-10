resource "aws_vpc" "IaCvpc" {
   cidr_block = "192.168.0.0/20"
   tags = {
     Name = "Main_vpc"
   }
}

resource "aws_internet_gateway" "IG" {
  
}

resource "aws_subnets" "Privatesubnets" {
   count = length(var.cidrblock)
   vpc_id = aws_vpc.IaCvpc.id
   cidr_block = var.cidrblock[count.index]
   availability_zone = (count.index < (length(var.cidrblock)-1) ? var.Az[0]:var.Az[1])
}

resource "aws_subnet" "Publicsubnet" {
  vpc_id = aws_vpc.IaCvpc.id
  cidr_block = "192.168.20.0/24"
  availability_zone = var.Az[0]
  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_nat_gateway" "NAT" {
  subnet_id = aws_subnet.Publicsubnet
}

resource "aws_route_table" "Rt" {
  vpc_id = aws_vpc.IaCvpc
  depends_on = [ 
          
   ]
}