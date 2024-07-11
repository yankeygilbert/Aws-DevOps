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

module "ec2_instance" {
  source = "./Modules/servers"
}

