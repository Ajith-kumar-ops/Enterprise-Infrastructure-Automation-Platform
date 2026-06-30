#############################
# CodeDeploy IAM Role
#############################

resource "aws_iam_role" "codedeploy" {
  name = "enterprise-codedeploy-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Principal = {
        Service = "codedeploy.amazonaws.com"
      }

      Action = "sts:AssumeRole"
    }]
  })

  tags = local.common_tags
}

resource "aws_iam_role_policy_attachment" "codedeploy" {

  role = aws_iam_role.codedeploy.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
}

#############################
# CodeDeploy Application
#############################

resource "aws_codedeploy_app" "application" {

  name = "enterprise-platform"

  compute_platform = "Server"
}

#############################
# Deployment Group
#############################

resource "aws_codedeploy_deployment_group" "application" {

  app_name = aws_codedeploy_app.application.name

  deployment_group_name = "enterprise-deployment-group"

  service_role_arn = aws_iam_role.codedeploy.arn

  deployment_config_name = "CodeDeployDefault.AllAtOnce"

  autoscaling_groups = [
    aws_autoscaling_group.application.name
  ]

  deployment_style {

    deployment_type = "IN_PLACE"

    deployment_option = "WITHOUT_TRAFFIC_CONTROL"
  }

  auto_rollback_configuration {

    enabled = true

    events = [
      "DEPLOYMENT_FAILURE"
    ]
  }
}