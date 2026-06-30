# 🚀 Enterprise Infrastructure Automation Platform

Enterprise-grade AWS Infrastructure Automation Platform built using **Terraform**, **GitHub Actions**, **AWS CodeDeploy**, **Auto Scaling**, **Application Load Balancer**, **CloudWatch**, **SNS**, and **Remote State**.

![Terraform](https://img.shields.io/badge/Terraform-1.12+-623CE4?style=for-the-badge&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazonaws)
![GitHub Actions](https://img.shields.io/badge/GitHub-Actions-blue?style=for-the-badge&logo=githubactions)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

---

# 📖 Project Overview

This project demonstrates how to provision and manage a production-style AWS infrastructure using Infrastructure as Code (IaC) with Terraform.

The platform includes:

- Multi-AZ VPC
- Public and Private Subnets
- Internet Gateway
- NAT Gateway
- Bastion Host
- Application Load Balancer
- Launch Template
- Auto Scaling Group
- CloudWatch Dashboard
- CloudWatch Alarms
- SNS Notifications
- AWS CodeDeploy
- GitHub Actions CI/CD
- S3 Remote State
- DynamoDB State Locking

This project showcases real-world AWS infrastructure automation and DevOps best practices.

---

# 🏗 Architecture

```text
                    GitHub Repository
                           │
                           ▼
                  GitHub Actions CI
                           │
                           ▼
                     Terraform Apply
                           │
                           ▼
                    AWS Infrastructure
 ┌─────────────────────────────────────────────────────┐
 │                     AWS VPC                         │
 │                                                     │
 │ Public Subnet (AZ-1)                               │
 │ ├── Application Load Balancer                       │
 │ ├── NAT Gateway                                     │
 │ └── Bastion Host                                    │
 │                                                     │
 │ Public Subnet (AZ-2)                               │
 │ └── Application Load Balancer                       │
 │                                                     │
 │ Private Subnet (AZ-1)                              │
 │ └── Auto Scaling EC2 Instances                      │
 │                                                     │
 │ Private Subnet (AZ-2)                              │
 │ └── Auto Scaling EC2 Instances                      │
 │                                                     │
 │ CloudWatch                                          │
 │ SNS Notifications                                   │
 │ IAM Roles                                           │
 │ CodeDeploy                                          │
 └─────────────────────────────────────────────────────┘
```

> **Note:** A graphical AWS architecture diagram will be added later in the `diagrams/` folder.

---

# ☁ AWS Services Used

| AWS Service | Purpose |
|-------------|---------|
| Amazon VPC | Network isolation |
| EC2 | Compute instances |
| Auto Scaling | High availability |
| Application Load Balancer | Traffic distribution |
| IAM | Identity and access management |
| CloudWatch | Monitoring and dashboards |
| SNS | Email notifications |
| CodeDeploy | Application deployment |
| S3 | Terraform remote state |
| DynamoDB | Terraform state locking |
| GitHub Actions | Continuous Integration |

---

# 📂 Project Structure

```text
Enterprise-Infrastructure-Automation-Platform
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── diagrams/
│
├── docs/
│
├── screenshots/
│
├── scripts/
│   └── start.sh
│
├── terraform/
│   ├── modules/
│   │   ├── alb/
│   │   ├── autoscaling/
│   │   ├── iam/
│   │   ├── monitoring/
│   │   ├── security-groups/
│   │   ├── sns/
│   │   └── vpc/
│   │
│   ├── alb.tf
│   ├── alb-sg.tf
│   ├── autoscaling.tf
│   ├── autoscaling-policy.tf
│   ├── backend.tf
│   ├── cloudwatch.tf
│   ├── codedeploy.tf
│   ├── dashboard.tf
│   ├── data.tf
│   ├── ec2.tf
│   ├── iam.tf
│   ├── launch-template.tf
│   ├── listener.tf
│   ├── locals.tf
│   ├── outputs.tf
│   ├── provider.tf
│   ├── remote-state.tf
│   ├── security_groups.tf
│   ├── sns.tf
│   ├── target-group.tf
│   ├── userdata.sh
│   ├── variables.tf
│   └── versions.tf
│
├── appspec.yml
├── README.md
└── .gitignore
```

---

# 🚀 Features

- Infrastructure as Code (Terraform)
- Multi-AZ AWS VPC Architecture
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Bastion Host
- Application Load Balancer (ALB)
- Launch Template
- Auto Scaling Group (ASG)
- IAM Roles and Instance Profiles
- CloudWatch Dashboards
- CloudWatch Alarms
- SNS Email Notifications
- AWS CodeDeploy Integration
- GitHub Actions CI Pipeline
- Terraform Remote State (S3)
- DynamoDB State Locking
- Terraform module structure prepared for future refactoring

---

# 🔄 CI/CD Pipeline

```text
Developer
     │
     ▼
Git Push
     │
     ▼
GitHub Actions
     │
     ▼
Terraform Init
     │
Terraform Validate
     │
Terraform Plan
     │
Terraform Apply
     │
AWS Infrastructure
     │
CodeDeploy
     │
Application Deployment
```

---

# ⚙ Terraform Commands

### Initialize

```bash
terraform init
```

### Validate

```bash
terraform validate
```

### Format

```bash
terraform fmt
```

### Plan

```bash
terraform plan
```

### Apply

```bash
terraform apply
```

### Destroy

```bash
terraform destroy
```

---

# 📊 Monitoring & Alerting

The platform uses Amazon CloudWatch and Amazon SNS for proactive monitoring.

## CloudWatch Metrics

- EC2 CPU Utilization
- Auto Scaling Activity
- Application Load Balancer Request Count
- Healthy Host Count

## CloudWatch Alarms

- High CPU Utilization
- Low CPU Utilization
- High Request Count
- Unhealthy Target Count

## SNS Notifications

When an alarm is triggered, an email notification is sent using Amazon SNS.

---

# 📸 Screenshots

The following screenshots demonstrate the deployed infrastructure.

## GitHub Actions

> `screenshots/github-actions.png`

---

## Terraform Apply

> `screenshots/terraform-apply.png`

---

## VPC

> `screenshots/vpc.png`

---

## EC2 Instances

> `screenshots/ec2.png`

---

## Application Load Balancer

> `screenshots/alb.png`

---

## Auto Scaling Group

> `screenshots/autoscaling.png`

---

## CloudWatch Dashboard

> `screenshots/cloudwatch-dashboard.png`

---

## CloudWatch Alarms

> `screenshots/cloudwatch-alarm.png`

---

## AWS CodeDeploy

> `screenshots/codedeploy.png`

---

# 🔮 Future Enhancements

- Complete Terraform modularization
- HTTPS using ACM Certificates
- Route53 Domain Integration
- AWS WAF
- AWS Secrets Manager
- Blue/Green Deployments
- Docker Containerization
- Amazon ECS / Amazon EKS
- Kubernetes
- Helm
- Prometheus
- Grafana
- Multi-Environment Deployments (Dev, QA, Prod)
- Terraform Cloud Integration

---

# 💼 Skills Demonstrated

- AWS Cloud
- Terraform
- Infrastructure as Code (IaC)
- GitHub Actions
- Continuous Integration (CI)
- Continuous Deployment (CD)
- Amazon VPC
- EC2
- Auto Scaling
- Application Load Balancer
- IAM
- CloudWatch
- SNS
- AWS CodeDeploy
- S3 Remote State
- DynamoDB State Locking

---

# 👨‍💻 Author

**Ajith Kumar**

Cloud & DevOps Engineer

### Connect with me

- GitHub: https://github.com/Ajith-kumar-ops

---

# ⭐ Support

If you found this project helpful, consider giving it a ⭐ on GitHub!

Thank you for visiting this repository.

