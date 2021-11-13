
variable "webservers_tg_arn" {
  type = string
  description = ""
}

variable "public_subnet_a_id" {
  type = string
  description = ""
#   default = var.public_subnet_a_id
}
variable "public_subnet_c_id" {
  type = string
  description = ""
#   default = var.public_subnet_c_id
}
variable "private_subnet_a_id" {
  type = string
  description = ""
#   default = var.private_subnet_a_id
}
variable "private_subnet_c_id" {
  type = string
  description = ""
#   default = var.private_subnet_c_id
}



# variable "vpc_id" {
#     type = string
#     description = ""
# }

# variable "vpc_cidr_block" {
#   type = string
#   description = "VPC CIDR Block"
# }

# variable "private_subnet_cidr_block-a" {
#   type = string
#   description = "private Subnet CIDR Block"
# }

# variable "private_subnet_cidr_block-c" {
#   type = string
#   description = "private Subnet CIDR Block"
# }

# variable "public_subnet_cidr_block-a" {
#   type = string
#   description = "Public Subnet CIDR Block"
# }
# variable "public_subnet_cidr_block-c" {
#   type = string
#   description = "Public Subnet CIDR Block"
# }
