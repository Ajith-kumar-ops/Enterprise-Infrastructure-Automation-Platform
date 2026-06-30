resource "aws_autoscaling_policy" "scale_out" {
  name                   = "enterprise-scale-out"
  autoscaling_group_name = aws_autoscaling_group.application.name

  adjustment_type    = "ChangeInCapacity"
  scaling_adjustment = 1
  cooldown           = 180
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = "enterprise-scale-in"
  autoscaling_group_name = aws_autoscaling_group.application.name

  adjustment_type    = "ChangeInCapacity"
  scaling_adjustment = -1
  cooldown           = 180
}