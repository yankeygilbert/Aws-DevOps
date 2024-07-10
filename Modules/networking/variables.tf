variable "Az" {
  type = list(string)
  default = [ "us-east-1a","us-east-1b" ]
}

variable "cidrblock" {
  type = list(strings)
  default = [ "192.168.22.0/24", "192.168.26.0/24","192.168.24.0/24"]
}