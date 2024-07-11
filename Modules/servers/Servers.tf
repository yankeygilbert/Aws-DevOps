  resource "aws_instance" "web_instances" {
  for_each = to_set(var.servers)
  ami = ""
  instance_type = "t2.micro"
  tags = {
    Name = "Instance-${each.key}"
  }
}

