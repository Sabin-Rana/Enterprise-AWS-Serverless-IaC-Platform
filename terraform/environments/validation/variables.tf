# ==============================================================================
# VARIABLES - ZERO-COST VALIDATION CONFIGURATION
# ==============================================================================
# Variable definitions for enterprise serverless architecture.
# These values are used in Terraform planning but create ZERO resources
# due to count = 0 safety mechanism in all modules.
# ==============================================================================

# Project Configuration
variable "project_name" {
  description = "Name prefix for all AWS resources"
  type        = string
  default     = "enterprise-serverless"
}

variable "environment" {
  description = "Deployment environment (validation/development/staging/production)"
  type        = string
  default     = "validation"
}

variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

# API Gateway Configuration
variable "api_gateway_name" {
  description = "Name of the API Gateway REST API"
  type        = string
  default     = "main-api"
}

# Lambda Configuration
variable "lambda_runtime" {
  description = "Lambda function runtime"
  type        = string
  default     = "nodejs18.x"
}

variable "lambda_memory_size" {
  description = "Memory size for Lambda functions in MB"
  type        = number
  default     = 128
}

# DynamoDB Configuration
variable "dynamodb_table_name" {
  description = "Name of the main DynamoDB table"
  type        = string
  default     = "application-data"
}

# Cognito Configuration
variable "cognito_user_pool_name" {
  description = "Name of the Cognito User Pool"
  type        = string
  default     = "user-authentication"
}

# Tags
variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    Project     = "Enterprise-Serverless"
    Environment = "validation"
    ManagedBy   = "terraform"
    CostCenter  = "validation-zero-cost"
  }
}