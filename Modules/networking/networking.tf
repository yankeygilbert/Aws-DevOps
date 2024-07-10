variable "Az" {
  type = list(string)
  default = [ "us-east-1a","us-east-1b" ]
}

resource "aws_vpc" "IaCvpc" {
   cidr_block = "192.168.0.0/20"
}

resource "aws_internet_gateway" "IG" {
  
}

resource "aws_subnets" "Privatesubnets" {
  for_each = var.Az
  vpc_id = aws_vpc.IaCvpc.id
  
}

resource "aws_subnet" "Publicsubnet" {
  vpc_id = aws_vpc.IaCvpc.id
  cidr_block = "192.168.20.0/24"
}

resource "aws_nat_gateway" "NAT" {
  subnet_id = aws_subnet.Publicsubnet
}

resource "aws_route_table" "Rt" {
  vpc_id = aws_vpc.IaCvpc
  depends_on = [ 
          
   ]
}