# --- networking/outputs.tf ---

output "vpc_id" {
  value = aws_vpc.KP21_vpc.id
}