output "security_group_id" {
  value = aws_security_group.mtc_sg.id
}

output "subnet_id" {
  value = aws_subnet.mtc_public_subnet.id
}