terraform{
    required_providers {
      aws = {
                source = "hashicorp/aws"
                version = "~>4.49.0"
      }
      required_version = ">=1.1.0"
    }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc"{
  source = "./Modules/networking"
}

module "Instances" {
  source = "./Modules/servers"
}

