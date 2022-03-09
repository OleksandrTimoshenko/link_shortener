variable "aws_access_key" {
  description = "Access key to your AWS account "
}

variable "aws_secret_key" {
  description = "Secret key to your AWS account "
}

variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  default     = "TEST"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "db_name" {
  description = "AWS RDS DB user"
  type = string
  default = "postgres"
}

variable "db_user" {
  description = "AWS RDS DB user"
  type = string
  default = "postgres"
}

variable "db_password" {
  description = "AWS RDS DB password"
  sensitive = true
  type = string
}
