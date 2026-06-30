resource "aws_sns_topic" "alerts" {

  name = "enterprise-alerts"

  tags = merge(local.common_tags, {
    Name = "enterprise-alerts"
  })
}

resource "aws_sns_topic_subscription" "email" {

  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = "ajith.ak022000@gmail.com"
}