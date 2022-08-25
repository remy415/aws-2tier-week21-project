variable "public_sg" {}
variable "public_subnets" {}
variable "vpc_id" {}

variable "tg_port" {
 default = 80
 }

variable "tg_protocol" {
 default = "HTTP"
 }

variable "listener_port" {
 default = 80
}

variable "listener_protocol" {
 default = "HTTP"
 }

variable "lb_healthy_threshold" {}
variable "lb_unhealthy_threshold" {}
variable "lb_timeout" {}
variable "lb_interval" {}