#root/outputs.tf 

output "alb_dns" {
    value = module.load_balancer.alb_dns
}