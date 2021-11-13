


resource "aws_lb_target_group" "webservers_tg" {
  name     = "web-servers-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}


  

 resource "aws_lb" "webservers_alb" {
  name               = "web-loadbalancer"
  internal           = false
  load_balancer_type = "application"
  #security_groups    = [aws_security_group.lb_sg.id]
  
  subnets =["${var.public_subnet_a_id}","${var.public_subnet_c_id}"]
  # enable_deletion_protection = true

  # access_logs {
  #   bucket  = aws_s3_bucket.lb_logs.bucket
  #   prefix  = "test-lb"
  #   enabled = true
  # }

  tags = {
    Environment = "production"
    name = "myapp-loadbalancer"
  }
}

resource "aws_lb_listener" "http_listener_80" {
  load_balancer_arn = aws_lb.webservers_alb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webservers_tg.arn
  }
}

// Attach the target groups to the instance(s)
# resource "aws_lb_target_group_attachment" "test" {
#   target_group_arn = aws_lb_target_group.webservers_tg.arn
#   target_id        = var.webservers-asg_id
#   port             = 80
# }
# Create a new load balancer attachment
# resource "aws_autoscaling_attachment" "asg_attachment_bar" {
#   autoscaling_group_name = "${var.webservers-asg_id}"
#   elb                    = "${aws_elb.webservers_alb.id}"
# }