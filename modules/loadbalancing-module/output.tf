# Retun Values
output "webservers_tg_arn" {
  value = aws_lb_target_group.webservers_tg.arn
}

# output "subnet_id" {
#   value = aws_subnet.publi.id
# }