# ==============================================================================
# COMPLIANCE MODULE VARIABLES - ENTERPRISE SERVERLESS ARCHITECTURE
# ==============================================================================
# This file defines input variables for the AWS Config compliance module
# Variables control Config rules, delivery settings, and security configurations
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
  description = "Common tags applied to all compliance resources"
  type        = map(string)
  default     = {}
}

# AWS Config Configuration
variable "config_recorder_name" {
  description = "Name of the AWS Config Recorder"
  type        = string
  default     = "default"
}

variable "include_global_resource_types" {
  description = "Whether to include global resource types in Config recording"
  type        = bool
  default     = true
}

variable "all_supported" {
  description = "Record all supported resource types in Config"
  type        = bool
  default     = true
}

# Delivery Channel Configuration
variable "delivery_frequency" {
  description = "Frequency for Config snapshot delivery"
  type        = string
  default     = "TwentyFour_Hours"

  validation {
    condition     = contains(["One_Hour", "Three_Hours", "Six_Hours", "Twelve_Hours", "TwentyFour_Hours"], var.delivery_frequency)
    error_message = "Delivery frequency must be One_Hour, Three_Hours, Six_Hours, Twelve_Hours, or TwentyFour_Hours."
  }
}

variable "config_s3_bucket_name" {
  description = "S3 bucket name for Config delivery"
  type        = string
  default     = ""
}

variable "config_sns_topic_arn" {
  description = "SNS topic ARN for Config notifications"
  type        = string
  default     = ""
}

# Config Rules Configuration
variable "enable_lambda_security_rules" {
  description = "Enable Lambda function security compliance rules"
  type        = bool
  default     = true
}

variable "enable_dynamodb_backup_rules" {
  description = "Enable DynamoDB backup and recovery compliance rules"
  type        = bool
  default     = true
}

variable "enable_api_gateway_rules" {
  description = "Enable API Gateway logging and security rules"
  type        = bool
  default     = true
}

# Security Hub Configuration
variable "enable_security_hub" {
  description = "Enable AWS Security Hub for centralized security findings"
  type        = bool
  default     = true
}

variable "security_standards" {
  description = "List of security standards to enable in Security Hub"
  type        = list(string)
  default     = ["AWS Foundational Security Best Practices v1.0.0"]
}

# Compliance Reporting
variable "compliance_notification_emails" {
  description = "List of email addresses for compliance notifications"
  type        = list(string)
  default     = []
}