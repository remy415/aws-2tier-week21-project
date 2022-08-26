#loadbalancing/outputs.tf 

output "elb" {
  value = aws_lb.KP21_lb.id
}

output "alb_tg" {
  value = aws_lb_target_group.KP21_tg.arn
}

output "alb_dns" {
  value = aws_lb.KP21_lb.dns_name
}