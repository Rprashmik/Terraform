# Terraform AWS Infrastructure

This repository contains Terraform code to provision AWS infrastructure following best practices.

---

## Resources Created
- EC2 Instance
- Security Group
- Key Pair
- User Data Script

---

## Features
- Clean and modular Terraform structure
- Remote backend using S3 with state locking
- Environment-based deployment (dev / prod)
- GitHub-based version control

---

## Directory Structure
Terraform/
├── env/
│ ├── dev.tfvars
│ └── prod.tfvars
├── backend.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── versions.tf
├── userdata.sh
├── .gitignore
└── README.md

## Usage

```bash
terraform init
terraform validate
terraform plan -var-file=env/dev.tfvars
terraform apply -var-file=env/dev.tfvars



```

## Tools Used
- Terraform
- AWS
- GitHub





