resource "aws_launch_template" "webserver" {
  name   = "webserver-launchconfig"
  image_id      = "ami-08edbb0e85d6a0a07"
  instance_type = "t2.micro"
  user_data = filebase64("modules\\autoscalinggroup-module\\init.sh")
}

resource "aws_autoscaling_group" "webservers_asg" {
  # availability_zones = ["eu-west-1a","eu-west-1c"]
  name = "ws-asg"
  vpc_zone_identifier = ["${var.public_subnet_a_id}","${var.public_subnet_c_id}"]
  desired_capacity   = 2
  max_size           = 6
  min_size           = 2
   health_check_grace_period = 300
  health_check_type         = "ELB"
  target_group_arns  = ["${var.webservers_tg_arn}"]
  force_delete = true

  tags = [
    {
      key                 = "Name"
      value               = "web-server"
      propagate_at_launch = true
    },
  ]

  launch_template {
    id      = aws_launch_template.webserver.id
    version = "$Latest"

  }
}


resource "aws_autoscaling_group" "applicationservers_asg" {
  # availability_zones = ["eu-west-1a","eu-west-1c"]
  name = "as-asg"
  vpc_zone_identifier = ["${var.private_subnet_a_id}","${var.private_subnet_c_id}"]
  desired_capacity   = 2
  max_size           = 6
  min_size           = 2
  force_delete = true
   health_check_grace_period = 300
  health_check_type         = "ELB"

  tags = [
    {
      key                 = "Name"
      value               = "application-server"
      propagate_at_launch = true
    },
  ]

  launch_template {
    id      = aws_launch_template.webserver.id
    version = "$Latest"

  }
}

# resource "aws_autoscaling_attachment" "asg_attachment_elb" {
#   autoscaling_group_name = aws_autoscaling_group.webservers_asg.id
#   alb_target_group_arn = var.webservers_tg_arn
# }