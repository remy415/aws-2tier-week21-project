# networking/outputs.tf 

output "vpc_id" {
  value = aws_vpc.KP21_vpc.id
}

output "public_sg" {
  value = aws_security_group.KP21_public_sg.id
}

output "private_sg" {
  value = aws_security_group.KP21_private_sg.id
}

output "web_sg" {
  value = aws_security_group.KP21_web_sg.id
}

output "private_subnet" {
  value = aws_subnet.KP21_private_subnet[*].id
}

output "public_subnet" {
  value = aws_subnet.KP21_public_subnet[*].id
}