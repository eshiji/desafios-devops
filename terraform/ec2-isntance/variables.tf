# AWS Config - default=idwall_desafio

variable "aws_access_key" { }

variable "aws_secret_key" { }

variable "aws_region" {
  default = "sa-east-1"
}

variable "cidrs" {
  type    = "list"
  default = []
}
