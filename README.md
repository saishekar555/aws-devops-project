# 🚀 AWS DevOps CI/CD Pipeline Project

## 📌 Project Summary

Designed and implemented a production-style DevOps pipeline that automates application delivery from source code to deployment on AWS.

This project demonstrates Infrastructure as Code (IaC), containerization, continuous integration, continuous deployment, and cloud automation using Terraform, Docker, GitHub Actions, Docker Hub, and Amazon EC2.

### Key Achievement

✅ Fully automated deployment pipeline

A simple code push to GitHub automatically:

- Builds a Docker image
- Pushes the image to Docker Hub
- Connects securely to AWS EC2
- Deploys the latest container version
- Updates the live application without manual intervention

---

## 🏗 Architecture

```text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
GitHub Actions CI/CD
    │
    ▼
Docker Build
    │
    ▼
Docker Hub Registry
    │
    ▼
AWS EC2 (Amazon Linux)
    │
    ▼
Docker Container
    │
    ▼
Live Application
```

---

## 🔥 Business Value

Traditional deployments require:

- Manual server login
- Manual Docker build
- Manual container restart
- Increased deployment risk

This solution enables:

- Faster releases
- Consistent deployments
- Reduced human error
- Infrastructure automation
- Production-ready CI/CD practices

---

## 🛠 Technology Stack

| Category | Technologies |
|-----------|-------------|
| Cloud | AWS EC2 |
| Infrastructure as Code | Terraform |
| Containers | Docker |
| Container Registry | Docker Hub |
| CI/CD | GitHub Actions |
| Version Control | Git & GitHub |
| Operating System | Amazon Linux 2023 |
| Security | SSH Key Authentication |

---

## 📂 Repository Structure

```text
aws-devops-project/
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── Dockerfile
├── index.html
│
├── provider.tf
├── main.tf
├── security.tf
├── outputs.tf
├── variables.tf
│
├── user-data.sh
│
├── .gitignore
└── README.md
```

---

## ⚙ Infrastructure Provisioning

Provisioned AWS infrastructure using Terraform.

### Resources Created

- EC2 Instance
- Security Group
- Public IP Configuration
- Automated User Data Script

### Terraform Commands

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

## 🐳 Containerization

Application packaged as a Docker container.

### Build

```bash
docker build -t devops-portfolio .
```

### Run

```bash
docker run -d -p 80:80 --name portfolio devops-portfolio
```

---

## 🔄 CI/CD Pipeline Workflow

### Continuous Integration

- Source code checkout
- Docker image build
- Docker Hub authentication
- Image push to registry

### Continuous Deployment

- Secure SSH connection to EC2
- Pull latest Docker image
- Stop existing container
- Deploy new container
- Verify application availability

---

## 🔐 Security Implementation

Sensitive information managed through GitHub Secrets.

### Repository Secrets

```text
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN

EC2_HOST
EC2_USERNAME

SSH_PRIVATE_KEY
```

No credentials are stored in source code.

---

## 📈 Project Outcomes

### Infrastructure Automation

100% infrastructure created through Terraform.

### Deployment Automation

Application deployment completed automatically through GitHub Actions.

### Containerized Delivery

Application packaged and distributed through Docker.

### Cloud Deployment

Hosted and served from AWS EC2.

---

## 🚧 Challenges Solved

### Large Terraform Provider Files Rejected by GitHub

**Solution**

Configured `.gitignore` to exclude provider binaries and Terraform state files.

### GitHub Actions YAML Errors

**Solution**

Validated workflow syntax and corrected indentation issues.

### SSH Authentication Failures

**Solution**

Generated dedicated GitHub Actions deployment keys and configured EC2 authorized_keys.

### Docker Hub Authentication Errors

**Solution**

Implemented Docker Hub Personal Access Tokens and GitHub Secrets management.

---

## 📊 Skills Demonstrated

- AWS EC2 Administration
- Terraform Infrastructure as Code
- Docker Containerization
- GitHub Actions CI/CD
- Docker Hub Registry Management
- Linux Administration
- SSH Authentication
- Git Version Control
- Continuous Deployment
- DevOps Automation

---

## 🎯 Resume Highlights

This project demonstrates hands-on experience with:

- Infrastructure as Code (Terraform)
- CI/CD Automation
- Docker Containerization
- Cloud Deployment on AWS
- GitHub Actions Pipelines
- Secure Secret Management
- Production Deployment Workflows

---

## 🌐 Live Demo

Application deployed on AWS EC2 using Docker and GitHub Actions.

**Public URL:**

http://98.130.45.212

---

## 👨‍💻 Author

### Dammoju Sai Shekar

**Certifications**
- Microsoft Certified: Azure Administrator Associate (AZ-104)
- Microsoft Certified: Azure DevOps Engineer Expert (AZ-400)

**Target Roles**
- DevOps Engineer
- Azure DevOps Engineer
- Cloud Engineer
- Platform Engineer
- Site Reliability Engineer (SRE)

---

## ⭐ Key DevOps Achievements

✅ Provisioned AWS infrastructure using Terraform

✅ Containerized application using Docker

✅ Implemented CI/CD using GitHub Actions

✅ Automated Docker Hub image publishing

✅ Configured secure SSH deployment to EC2

✅ Achieved zero-touch deployments from GitHub commits

✅ Implemented Infrastructure as Code best practices

✅ Built a production-style DevOps workflow end-to-end
