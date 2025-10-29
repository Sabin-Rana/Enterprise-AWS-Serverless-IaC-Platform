# ==============================================================================
# STORAGE MODULE VARIABLES - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This file defines input variables for the S3 and CloudFront module configuration
# Variables control bucket naming, domain configuration, and CDN settings
# ==============================================================================

# Project Configuration
variable "project_name" {
  description = "Project name for resource naming and tagging"
  type        = string
}

variable "environment" {
  description = "Environment for resource naming and tagging"
  type        = string
}

variable "tags" {
  description = "Common tags applied to all storage resources"
  type        = map(string)
  default     = {}
}

# S3 Bucket Configuration
variable "bucket_name" {
  description = "Name of the S3 bucket for frontend hosting"
  type        = string
  default     = ""
}

# CloudFront Configuration
variable "custom_domains" {
  description = "List of custom domains for CloudFront distribution"
  type        = list(string)
  default     = []
}

variable "price_class" {
  description = "CloudFront price class for cost optimization"
  type        = string
  default     = "PriceClass_All"
}

# SSL Certificate Configuration
variable "acm_certificate_arn" {
  description = "ARN of ACM certificate for custom domain SSL"
  type        = string
  default     = ""
}

# Region Configuration
variable "region" {
  description = "AWS region for resource deployment"
  type        = string
  default     = "us-east-1"
}