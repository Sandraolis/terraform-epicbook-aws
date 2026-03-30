# 🚀 Automated 2-Tier AWS Architecture Deployment (EpicBook)


## Terraform, AWS, Node.js, MySQL, Nginx 

## 📌 Overview

This repository contains the Infrastructure as Code (IaC) to automatically provision a highly secure, production-style 2-tier architecture on AWS. It deploys a full-stack Node.js/MySQL application ("EpicBook") with Zero-Touch Automation.

Once terraform apply is executed, the infrastructure is built, the OS is configured, the database is seeded, and the application is served to the internet entirely hands-free.

## 🏗️ Architecture Design
Network: Custom VPC (10.0.0.0/16) with 1 Public Subnet and 2 Private Subnets (Multi-AZ).
Compute (Web Tier): Ubuntu 24.04 EC2 instance in the Public Subnet.
Database (Data Tier): Managed Amazon RDS MySQL instance completely isolated in the Private Subnets.
Security: * Strict Security Group chaining: The RDS instance only accepts Port 3306 traffic originating from the EC2 Security Group.
Dynamic IP injection: Port 22 (SSH) is automatically locked down to the executor's local Wi-Fi IP address.
Process Management & Routing: PM2 keeps the Node.js backend alive, while Nginx acts as a reverse proxy handling Port 80 web traffic.


## 📂 Repository Structure
This project follows Terraform modular best practices:


## 📦 terraform-epicbook-aws

 ┣ 📜 main.tf           # Core infrastructure components (VPC, EC2, RDS, SGs)
 ┣ 📜 variables.tf      # Variable definitions for reusability
 ┣ 📜 outputs.tf        # Prints the EC2 Public IP and RDS Endpoint
 ┣ 📜 providers.tf      # AWS and HTTP provider configurations
 ┣ 📜 user_data.sh      # Bash script injected into EC2 for OS bootstrapping
 ┗ 📜 .gitignore        # Security shield preventing secrets from being pushed


## ⚙️ Prerequisites
To deploy this project on your local machine, you must have:

An active AWS Account.
AWS CLI installed and configured (aws configure).
Terraform installed.


## 🚀 Step-by-Step Deployment Guide
Step 1: Clone the Repository
git clone https://github.com/paharipratyush/terraform-epicbook-aws.git
cd terraform-epicbook-aws
Step 2: Generate an SSH Key
The EC2 instance requires an SSH key named epicbook-key. Generate it in the ap-south-1 region (or update the region to match your preference):

aws ec2 create-key-pair --region ap-south-1 --key-name epicbook-key --query 'KeyMaterial' --output text > epicbook-key.pem
chmod 400 epicbook-key.pem
Step 3: Configure Your Secrets (CRITICAL)
For security, database passwords are not hardcoded in this repository. You must create a local secrets file.

Create a file named exactly terraform.tfvars in the root directory.
Add your highly secure database password to the file:
db_password = "YourSuperSecretPassword123!"
Step 4: Provision the Infrastructure
Initialize Terraform to download the required AWS providers:

terraform init
Review the execution plan:

terraform plan
Deploy the infrastructure:

terraform apply
(Type yes when prompted. The deployment takes approximately 5–7 minutes due to RDS provisioning).

Step 5: Access the Application
Once Terraform finishes, it will output your ec2_public_ip.
Wait ~5 minutes for the asynchronous user_data.sh script to finish installing Node, Nginx, and seeding the MySQL database.
Paste the ec2_public_ip into your web browser. EpicBook is live! 🧹 Cleanup To avoid incurring AWS charges, destroy all resources when you are finished testing:
terraform destroy
(Type yes when prompted)

Built with ❤️ as part of a DevOps Micro Internship (DMI).