# Retun Values
output "webservers-asg_id" {
  value = aws_autoscaling_group.webservers_asg.id
}

# output "subnet_id" {
#   value = aws_subnet.publi.id
# }