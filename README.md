# AWS Terraform EC2 Docker Project

## Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform on AWS. It provisions an Amazon EC2 instance, configures a Security Group, attaches an EC2 Key Pair, and automatically installs Docker using EC2 User Data.

## Architecture

Terraform → AWS EC2 → User Data → Docker → Nginx Container

## Technologies Used

* AWS EC2
* Terraform
* AWS CLI
* Docker
* Git & GitHub
* Linux (Amazon Linux 2023)

## Features

* Infrastructure as Code with Terraform
* Security Group management
* SSH access using EC2 Key Pair
* Automated Docker installation using User Data
* Terraform Variables and Outputs
* GitHub version control

## Terraform Resources

* aws_instance
* aws_security_group

## Project Structure

```text
.
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── security.tf
├── user-data.sh
└── .gitignore
```

## Deployment Steps

1. Configure AWS CLI
2. Run `terraform init`
3. Run `terraform validate`
4. Run `terraform plan`
5. Run `terraform apply`
6. SSH into EC2
7. Verify Docker installation
8. Deploy Nginx container

## Skills Demonstrated

* Infrastructure as Code (IaC)
* AWS Cloud Administration
* Terraform State Management
* Linux Administration
* Docker Containerization
* Cloud Security
* DevOps Automation

## Author

Dammoju Sai Shekar Chary
Azure DevOps Engineer | AWS DevOps Learner
