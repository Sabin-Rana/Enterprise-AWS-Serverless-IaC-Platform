# ==============================================================================
# API MODULE VARIABLES - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This file defines input variables for the API Gateway and Lambda module configuration
# Variables control API configuration, Lambda settings, and integration parameters
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
  description = "Common tags applied to all API and Lambda resources"
  type        = map(string)
  default     = {}
}

# API Gateway Configuration
variable "api_name" {
  description = "Name of the API Gateway REST API"
  type        = string
  default     = "serverless-portfolio-api"
}

variable "region" {
  description = "AWS region for API Gateway deployment"
  type        = string
  default     = "us-east-1"
}

# Lambda Function Configuration
variable "lambda_deployment_package" {
  description = "Path to Lambda function deployment package"
  type        = string
  default     = "placeholder.zip"
}

variable "dynamodb_table_name" {
  description = "Name of DynamoDB table for Lambda function access"
  type        = string
  default     = "posts-table"
}

# Lambda Performance Configuration
variable "lambda_memory_size" {
  description = "Memory allocation for Lambda functions in MB"
  type        = number
  default     = 128
}

variable "lambda_timeout" {
  description = "Timeout duration for Lambda functions in seconds"
  type        = number
  default     = 10
}