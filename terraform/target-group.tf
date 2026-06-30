resource "aws_lb_target_group" "app" {

  name     = "enterprise-app-tg"
  port     = 80
  protocol = "HTTP"

  vpc_id = aws_vpc.main.id

  health_check {

    enabled = true

    path = "/"

    protocol = "HTTP"

    matcher = "200"

    interval = 30

    timeout = 5

    healthy_threshold = 2

    unhealthy_threshold = 2
  }

  tags = merge(local.common_tags, {
    Name = "enterprise-target-group"
  })

}