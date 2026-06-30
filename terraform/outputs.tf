output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.application.name
}

output "launch_template_id" {
  value = aws_launch_template.application.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_2.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_2.id
}

output "sns_topic_arn" {
  description = "SNS Topic ARN"
  value       = aws_sns_topic.alerts.arn
}

output "cloudwatch_dashboard_name" {
  description = "CloudWatch Dashboard Name"
  value       = aws_cloudwatch_dashboard.enterprise.dashboard_name
}