# Variables – The EpicBook! Terraform Deployment

variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}


variable "key_name" {
  description = "AWS Key Pair Name"
   type        = string
  default     = "epicbook-key"
}


variable "db_name" {
  description = "MySQL database name"
  type        = string
  default     = "bookstore"
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
  # No default – always pass via -var or terraform.tfvars

}



