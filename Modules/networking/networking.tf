resource "aws_vpc" "IaCvpc" {
   cidr_block = var.vpc_cidr
   tags = {
     Name = "Main_vpc"
   }
}

resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.IaCvpc.id
  tags = {
    Name = "IG-IacVpc"
  }
}

resource "aws_subnet" "Privatesubnets" {
   count = length(var.Privatecidrblock)
   vpc_id = aws_vpc.IaCvpc.id
   cidr_block = var.Privatecidrblock[count.index]
   availability_zone = (count.index < (length(var.Privatecidrblock)-1) ? var.Az[0]:var.Az[1])
}

resource "aws_subnet" "Publicsubnet" {
  vpc_id = aws_vpc.IaCvpc.id
  cidr_block = var.publicidrblock
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

output "subnetid" {
  value = aws_subnet.Publicsubnet.id
}
