# AWS DevOps Project - Deployment Guide

## Prerequisites

- AWS Account with appropriate permissions
- AWS CLI v2 installed and configured
- Terraform v1.x installed
- Docker installed locally
- Git installed
- SSH client configured
- Docker Hub account (for image registry)

## Quick Start

### 1. Clone Repository

```bash
git clone https://github.com/saishekar555/aws-devops-project.git
cd aws-devops-project
```

### 2. Configure Environment

```bash
cp .env.example .env
# Edit .env with your actual values
nano .env
```

### 3. AWS Setup

```bash
# Configure AWS credentials
aws configure

# Verify AWS access
aws sts get-caller-identity
```

### 4. Generate SSH Key

```bash
# Generate SSH key for EC2 access
ssh-keygen -t rsa -b 4096 -f devops-key.pem
chmod 600 devops-key.pem

# Update .env with key path
export EC2_SSH_KEY_PATH="$(pwd)/devops-key.pem"
```

### 5. Deploy Infrastructure

```bash
# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Review planned changes
terraform plan -out=tfplan

# Apply infrastructure
terraform apply tfplan

# Save outputs
terraform output -json > deployment-outputs.json
```

### 6. Verify Deployment

```bash
# Get EC2 public IP
EC2_IP=$(terraform output -raw aws_instance_public_ip)
echo "EC2 Public IP: $EC2_IP"

# Test SSH connection
ssh -i devops-key.pem ec2-user@$EC2_IP "echo 'SSH connection successful'"
```

### 7. Manual Application Deployment (First Time)

```bash
# SSH into EC2
ssh -i devops-key.pem ec2-user@$EC2_IP

# Pull Docker image
docker pull your_dockerhub_username/devops-portfolio:latest

# Run container
docker run -d -p 80:80 --name portfolio your_dockerhub_username/devops-portfolio:latest

# Verify application
curl http://localhost/
```

## Automated Deployment via GitHub Actions

### 1. Add GitHub Secrets

In your GitHub repository settings, add:

```
DOCKERHUB_USERNAME: your_username
DOCKERHUB_TOKEN: your_personal_access_token
EC2_HOST: your_ec2_public_ip
EC2_USERNAME: ec2-user
SSH_PRIVATE_KEY: (contents of your devops-key.pem)
```

### 2. Trigger Deployment

```bash
# Create a commit and push
git add .
git commit -m "trigger deployment"
git push origin main

# Monitor GitHub Actions
# Go to: https://github.com/saishekar555/aws-devops-project/actions
```

### 3. Verify Live Application

```bash
# Get EC2 IP from Terraform output
EC2_IP=$(terraform output -raw aws_instance_public_ip)

# Access application
curl http://$EC2_IP

# Or open in browser
echo "http://$EC2_IP"
```

## Updating Application

### Method 1: Via GitHub Actions (Automated)

```bash
# Make code changes
# Commit and push
git add index.html
git commit -m "update application"
git push origin main

# GitHub Actions automatically:
# 1. Builds Docker image
# 2. Pushes to Docker Hub
# 3. Deploys to EC2
```

### Method 2: Manual Update

```bash
# Build new Docker image
docker build -t your_dockerhub_username/devops-portfolio:latest .

# Push to Docker Hub
docker login
docker push your_dockerhub_username/devops-portfolio:latest

# SSH into EC2 and update
ssh -i devops-key.pem ec2-user@$EC2_IP
docker pull your_dockerhub_username/devops-portfolio:latest
docker stop portfolio
docker rm portfolio
docker run -d -p 80:80 --name portfolio your_dockerhub_username/devops-portfolio:latest
```

## Monitoring & Troubleshooting

### Check EC2 Instance Status

```bash
# Via AWS CLI
aws ec2 describe-instances --instance-ids i-xxxxx --query 'Reservations[0].Instances[0].State.Name'

# Via SSH
ssh -i devops-key.pem ec2-user@$EC2_IP

# Check system resources
free -h  # Memory
df -h    # Disk space
top      # Process usage
```

### Docker Troubleshooting

```bash
# List running containers
docker ps -a

# View container logs
docker logs portfolio

# Stop container
docker stop portfolio

# Remove container
docker rm portfolio

# View Docker images
docker images
```

### Network Issues

```bash
# Test connectivity
ping $EC2_IP

# Check security group rules
aws ec2 describe-security-groups --group-ids sg-xxxxx

# Test port 80
telnet $EC2_IP 80

# View inbound rules
aws ec2 describe-security-group-rules --filters Name=group-id,Values=sg-xxxxx
```

### Application Issues

```bash
# SSH into EC2
ssh -i devops-key.pem ec2-user@$EC2_IP

# Check application status
curl http://localhost/

# View application files
ls -la /usr/share/nginx/html/

# Check nginx logs
sudo tail -f /var/log/nginx/access.log
```

## Cleanup & Destruction

### Remove Application

```bash
# Stop and remove container
ssh -i devops-key.pem ec2-user@$EC2_IP
docker stop portfolio
docker rm portfolio
```

### Destroy Infrastructure

```bash
# WARNING: This will delete all AWS resources
terraform destroy

# Confirm destruction
# Type 'yes' when prompted
```

## Advanced Configuration

### Custom Domain Name

```bash
# Update Route 53 DNS record to point to EC2 IP
aws route53 change-resource-record-sets --hosted-zone-id XXXXX \
  --change-batch '{"Changes": [{"Action": "UPSERT", "ResourceRecordSet": {"Name": "app.example.com", "Type": "A", "TTL": 300, "ResourceRecords": [{"Value": "EC2_IP"}]}}]}'
```

### SSL/TLS Certificate

```bash
# Use AWS Certificate Manager
aws acm request-certificate --domain-name app.example.com

# Configure in Load Balancer or Application
```

### Cost Optimization

```bash
# Use spot instances for development
TF_VAR_use_spot_instance=true terraform apply

# Monitor AWS costs
aws ce get-cost-and-usage --time-period Start=2026-06-01,End=2026-06-30 --granularity MONTHLY --metrics BlendedCost
```

## Best Practices

✅ **Security:**
- Never commit `.env` or SSH keys
- Use IAM roles instead of access keys when possible
- Rotate credentials regularly
- Enable VPC security groups
- Use HTTPS/TLS for production

✅ **Infrastructure:**
- Keep Terraform state in remote backend
- Use version pinning for Terraform providers
- Implement state locking
- Regular backups of configurations

✅ **Operations:**
- Monitor application logs
- Set up CloudWatch alarms
- Implement health checks
- Automate backups
- Document configuration changes

## Support & Resources

- **Terraform Docs:** https://www.terraform.io/docs
- **AWS CLI Reference:** https://docs.aws.amazon.com/cli/
- **Docker Documentation:** https://docs.docker.com/
- **GitHub Actions:** https://docs.github.com/en/actions

## Questions?

Refer to README.md for overview or contact the maintainer.

**Author:** Dammoju Sai Shekar Chary  
**GitHub:** https://github.com/saishekar555  
**LinkedIn:** https://linkedin.com/in/saishekar555
