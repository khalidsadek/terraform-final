# Retun Values
output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_a_id" {
  value = aws_subnet.public-a.id
}
output "public_subnet_c_id" {
  value = aws_subnet.public-c.id
}
output "private_subnet_a_id" {
  value = aws_subnet.private-a.id
}
output "private_subnet_c_id" {
  value = aws_subnet.private-c.id
}