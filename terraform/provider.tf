provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "Enterprise Infrastructure Automation Platform"
      Environment = "Development"
      Owner       = "Ajith"
      ManagedBy   = "Terraform"
    }
  }
}