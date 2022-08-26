# --- compute/variables.tf ---

variable "public_sg" {}
variable "public_subnet" {}
variable "private_sg" {}
variable "private_subnet" {}
variable "key_name" {}
variable "elb" {}
variable "alb_tg" {}

variable "bastion_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "database_instance_type" {
  type    = string
  default = "t2.micro"
}