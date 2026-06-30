resource "aws_cloudwatch_dashboard" "enterprise" {

  dashboard_name = "Enterprise-Infrastructure-Dashboard"

  dashboard_body = jsonencode({

    widgets = [

      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          title   = "EC2 CPU Utilization"
          region  = var.aws_region
          view    = "timeSeries"
          stacked = false

          metrics = [
            [
              "AWS/EC2",
              "CPUUtilization",
              "AutoScalingGroupName",
              aws_autoscaling_group.application.name
            ]
          ]
        }
      },

      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6

        properties = {
          title  = "ALB Request Count"
          region = var.aws_region

          metrics = [
            [
              "AWS/ApplicationELB",
              "RequestCount",
              "LoadBalancer",
              aws_lb.main.arn_suffix
            ]
          ]
        }
      },

      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6

        properties = {
          title  = "Healthy Hosts"
          region = var.aws_region

          metrics = [
            [
              "AWS/ApplicationELB",
              "HealthyHostCount",
              "TargetGroup",
              aws_lb_target_group.app.arn_suffix,
              "LoadBalancer",
              aws_lb.main.arn_suffix
            ]
          ]
        }
      },

      {
        type   = "metric"
        x      = 12
        y      = 6
        width  = 12
        height = 6

        properties = {
          title  = "Unhealthy Hosts"
          region = var.aws_region

          metrics = [
            [
              "AWS/ApplicationELB",
              "UnHealthyHostCount",
              "TargetGroup",
              aws_lb_target_group.app.arn_suffix,
              "LoadBalancer",
              aws_lb.main.arn_suffix
            ]
          ]
        }
      },

      {
        type   = "metric"
        x      = 0
        y      = 12
        width  = 12
        height = 6

        properties = {
          title  = "Network In"
          region = var.aws_region

          metrics = [
            [
              "AWS/EC2",
              "NetworkIn",
              "AutoScalingGroupName",
              aws_autoscaling_group.application.name
            ]
          ]
        }
      },

      {
        type   = "metric"
        x      = 12
        y      = 12
        width  = 12
        height = 6

        properties = {
          title  = "Network Out"
          region = var.aws_region

          metrics = [
            [
              "AWS/EC2",
              "NetworkOut",
              "AutoScalingGroupName",
              aws_autoscaling_group.application.name
            ]
          ]
        }
      }

    ]
  })
}