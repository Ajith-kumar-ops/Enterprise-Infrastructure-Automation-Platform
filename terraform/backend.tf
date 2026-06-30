terraform {

  backend "s3" {

    bucket = "enterprise-platform-tfstate-ajith-183295428243"

    key = "enterprise-platform/terraform.tfstate"

    region = "ap-south-1"

    dynamodb_table = "terraform-lock"

    encrypt = true

  }

}