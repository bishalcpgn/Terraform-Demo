output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "sg_private_id" {
  value = aws_security_group.sg_private.id
}
