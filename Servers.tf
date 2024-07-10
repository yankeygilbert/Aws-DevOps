provider "aws" {
  region = "us-east-1"
}
variable "servers" {
  type = list(string)
  default = ["Bastion","webserver"]
}

resource "aws_instance" "web_instances" {
  for_each = to_set(var.servers)
  ami = ""
  tags = {
    Name = "Instance-${each.key}"
  }
}