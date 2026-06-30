resource "aws_launch_template" "application" {

  name_prefix = "enterprise-app-"

  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  key_name = var.key_pair_name

  vpc_security_group_ids = [
    aws_security_group.application.id
  ]

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  user_data = base64encode(file("${path.module}/userdata.sh"))

  tag_specifications {
    resource_type = "instance"

    tags = merge(local.common_tags, {
      Name = "application-server"
    })
  }
}