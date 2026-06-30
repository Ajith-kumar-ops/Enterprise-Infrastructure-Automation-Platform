resource "aws_autoscaling_group" "application" {

  name = "enterprise-asg"

  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  vpc_zone_identifier = [
    aws_subnet.private.id,
    aws_subnet.private_2.id
  ]

  target_group_arns = [
    aws_lb_target_group.app.arn
  ]

  launch_template {
    id      = aws_launch_template.application.id
    version = "$Latest"
  }

  health_check_type         = "ELB"
  health_check_grace_period = 180

  tag {
    key                 = "Name"
    value               = "application-server"
    propagate_at_launch = true
  }
}