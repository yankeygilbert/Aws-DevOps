data "aws_internet_gateway" "IG" {
  
}
data "aws_availability_zones" "Az" {
  count = 2
}
data "aws_subnets" "Privatesubnets" {
  count = 2
}

resource "aws_vpc" "IaCvpc" {
  
}