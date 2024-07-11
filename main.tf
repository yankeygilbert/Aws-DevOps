terraform{
    required_providers {
      aws = {
                source = "hashicorp/aws"
                version = "~>4.49.0"
      }
      
    }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc"{
  source = "./Modules/networking"

}

resource "aws_instance" "web_instances" {
    count = length(var.servers)
    ami = "ami-0bb84b8ffd87024d8"
    instance_type = "t2.micro"
    subnet_id = (count.index < length(var.servers)-1 ? module.vpc.subnetid : module.vpc.aws_subnet.Privatesubnet[0])
    
    tags = {
      Name = "Instance-${count.index}"
    }
}


