#############################################
# High CPU Alarm (Scale Out)
#############################################

resource "aws_cloudwatch_metric_alarm" "high_cpu" {

  alarm_name          = "enterprise-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.application.name
  }

  alarm_description = "Scale out when CPU exceeds 70%"

  treat_missing_data = "notBreaching"

  alarm_actions = [
    aws_autoscaling_policy.scale_out.arn,
    aws_sns_topic.alerts.arn
  ]

  ok_actions = [
    aws_sns_topic.alerts.arn
  ]
}

#############################################
# Low CPU Alarm (Scale In)
#############################################

resource "aws_cloudwatch_metric_alarm" "low_cpu" {

  alarm_name          = "enterprise-low-cpu"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 30

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.application.name
  }

  alarm_description = "Scale in when CPU drops below 30%"

  treat_missing_data = "notBreaching"

  alarm_actions = [
    aws_autoscaling_policy.scale_in.arn,
    aws_sns_topic.alerts.arn
  ]

  ok_actions = [
    aws_sns_topic.alerts.arn
  ]
}

#############################################
# ALB Unhealthy Hosts
#############################################

resource "aws_cloudwatch_metric_alarm" "alb_unhealthy" {

  alarm_name          = "enterprise-unhealthy-hosts"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Average"
  threshold           = 0

  dimensions = {
    LoadBalancer = aws_lb.main.arn_suffix
    TargetGroup  = aws_lb_target_group.app.arn_suffix
  }

  alarm_description = "Application Load Balancer has unhealthy targets"

  treat_missing_data = "notBreaching"

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

  ok_actions = [
    aws_sns_topic.alerts.arn
  ]
}

#############################################
# ALB High Request Count
#############################################

resource "aws_cloudwatch_metric_alarm" "high_requests" {

  alarm_name          = "enterprise-high-requests"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "RequestCount"
  namespace           = "AWS/ApplicationELB"
  period              = 300
  statistic           = "Sum"
  threshold           = 1000

  dimensions = {
    LoadBalancer = aws_lb.main.arn_suffix
  }

  alarm_description = "High request count on ALB"

  treat_missing_data = "notBreaching"

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

  ok_actions = [
    aws_sns_topic.alerts.arn
  ]
}