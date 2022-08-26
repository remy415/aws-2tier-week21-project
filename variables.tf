#root/variables.tf 

variable "region" {
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  default = "ami-05fa00d4c63e32376"
}