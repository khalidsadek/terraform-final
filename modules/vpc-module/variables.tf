variable "vpc_name" {
    type = string
    description = "The Name Of the VPC"
}

variable "vpc_cidr_block" {
  type = string
  description = "VPC CIDR Block"
}

variable "private_subnet_cidr_block-a" {
  type = string
  description = "private Subnet CIDR Block"
}

variable "private_subnet_cidr_block-c" {
  type = string
  description = "private Subnet CIDR Block"
}

variable "public_subnet_cidr_block-a" {
  type = string
  description = "Public Subnet CIDR Block"
}
variable "public_subnet_cidr_block-c" {
  type = string
  description = "Public Subnet CIDR Block"
}