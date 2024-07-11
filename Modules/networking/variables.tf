variable "Az" {
  type = list(string)
  default = [ "us-east-1a","us-east-1b" ]
}

variable "Privatecidrblock" {
  type = list(string)
  default = [ "192.168.22.0/24", "192.168.26.0/24","192.168.24.0/24"]
}

variable "publicidrblock" {
  type = string
  default = "192.168.20.0/24"
}

variable "vpc_cidr" {
  type = string
  default = "192.168.0.0/20"
}